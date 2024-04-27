- schematics
- vendor information
- pictures
- technical specs
- etc.

Also includes a document highlighting how to setup the project and connect to external systems, sensors, etc.

The following hardware items together constitute the input-signal chain of the OBSIDAS in the form of a quad-microphone sensor array (quantities are indicated in parentheses):

  1. [GRAS 26AK preamplifiers](https://www.grasacoustics.com/products/preamplifiers-for-microphone-cartridge/traditional-power-supply-lemo/product/210-26ak) (x4)
  2. [GRAS 40AI externally polarized paired microphones](https://www.grasacoustics.com/products/special-microphone/intensity-microphones/product/170-40ai) (x4; i.e, 2 pairs)
  3. [GRAS 12AQ 2-channel power modules](https://www.grasacoustics.com/products/product/228-12AQ) (x2)
  4. [Brüel and Kjær 4231 calibrator](https://www.bksv.com/en/transducers/acoustic/calibrators/sound-calibrator-4231?utm_source=google&utm_medium=cpc&utm_campaign=mc_us_brand&utm_term=b%26k%20type%204231&utm_campaign=Brand_B%26K_Generic_BMM&utm_source=adwords&utm_medium=ppc&hsa_acc=2399425841&hsa_cam=1599237722&hsa_grp=67083438439&hsa_ad=462807088545&hsa_src=g&hsa_tgt=kwd-386688049581&hsa_kw=b%26k%20type%204231&hsa_mt=b&hsa_net=adwords&hsa_ver=3&gad_source=1&gclid=CjwKCAjwoa2xBhACEiwA1sb1BM8JlCWUKW5Xb9Jxmr4JGAevUaYF0Z1SKAXfOu81x8kjVfoWjZyZGhoCkW4QAvD_BwE) (x1)
  5. [GRAS 7-pin LEMO 10-meter extension cables](https://www.grasacoustics.com/products/cables/product/399-aa0009-preamplifier-extension-cables-with-7-pin-lemo-to-7-pin-lemo) (x4)
  6. BNC 25-foot extension cables (x4) 
  7. [Native Instruments USB-4431 4-input data-acquisition device (newer model linked here)](https://www.ni.com/en-us/shop/model/usb-4431.html) (x1)

The preamplifiers and microphone are connected to the power modules by the LEMO cables, which transmit power and data to and from the probes. The power module outputs the signal via a BNC port, which connects to the DAQ by the BNC cables. The probes are mounted to the test vehicle in pairs on the rim of the wheel (via wheel-mounting apparati, which were not provided to our team by Volpe). 

The Bruel and Kjaer 4231 calibrator is to be used during microphone calibration. The calibrator generates an audio signal (at either 94 or 114 dB SPL) of frequency 1 kHz and contains a slot into which a single microphone capsule should be inserted during digital microphone-sensitivity-value adjustment.

NOTE: Each of these items was selected by Volpe per their internal standards and requirements, and thus, none represent a design decision on the part of our team. As such, technical specs & schematics can be found in the provided links. 
The experimental standard around which OBSIDAS is to be used also accounts for hardware specifications and setup; this standard is titled [AASHTO TP 76-10, which you can purchase the PDF for here.](https://www.engineerdocuments.com/standards/AASHTO-TP-76-10/)

