# OBSIDAS Hardware & Equipment
**The following hardware items together constitute the input-signal chain of the OBSIDAS in the form of a quad-microphone sensor array (quantities are indicated in parentheses):**

  1. [GRAS 26AK preamplifiers](https://www.grasacoustics.com/products/preamplifiers-for-microphone-cartridge/traditional-power-supply-lemo/product/210-26ak) (x4)
  2. [GRAS 40AI externally polarized paired microphones](https://www.grasacoustics.com/products/special-microphone/intensity-microphones/product/170-40ai) (x4; i.e, 2 pairs)
  3. [GRAS 12AQ 2-channel power modules](https://www.grasacoustics.com/products/product/228-12AQ) (x2)
  4. [Brüel and Kjær 4231 calibrator](https://www.bksv.com/en/transducers/acoustic/calibrators/sound-calibrator-4231?utm_source=google&utm_medium=cpc&utm_campaign=mc_us_brand&utm_term=b%26k%20type%204231&utm_campaign=Brand_B%26K_Generic_BMM&utm_source=adwords&utm_medium=ppc&hsa_acc=2399425841&hsa_cam=1599237722&hsa_grp=67083438439&hsa_ad=462807088545&hsa_src=g&hsa_tgt=kwd-386688049581&hsa_kw=b%26k%20type%204231&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gad_source=1&gclid=CjwKCAjwoa2xBhACEiwA1sb1BM8JlCWUKW5Xb9Jxmr4JGAevUaYF0Z1SKAXfOu81x8kjVfoWjZyZGhoCkW4QAvD_BwE) (x1)
  5. [GRAS 7-pin LEMO 10-meter extension cables](https://www.grasacoustics.com/products/cables/product/399-aa0009-preamplifier-extension-cables-with-7-pin-lemo-to-7-pin-lemo) (x4)
  6. BNC 25-foot extension cables (x4) 
  7. [Native Instruments USB-4431 4-input data-acquisition device (newer model linked here)](https://www.ni.com/en-us/shop/model/usb-4431.html) (x1)

The preamplifiers and microphone are connected to the power modules by the LEMO cables, which transmit power and data to and from the probes. The power module outputs the signal via a BNC port, which connects to the DAQ by the BNC cables. The probes are mounted to the test vehicle in pairs on the rim of the wheel (via wheel-mounting apparati, which were not provided to our team by Volpe). 

The Bruel and Kjaer 4231 calibrator is to be used during microphone calibration. The calibrator generates an audio signal (at either 94 or 114 dB SPL) of frequency 1 kHz and contains a slot into which a single microphone capsule should be inserted during digital microphone-sensitivity-value adjustment.

**NOTE:** In the diagram below, "Oscilloscope" is referring to the NI USB-4431 data acquisition interface, which connects to the user's laptop via USB Type-B.
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/115284776/025fa017-594b-4e16-8c4f-9ecb8256bb0e)

  1. #### GRAS 26AK preamplifier
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/ee4b3dec-1cc8-4318-9407-29c14ce63ae1)

  2. #### GRAS 40AI intensity microphone
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/368517da-7856-480d-bdaf-6a1b00a75a53)

  * ### The above two items, joined together:
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/b8849c2e-7e41-4289-b732-f8a5562c8005)

  3. #### GRAS 12AQ 2-channel power module:
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/89d00c3b-7947-4e31-94bb-f01c92c68e20)

  4. #### Bruel and Kjaer 4231 calibrator:
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/0f3d471c-0500-45f8-8bab-ae84772daecd)

  7. #### National Instruments USB-4431 data acquisition system:
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/76103bc6-17d7-4f5e-b5e6-2a7c1d707967)

  * ### Final Setup (Single Microphone)
![image](https://github.com/MuhammedAbdalla/OBSIDAS-LabVIEW/assets/54071115/50418e56-3cb6-4692-b192-22c44fce52ce)

**NOTE:** Each of these items was selected by Volpe per their internal standards and requirements, and thus, none represent a design decision on the part of our team. As such, technical specs & schematics can be found in the provided links. 
The experimental standard around which OBSIDAS is to be used also accounts for hardware specifications and setup; this standard is titled [AASHTO TP 76-10, which you can purchase the PDF for here.](https://www.engineerdocuments.com/standards/AASHTO-TP-76-10/)

For information on the software-side setup for OBSIDAS' I/O, refer to README_Software.md
