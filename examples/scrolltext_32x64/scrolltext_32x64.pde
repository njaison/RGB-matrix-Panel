// Adafruit-GFX-Library - Version: Latest
#include <Adafruit_GFX.h>

// RGB-matrix-Panel - Version: Latest
#include <gamma.h>
#include <RGBmatrixPanel.h>

// RGB_matrix_Panel-1.1.1 - Version: Latest
// #include <gamma.h>
// #include <RGBmatrixPanel.h>

// scrolltext demo for Adafruit RGBmatrixPanel library.
// Demonstrates double-buffered animation on our 16x32 RGB LED matrix:
// http://www.adafruit.com/products/420

// Written by Limor Fried/Ladyada & Phil Burgess/PaintYourDragon
// for Adafruit Industries.
// BSD license, all text above must be included in any redistribution.

// #include <Adafruit_GFX.h>   // Core graphics library
// #include <RGBmatrixPanel.h> // Hardware-specific library

// Similar to F(), but for PROGMEM string pointers rather than literals
#define F2(progmem_ptr) (const __FlashStringHelper *)progmem_ptr


#define CLK 11  // MUST be on PORTB! (Use pin 11 on Mega)
#define LAT 10
#define OE  9
#define A   A0
#define B   A1
#define C   A2
#define D   A3
// Last parameter = 'true' enables double-buffering, for flicker-free,
// buttery smooth animation.  Note that NOTHING WILL SHOW ON THE DISPLAY
// until the first call to swapBuffers().  This is normal.
RGBmatrixPanel32x64 matrix(A, B, C, D, CLK, LAT, OE, false, 2);
// Double-buffered mode consumes nearly all the RAM available on the
// Arduino Uno -- only a handful of free bytes remain.  Even the
// following string needs to go in PROGMEM:

SimpleTimer timer;

const char str[] PROGMEM = "Merry Christmas and Happy New Year";
int    textX   = matrix.width(),
       textMin = sizeof(str) * -12,
       hue     = 0;



const char bot[] PROGMEM = "Troy and Athens HS Robotics Team 226";
int    textXBot   = matrix.width(),
       textMinBot = sizeof(bot) * -12,
       hueBot     = 0;


void setup() {
  matrix.begin();
  matrix.setTextWrap(false); // Allow text to run off right edge
  matrix.setTextSize(2);
}

void loop() {
  byte i;

  // Clear background
  matrix.fillScreen(0);

  // Draw big scrolly text on top
  matrix.setTextColor(matrix.ColorHSV(hue, 255, 255, true));
  matrix.setCursor(textX, 1);
  matrix.print(F2(str));

  matrix.setTextColor(matrix.Color333(0, 0, 7));
  matrix.setCursor(textX, 16);
  matrix.print(F2(bot));

  // Move text left (w/wrap), increase hue
  if((--textX) < textMin) textX = matrix.width();
  hue += 7;
  if(hue >= 1536) hue -= 1536;

  if((--textXBot) < textMinBot) textXBot = matrix.width();

  // Update display
  matrix.swapBuffers(false);
}