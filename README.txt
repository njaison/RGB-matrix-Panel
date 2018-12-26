This is an Arduino library for the 16x32, 32x32, and 32x64 RGB LED matrix panels

To download. click the DOWNLOADS button in the top bar, rename the uncompressed folder RGBLEDMatrix. Check that the RGBmatrixPanel folder contains RGBmatrixPanel.cpp and RGBmatrixPanel.h

Place the RGBmatrixPanel library folder your <arduinosketchfolder>/libraries/ folder. You may need to create the libraries subfolder if its your first library. Restart the IDE.

32x64 panels can only be supported by an Arduino MEGA due to the large amount of RAM required.
I have found from testing that a MEGA can support 1 32x64 panel with double buffering, and 2.5 32x64 panels without double buffering.