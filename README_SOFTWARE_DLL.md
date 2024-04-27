Software Readme: Section for External DLL Library

The developed custom DLL library is responsible, on each measurement trial, for the following:
(a) Accepting as inputs the four microphone sensitivities and four voltage-value sound-input arrays.
(b) Computing automatically and returning the following items:

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

Within LabVIEW, the DLL is called by an instance of the ‘Call External Library’ node, which is configured with the following options:
(a) The ‘stdcall (WINAPI)’ calling convention, as opposed to the ‘C’ convention that requires memory management to occur entirely within LabVIEW.
(b) The ‘run in any thread’ threading-behavior option, as opposed to the alternative option that restricts activity to the UI thread.
Especially important for the proper interoperation of LabVIEW and the custom DLL is the internal specification (also within the options of the library node) of an appropriate minimum size of each array passed into the node as an input, the reason being that arrays generated in LabVIEW cannot be dynamically resized by the *.dll entry function in C++.

The DLL is compiled from a custom C++ script and a static build of the freely available FFTW C library (version 3.3.10). Should a rebuild of the DLL be required (on a Windows machine, for which the OBSIDAS was designed), the complete process is as follows:
Step 1: install MinGW for usage of GCC (GNU Compiler Collection).
Step 2: install MSYS for usage of Bash within PowerShell.
Step 3: edit system’s (i.e., the computer’s) environment variables to enable the in-shell recognition of commands without the required entry of their complete file paths for each separate instance; inside PATH, the default Windows paths are by default listed prior to the MSYS binaries, resulting in object-name conflicts between utilities built into Windows and those affiliated with Unix, and accordingly moving the latter path (likely C:\MinGW\msys\1.0\bin) to the top of the list resolves this problem.
Step 4: download FFTW (version 3.3.10) source code from website, and configure (i.e., run ‘./configure’ command) with the following options, which results in a static FFTW file (of extension *.a):
     --with-our-malloc16
     --with-windows-f77-mangling
     --disable-shared
     --enable-static
     --enable-threads
     --with-combined-threads
     --enable-portable-binary
     --enable-sse2
     --with-incoming-stack-boundary=2
Step 5: compile the C++ source code (mainSource.cpp, located in libs/To Create Library in the OBSIDAS github) with the static FFTW (*.a) file into a shared library file of extension *.dll.
Step 6: within the library node of the main LabVIEW virtual instrument, specify the absolute filepath to the newly created *.dll.

Within the C++ code (mainSource.cpp), the main entry function by which LabVIEW sends data into the script and retrieves data from it is titled ‘process()’. This function employs the custom helper methods also defined in the script in order to perform all required computations. First computed is a discrete Fourier transform (DFT) for each sound-input array (see ‘getDFTs’), via methods that implement DFT computation through the FFTW library functions with the following options:
     Interface: basic (advanced interface results in increased computation times)
     Constructor: fftw_plan_r2r_1d (real-to-real, one-dimensional)
     Constructor flag: R2HC (half-complex output format, exploiting Hermitian redundancy in    
     output)
     Algorithm-restriction flag: none
     Planning-rigor flag: FFTW_ESTIMATE
     Planning-time limitation: none
These options were determined to result in a maximally efficient algorithm, with a C++-internal DFT-computation time of approximately 40 ms.

Subsequent to DFT computation are the computations both of sound pressure levels and of magnitude-squared coherences, all following standard mathematical definitions (of special importance is Parseval’s theorem, by which RMS voltages are computed from DFT coefficients). Further details may be found within the script itself.
