# OBSIDAS-LabVIEW
## Overview
This is the LabVIEW implementation of On-Board Sound Intensity Data Aquisition System (OBSIDAS). The project consists of a main Virtual Instrument (VI) along with SubVIs to complete specific tasks. <br> 
The application.vi is the start up screen when running the executable. <br> 
The User Interface consists of two tabs: Acquisition and Results <br>
#### Prequisites
1. LabVIEW 2024 Q1 Full or Professional
2. LabVIEW Runtime 2024 Q1
3. LabVIEW Sound & Vibrations Toolkit 2023 Q3
4. LabVIEW Application Builder Addon
5. **NI-DAQmx 2024 Q1**
### Acquisition Tab
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/2f078e2b-07c7-4a50-9f92-2528a0201b03) <br>
##### Acquisition source
1. Device Acquisition (DAQ mode)
2. File input to reprocess
##### Sample Clock
For LabVIEW DAQ applications, we need to specify the sample rate, size and task before reading voltages from the analog inputs <br>
Default is TRUE <br>
##### Stop
##### Timestamp
##### Trial Length (S)
in seconds, indicate time length of the Data Acquisition
##### File Name
indicate the name of the .csv file produced when application finishes processes <br>
default file name "unnamed_raw_acquisition.csv"
##### Channels
1. Channel for Lead In microphone connected to USB-4431 ai0
2. Channel for Lead Out microphone connected to USB-4431 ai1
3. Channel for Trail In microphone connected to USB-4431 ai2
4. Channel for Trail Out microphone connected to USB-4431 ai3
##### Write Path
path indicated the location of the saved file
##### Progress %
1. DAQ mode: current duration / trial length x 100
2. File Input: current index / # samples collected x 100
##### Charts
1. ai0 - Lead In probe
2. ai1 - Lead Out probe
3. ai2 - Trail In probe
4. ai3 - Trail Out probe
##### File Preview
preview the header and first contents of the saved raw output file

### Results Tab
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/05029793-926b-4cd4-b326-67569b0ddfb8) <br>
**There 4 graphs to represent the 4 probes connected to the device. Each graph has the same subtabs, for processed results**
##### Raw Signal Tab
##### FFT Tab
##### RMS Graph Tab
##### SPL Tab
##### SPL Data
##### Full Spectrum Data

### Blockers
Things to look out for when developing on LabVIEW in genral is to get the software early. Get a dedicated machine with all the necessary packages <br>
LabVIEW needed to be shared with a team, so installing on a single desktop with Remote Desktop access is feasible <br>
LabVIEW 2017 did not recognize the compatible versions of NI-DAQmx (20.7 & 20.1) installed <br>
Version control was kept through multiple folders; no more than one person can edit at a time <br>
Development progressed on LabVIEW 2024. Downgrade OBSIDAS.lvproj to allow all VI files to be 2017 compatible <br>
User needs to make sure all appropriate packages, modules and addons are compatible with LabVIEW 2017 before compiling with Build EXE <br>

![WhatsApp Image 2024-04-26 at 20 27 33_1eb44e25](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/59de0bbc-139a-4f7e-9e00-27a83210556b) <br>
**ALL VI FILES ARE COMPATIBLE WITH LABVIEW 2017, <br> THE CURRENT EXE IS COMPILED ON LABVIEW 2024, REQUIRING LABVIEW RUNTIME 2024**

