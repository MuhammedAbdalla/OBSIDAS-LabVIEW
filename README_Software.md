# OBSIDAS LabVIEW Software & Modules
## Main LabVIEW VI

## User Interface VI
The user interface consists of three general sections: on the left are controls for input-device selection and for measurement-trial configuration and initiation, including spaces to define trial duration and microphone sensitivities; on the right is a preview of the information to be exported in *.csv form; and in the center are graphs generated from recorded input data of the previous trial, each of which displays for a single microphone one of the following items (selectable by the user):

     1. Plot of raw signal (amplitude vs. time)
     2. Plot of Fourier Transform (positive-frequency half of spectrum)
     3. Table of sound pressure levels (of unit dB), in ⅓-octave bands
     4. Full-spectrum averages of single-band sound pressure levels and of RMS voltages


## External DLL Library
The developed custom DLL library is responsible, on each measurement trial, for the following: <br>
      
    (a) Accepting as inputs the four microphone sensitivities and four voltage-value sound-input arrays. <br>
    (b) Computing automatically and returning the following items: <br>

	  In ⅓-octave bands, with centers from 250–5040 Hz:
	    (quantities are of 14-element arrays, each element corresponding to a single ⅓-octave band)
        1. Single-microphone sound pressure levels (x4)
 	      2. Single-probe sound pressure levels (x2), each probe being a pair of colocated microphones
 	      3. Overall (all-microphone) sound pressure levels (x2)
 	      4. Inter-microphone (single-probe) magnitude-squared coherences (x2)

	    For the entire frequency spectrum:
 	      5. Single-probe sound pressure levels (x2)
 	      6. Overall sound pressure levels (x1)
 	      7. A-weighted versions of (5) and (6) above

### Acquisition Interface
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/76fc3e26-9483-42fb-8653-17237035d64f)

### Raw Signal Plot
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/25faace1-e279-4a77-9d28-797af8835120)

### RMS & SPL Graphs
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/818a0348-36e3-4ade-b056-f1be4a6d2db5)

### SPL Data
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/86f11091-6a82-4686-816e-a40c96bc88d2)

### FFT plot
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/1fb15d40-e4da-4c8f-a792-9d5d4ffa0e49)

Within LabVIEW, the DLL is called by an instance of the ‘Call External Library’ node, which is configured with the following options: <br>
(a) The ‘stdcall (WINAPI)’ calling convention, as opposed to the ‘C’ convention that requires memory management to occur entirely within LabVIEW. <br>
(b) The ‘run in any thread’ threading-behavior option, as opposed to the alternative option that restricts activity to the UI thread. <br>
Especially important for the proper interoperation of LabVIEW and the custom DLL is the internal specification (also within the options of the library node) of an appropriate minimum size of each array passed into the node as an input, the reason being that arrays generated in LabVIEW cannot be dynamically resized by the *.dll entry function in C++. <br>

The DLL is compiled from a custom C++ script and a static build of the freely available FFTW C library (version 3.3.10). Should a rebuild of the DLL be required (on a Windows machine, for which the OBSIDAS was designed), the complete process is as follows:


    1. install MinGW for usage of GCC (GNU Compiler Collection).
    2. install MSYS for usage of Bash within PowerShell.
    3. edit system’s (i.e., the computer’s) environment variables to enable the in-shell recognition of commands without the required entry of their complete file paths for each separate instance; inside PATH, the default Windows paths are by default listed prior to the MSYS binaries, resulting in object-name conflicts between utilities built into Windows and those affiliated with Unix, and accordingly moving the latter path (likely C:\MinGW\msys\1.0\bin) to the top of the list resolves this problem.
    4. download FFTW (version 3.3.10) source code from website, and configure (i.e., run ‘./configure’ command) with the following options, which results in a static FFTW file (of extension *.a): <br>
    --with-our-malloc16 <br>
    --with-windows-f77-mangling 
    --disable-shared
    --enable-static
    --enable-threads
    --with-combined-threads
    --enable-portable-binary
    --enable-sse2
    --with-incoming-stack-boundary=2
    5. compile the C++ source code (mainSource.cpp, located in libs/To Create Library in the OBSIDAS github) with the static FFTW (*.a) file into a shared library file of extension *.dll.
    6. within the library node of the main LabVIEW virtual instrument, specify the absolute filepath to the newly created *.dll.

Within the C++ code (mainSource.cpp), the main entry function by which LabVIEW sends data into the script and retrieves data from it is titled ‘process()’. 
