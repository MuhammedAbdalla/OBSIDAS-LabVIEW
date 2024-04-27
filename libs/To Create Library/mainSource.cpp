#include <iostream>
#include <iomanip>
#include <vector>
#include <complex>
#include <cmath>
#include <random>
#include <chrono>
using namespace std;
using namespace chrono;

#include <fftw3.h>
//#include <sndfile.h>


double getCoeffA(double f) {
    double sq = pow(f,2);
	double num = pow(12194,2)*pow(f,4);
	double denom = (sq+pow(20.599,2)) * sqrt((sq+pow(107.65,2))*(sq+pow(737.86,2))) * (sq+pow(12194,2));
	return num/denom;
}

vector<double> weightA(const vector<double>& unw) {
    vector<double> CFs;
    for (int i = -6; i <= 7; i++) {
	CFs.push_back(1000.0*pow(2.0,static_cast<double>(i)/3.0));
    }
    vector<double> w(unw.size());
    double refWeight = getCoeffA(1000.0);
    int len = CFs.size();
    for (int i = 0; i < len; i++) {
	double R = getCoeffA(CFs[i]);
	double diff = 20.0*log10(R) - 20.0*log10(refWeight);
	w[i] = unw[i]+diff;
    }

    return w;
}

template <typename T>
complex<double> mean(const vector<T>& vec) {
    return accumulate(vec.begin(), vec.end(), complex<double>(0.0,0.0)) / static_cast<double>(vec.size());
}

template <typename T>
vector<complex<T>> conj(const vector<complex<T>>& v) {
    size_t len = v.size();
    vector<complex<T>> res(len);
    for (size_t i = 0; i < len; i++) {
	res[i] = conj(v[i]);
    }
    return res;
}

//for elementwise multiplication
template <typename T>
vector<complex<T>> operator*(const vector<complex<T>>& v1, const vector<complex<T>>& v2) {
    size_t len = v1.size();
    vector<complex<T>> res(len);
    for (size_t i = 0; i < len; i++) {
	res[i] = v1[i] * v2[i];
    }
    return res;
}

double getCoherence(const vector<complex<double>>& inDFT_mic1, const vector<complex<double>>& inDFT_mic2) {
    size_t dftLen = inDFT_mic1.size();
    //cross power spectral density
    complex<double> cpsd = mean(inDFT_mic1 * conj(inDFT_mic2));
    //auto power spectral density
    complex<double> apsd1 = mean(inDFT_mic1 * conj(inDFT_mic1));
    complex<double> apsd2 = mean(inDFT_mic2 * conj(inDFT_mic2));
    //2nd order coherence (intensity-intensity correlation, not amplitude-amplitude)
    double msc;
    msc = abs(cpsd)*abs(cpsd)/(abs(apsd1)*abs(apsd2));
    return msc;
}

vector<double> getCoherenceInBands(const vector<complex<double>>& inDFT_mic1, const vector<complex<double>>& inDFT_mic2, double sampleRate) {
    size_t dftLen = inDFT_mic1.size();
    vector<double> mscBands;

    //find bin width in Hz per bin
    double binWidth = sampleRate / dftLen;

    vector<double> CFs;
    for (int i = -6; i <= 7; i++) {
	CFs.push_back(1000.0*pow(2.0,static_cast<double>(i)/3.0));
    }

    for (double cf : CFs) {
        double lower = cf / pow(2.0, 1.0/6.0); // lower bound
        double upper = cf * pow(2.0, 1.0/6.0); // upper bound

        //convert cutoff freqs to bin indices
        int lowerBin = static_cast<int>(lower/binWidth);
        int upperBin = static_cast<int>(upper/binWidth);

	vector<complex<double>> mic1Band(inDFT_mic1.begin()+lowerBin, inDFT_mic1.begin()+upperBin+1);
	vector<complex<double>> mic2Band(inDFT_mic2.begin()+lowerBin, inDFT_mic2.begin()+upperBin+1);

	//complex<double> cpsdBand = mean(mic1Band*conj(mic2Band));
	//complex<double> apsd1Band = mean(mic1Band*conj(mic1Band));
	//complex<double> apsd2Band = mean(mic2Band*conj(mic2Band));
	
	//mscBands.push_back(abs(cpsdBand)*abs(cpsdBand)/(abs(apsd1Band)*abs(apsd2Band)));
	mscBands.push_back(getCoherence(mic1Band,mic2Band));
    }
    return mscBands;
}

//to compute single-band RMS values (inDFT is DFT of input containing sound data)
vector<double> getRMS(const vector<complex<double>>& inDFT, double sampleRate) {
    vector<double> rmsVals;
    
    // The number of samples in the FFT data
    size_t dftLen = inDFT.size();
    
    //squared magnitude of each FFT bin (Parseval's thm)
    vector<double> magSq(dftLen);
    for (size_t i = 0; i < dftLen; i++) {
        magSq[i] = norm(inDFT[i]);
    }

    //find bin width in Hz per bin
    double binWidth = sampleRate / (2*(dftLen-1));

    vector<double> CFs;
    for (int i = -6; i <= 7; i++) {
	CFs.push_back(1000.0*pow(2.0,static_cast<double>(i)/3.0));
    }

    for (double cf : CFs) {
        double lower = cf / pow(2.0, 1.0/6.0); // lower bound
        double upper = cf * pow(2.0, 1.0/6.0); // upper bound

        //convert cutoff freqs to bin indices
        int lowerBin = static_cast<int>(lower/binWidth);
        int upperBin = static_cast<int>(upper/binWidth);

        //sum over all bins within band
        double rms = 0.0;
        for (int i = lowerBin; i <= upperBin; i++) {
            rms += magSq[i];
        }
	//normalize
        rms = sqrt(rms/(upperBin-lowerBin+1));

        rmsVals.push_back(rms);
    }

    return rmsVals;
}

vector<complex<double>> getDFT_r2c(const vector<double>& input) {
    int dftLen = input.size();
    double *in = (double*)fftw_malloc(sizeof(fftw_complex) * dftLen);
    fftw_complex *out = (fftw_complex*)fftw_malloc(sizeof(fftw_complex) * dftLen);

    //'r2c' transform produces a complex output with Hermitian redundancy
    fftw_plan plan = fftw_plan_dft_r2c_1d(dftLen, in, out, FFTW_MEASURE);
    for (int i = 0; i < dftLen; i++) {
	in[i] = input[i];
    }

    fftw_execute(plan);

    vector<std::complex<double>> cDFT(dftLen);
    for (int i = 0; i < dftLen; i++) {
        cDFT[i] = complex<double>(out[i][0], out[i][1]);
    }

    //positive frequencies only
    vector<complex<double>> halfP(dftLen/2 + 1);
    halfP[0] = cDFT[0];
    for (int i = 1; i < dftLen/2; i++) {
	halfP[i] = sqrt(2.0)*cDFT[i];
    }
    halfP[dftLen/2] = cDFT[dftLen/2];
    
    return halfP;
}

vector<complex<double>> getDFT_r2hc(const vector<double>& input) {
    int dftLen = input.size();
    double *in = (double*)fftw_malloc(sizeof(fftw_complex) * dftLen);
    double *outR = (double*)fftw_malloc(sizeof(fftw_complex) * dftLen);

    //'r2hc' this time, without Hermitian redundancy
    fftw_plan plan = fftw_plan_r2r_1d(dftLen, in, outR, FFTW_R2HC,FFTW_MEASURE);
    for (int i = 0; i < dftLen; i++) {
	in[i] = input[i];
    }

    fftw_execute(plan);
    
    vector<std::complex<double>> cDFT(dftLen);
    for (int i = 0; i < dftLen/2+1; i++) {
        cDFT[i] = complex<double>(outR[i], outR[dftLen/2 + 1]);
    }

    vector<complex<double>> halfP(dftLen/2 + 1);
    halfP[0] = cDFT[0];
    for (int i = 1; i < dftLen/2; i++) {
	halfP[i] = sqrt(2.0)*cDFT[i];
    }
    halfP[dftLen/2] = cDFT[dftLen/2];

    fftw_destroy_plan(plan);
    fftw_free(in);
    fftw_free(outR);
    
    return halfP;
}

vector<vector<complex<double>>> getDFTs(const vector<vector<double>>& input) {
    int dftLen = input[0].size();

    double *in = (double*)fftw_malloc(sizeof(fftw_complex) * dftLen);
    double *outR = (double*)fftw_malloc(sizeof(fftw_complex) * dftLen);

    fftw_plan plan = fftw_plan_r2r_1d(dftLen, in, outR, FFTW_R2HC, FFTW_ESTIMATE);

    vector<vector<complex<double>>> halfP(4, vector<complex<double>>(dftLen/2 + 1));

    //always 4 channels
    for (int j = 0; j < 4; j++) {

    for (int i = 0; i < dftLen; i++) {
	in[i] = input[j][i];
    }

    fftw_execute(plan);
    
    vector<std::complex<double>> cDFT(dftLen);
    for (int i = 0; i < dftLen/2+1; i++) {
        cDFT[i] = complex<double>(outR[i], outR[dftLen/2 + i]);
    }

    halfP[j][0] = cDFT[0];
    for (int i = 1; i < dftLen/2; i++) {
	halfP[j][i] = sqrt(2.0)*cDFT[i];
    }
    halfP[j][dftLen/2] = cDFT[dftLen/2];

    }

    fftw_destroy_plan(plan);
    fftw_free(in);
    fftw_free(outR);
    
    return halfP;
}

vector<double> getSeq(const char* fname, double& sampleRate) {
//    SF_INFO sfinfo;
//    SNDFILE* file = sf_open(fname, SFM_READ, &sfinfo);
//    vector<double> dat(sfinfo.frames*sfinfo.channels);
//    sf_readf_double(file, dat.data(), sfinfo.frames);
//    sf_close(file);
//    if (sfinfo.samplerate != sampleRate) {
//        cerr << "error: SR mismatch" << endl;
//    }

    vector<double> dat;
    return dat;
}

//in-place rounding to fix precision at 1 decimal place
void roundToTenth(vector<double>& in) {
    for (double& val:in) {
	val = (double)round(val*10.0)/10.0;
    }
}

vector<vector<double>> logAvg2(const vector<vector<double>>& alldB) {
    vector<vector<double>> probedB(2, vector<double>(alldB[0].size()));
    int len = alldB[0].size();
    for (int i = 0; i < len; i++) {
	probedB[0][i] = 20.0*log10(0.5*(pow(10,alldB[0][i]/20.0)+pow(10,alldB[1][i]/20.0)));
	probedB[1][i] = 20.0*log10(0.5*(pow(10,alldB[2][i]/20.0)+pow(10,alldB[3][i]/20.0)));
    }
    return probedB;
}

vector<double> logAvg(const vector<vector<double>>& alldB) {
    int len = alldB[0].size();
    vector<double> avgdB(len);
    for (int i = 0; i < len; i++) {
	avgdB[i] = 20.0*log10(0.5*(pow(10,alldB[0][i]/20.0)+pow(10,alldB[1][i]/20.0)));
    }
    return avgdB;
}

double logSum(const vector<double>& levs) {
    int len = levs.size();
    double lev = 0.0;
    for (int i = 0; i < len; i++) {
	lev += pow(10,levs[i]/20.0);
    }
    lev = 20.0*log10(lev);
    return lev;
}


struct ProcRes {
    double* data;
    size_t size;
};

//#ifdef _WIN32
//    #define EXPORT __declspec(dllexport)
//#else
//    #define EXPORT
//#endif

extern "C" { void process(
	double* leadIn, 
	double* leadOut,
	double* trailIn,
	double* trailOut,
	int arrSize,
	double* mvpas,
	double* out1,
	double* out2,
	double* out3,
	double* out4,
	double* out5,
	double* out6,
	double* out7,
	double* out8,
	double* out9,
	double* out10,
	double* out11,
	double* out12,
	double* out13) {

    //ProcRes res;
    //res.size = 129;
    //res.data = new double[129];

    double sampleRate = 16384.0;
    double nsamps = (double)arrSize;

    vector<double> sensitivities = {mvpas[0], mvpas[1], mvpas[2], mvpas[3]};

    vector<vector<double>> allChan(4, vector<double>((int)nsamps));
    //copy(leadIn,leadIn+(int)nsamps,allChan[0].begin());
    allChan[0] = vector<double>(leadIn,leadIn+(int)nsamps);
    allChan[1] = vector<double>(leadOut,leadOut+(int)nsamps);
    allChan[2] = vector<double>(trailIn,trailIn+(int)nsamps);
    allChan[3] = vector<double>(trailOut,trailOut+(int)nsamps);

    vector<vector<complex<double>>> allDFTs = getDFTs(allChan);

    vector<double> CFs;
    for (int i = -6; i <= 7; i++) {
	CFs.push_back(1000.0*pow(2.0,static_cast<double>(i)/3.0));
    }
    int nBands = CFs.size();
    
    //compute 1/3-octave levels in dB
    vector<vector<double>> alldB(4);
    vector<vector<double>> probedB(2);
    vector<double> overalldB;
    for (int j = 0; j < 4; j++) {
    vector<double> rmsVals = getRMS(allDFTs[j], sampleRate);
    vector<double> dBVals;
    for (size_t i = 0; i < rmsVals.size(); i++) {
        double dB = 20.0 * log10(rmsVals[i]/(sensitivities[j]/1000.0)/0.00002);
	dBVals.push_back(dB);
    }
    alldB[j] = dBVals;
    }
    probedB = logAvg2(alldB);
    overalldB = logAvg(probedB);

    //compute entire-spectrum levels in dB
    vector<double> specdB_probe(2);
    specdB_probe[0] = logSum(probedB[0]);
    specdB_probe[1] = logSum(probedB[1]);
    double specdB = logSum(overalldB);

    //compute 1/3-octave coherences
    vector<double> mscValsL = getCoherenceInBands(allDFTs[0],allDFTs[1],sampleRate);
    vector<double> mscValsT = getCoherenceInBands(allDFTs[2],allDFTs[3],sampleRate);

    vector<double> wBands = weightA(overalldB);
    double wSpec = logSum(wBands);

    //set precision for all values
    roundToTenth(alldB[0]);
    roundToTenth(alldB[1]);
    roundToTenth(alldB[2]);
    roundToTenth(alldB[3]);
    roundToTenth(probedB[0]);
    roundToTenth(probedB[1]);
    roundToTenth(overalldB);
    roundToTenth(mscValsL);
    roundToTenth(mscValsT);
    roundToTenth(specdB_probe);
    specdB = (double)round(specdB*10.0)/10.0;
    roundToTenth(wBands);
    wSpec = (double)round(wSpec*10.0)/10.0;

    copy(alldB[0].begin(),alldB[0].end(),out1);
    copy(alldB[1].begin(),alldB[1].end(),out2);
    copy(alldB[2].begin(),alldB[2].end(),out3);
    copy(alldB[3].begin(),alldB[3].end(),out4);
    copy(probedB[0].begin(),probedB[0].end(),out5);
    copy(probedB[1].begin(),probedB[1].end(),out6);
    copy(overalldB.begin(), overalldB.end(),out7);
    copy(mscValsL.begin(),mscValsL.end(),out8);
    copy(mscValsT.begin(),mscValsT.end(),out9);
    copy(specdB_probe.begin(),specdB_probe.end(),out10);
    out11[0] = specdB;
    copy(wBands.begin(), wBands.end(),out12);
    out13[0] = wSpec;

    return;
}
}

//extern "C" EXPORT void freeRes(ProcRes res) {
//    delete[] res.data;
//}

int main() {

    double sampleRate = 16384.0;
    double trialDur = 5;
    double nsamps = sampleRate*trialDur;

    vector<double> sensitivities = {25.0, 25.0, 25.0, 25,0};

    //input sequence to be passed from labVIEW
    vector<vector<double>> allChan(4, vector<double>(nsamps));

    vector<string> stimTypes = {"OBSI", "cal094dB"};
    string stimType = stimTypes[0];

    allChan[0] = getSeq(("audio_" + stimType + "_LeadIn.wav").c_str(),sampleRate);
    allChan[1] = getSeq(("audio_" + stimType + "_LeadOut.wav").c_str(),sampleRate);
    allChan[2] = getSeq(("audio_" + stimType + "_TrailIn.wav").c_str(),sampleRate);
    allChan[3] = getSeq(("audio_" + stimType + "_TrailOut.wav").c_str(),sampleRate);

    vector<vector<complex<double>>> allDFTs = getDFTs(allChan);


    //white Gaussian noise for testing
    //random_device rd;
    //mt19937 gen(rd());
    //normal_distribution<> dis(0.0, 1.0);
    //for (int j = 0; j < 4; j++) {
    //for (int i = 0; i < nsamps; i++) {
    //    allChan[j][i] = dis(gen);
    //	  //soundData.push_back(dis(gen));
    //}
    //}

    //vector<double> soundData = allChan[2];
    //vector<double> soundData2 = allChan[3];
    

    vector<double> CFs;
    for (int i = -6; i <= 7; i++) {
	CFs.push_back(1000.0*pow(2.0,static_cast<double>(i)/3.0));
    }
    int nBands = CFs.size();


    //auto start = high_resolution_clock::now();
    //vector<complex<double>> halfP = getDFT_r2c(soundData);
    //auto end = high_resolution_clock::now();
    //auto r2cTime = duration_cast<microseconds>(end-start);

    //start = high_resolution_clock::now();
    //halfP = getDFT_r2hc(soundData);
    //end = high_resolution_clock::now();
    //auto r2hcTime = duration_cast<microseconds>(end-start);


    //compute 1/3-octave levels in dB
    vector<vector<double>> alldB(4);
    vector<vector<double>> probedB(2);
    vector<double> overalldB;
    for (int j = 0; j < 4; j++) {
    vector<double> rmsVals = getRMS(allDFTs[j], sampleRate);
    vector<double> dBVals;
    for (size_t i = 0; i < rmsVals.size(); i++) {
        double dB = 20.0 * log10(rmsVals[i]/(sensitivities[j]/1000.0));
	dBVals.push_back(dB);
    }
    alldB[j] = dBVals;
    }
    probedB = logAvg2(alldB);
    overalldB = logAvg(probedB);

    //compute entire-spectrum levels in dB
    vector<double> specdB_probe(2);
    specdB_probe[0] = logSum(probedB[0]);
    specdB_probe[1] = logSum(probedB[1]);
    double specdB = logSum(overalldB);


    //compute 1/3-octave coherences
    vector<double> mscValsL = getCoherenceInBands(getDFT_r2c(allChan[0]),getDFT_r2c(allChan[1]),sampleRate);
    vector<double> mscValsT = getCoherenceInBands(getDFT_r2c(allChan[2]),getDFT_r2c(allChan[3]),sampleRate);


    vector<double> wBands = weightA(overalldB);
    double wSpec = logSum(wBands);


    //set precision for all values
    roundToTenth(alldB[0]);
    roundToTenth(alldB[1]);
    roundToTenth(alldB[2]);
    roundToTenth(alldB[3]);
    roundToTenth(probedB[0]);
    roundToTenth(probedB[1]);
    roundToTenth(overalldB);
    roundToTenth(mscValsL);
    roundToTenth(mscValsT);
    roundToTenth(specdB_probe);
    specdB = (double)round(specdB*10.0)/10.0;
    roundToTenth(wBands);
    wSpec = (double)round(wSpec*10.0)/10.0;

    

    for (int i = 0; i < nBands; i++) {
	cout << fixed << setprecision(2);
	cout << "Band @ " << CFs[i] << " Hz: " << endl;
	cout << setprecision(1);
	cout << "\tdB SPL (LI): " << alldB[0][i] << endl;
	cout << "\tdB SPL (LO): " << alldB[1][i] << endl;
	cout << "\tdB SPL (TI): " << alldB[2][i] << endl;
	cout << "\tdB SPL (TO): " << alldB[3][i] << endl;
	cout << "\tdB SPL (LP): " << probedB[0][i] << endl;
	cout << "\tdB SPL (TP): " << probedB[1][i] << endl;
	cout << "\tdB SPL (all): " << overalldB[i] << endl;
	cout << "\tdB(A) (all): " << wBands[i] << endl;
	cout << "\tMSC (LP): " << mscValsL[i] << endl;
	cout << "\tMSC (TP): " << mscValsT[i] << "\n" << endl;
    }
    cout << "Entire spectrum: " << endl;
    cout << "\tdB SPL (LP): " << specdB_probe[0] << endl;
    cout << "\tdB SPL (TP): " << specdB_probe[1] << endl;
    cout << "\tdB SPL (all): " << specdB << endl;
    cout << "\tdB(A) (all): " << wSpec << endl;

    return 0;
}
