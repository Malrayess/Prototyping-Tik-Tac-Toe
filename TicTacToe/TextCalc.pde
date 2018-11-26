void textSetup() {
  mainFont = createFont ("Harrington", 55);
  secondaryFont = createFont ("Stencil", 55);
  placingFont = createFont ("TimesNewRomanPS-BoldMT-48", 55);
}

/*
void xoDraw(String string, PFont font, float height, color ink, int alignH, int alignV, float rectX, float rectY, int rectWidth) {
  float fontSize = height;
  fill(ink);
  textAlign(alignH, alignV);

  if (string.length() >= 1) { //number changes depending on geometry ratio (width/height)
    fontSize = textCalculator(height, string, rectWidth);
  }

  textFont(font, fontSize); //Change the number until it fits
  text(string, rectX, rectY, menuW, height*6/16);
}
*/
void textDraw(String string, PFont font, float height, color ink, int alignH, int alignV, float rectX, float rectY, float rectWidth, float rectHeight) {
  float fontSize = height;
  fill(ink);
  textAlign(alignH, alignV);

  //reference to text calc
  println(string.length() );
  if (string.length() >= 13) { //number changes depending on geometry ratio (width/height)
    fontSize = textCalculator(height, string, rectWidth);
  } else if (string.length() >= 12) {
    fontSize = fontSize * 0.05;
  } else if (string.length() >= 11) {
    fontSize = fontSize * 0.09;
  } else if (string.length() >= 10) {
    fontSize = fontSize * 0.04; // change number as needed
  } else if (string.length() >= 9) {
    fontSize = fontSize * 0.10; // change number as needed
  } else if (string.length() >= 7) {
    fontSize = fontSize * 0.04;
  } else if (string.length() >= 4) {
    fontSize = fontSize * 0.04;
  } else if (string.length() >= 2) {
    fontSize = fontSize * 0.06;
  }

  textFont(font, fontSize); //Change the number until it fits
  text(string, rectX, rectY, menuW, height*6/16);
}
float textCalculator(float size, String string, float rectWidth) {
  float i = 1;
  textSize(size); //For textWidth Sizing
  while (textWidth(string) > rectWidth) {
    size = size * i;
    textSize (size);
    i = i - 0.001;
    //println("i:", i, "Title Font Size: ", titleFontSize);
  }
  //println ("New Font Size", titleFontSize);

  return size; //purpose of calculator
}

/*void textDraw(String string, PFont font, float height, color ink, int alignHorizontal, int alignVertical, float rectX, float rectY, float rectWidth, float rectHeight) {
 float fontSize = height;
 fill(ink); //Black ink
 textAlign (alignHorizontal, alignVertical); //Align X&Y2
 
 //reference to text calc
 println(string.length() );
 if (string.length() >= 13) { //number changes depending on geometry ratio (width/height)
 fontSize = textCalculator(height, string, menuW);
 } else {
 //catch for string less than 13 characters
 fontSize = fontSize * 0.08; // change number as needed
 }
 
 textFont(font, fontSize); //Change the number until it fits
 text(string, rectX, rectY, menuW, height*6/16);
 }
 
 float textCalculator(float size, String string, float rectWidth) {
 float i = 1;
 textSize(size); //For textWidth Sizing
 while (textWidth(string) > rectWidth) {
 size = size * i;
 textSize (size);
 i = i - 0.001;
 //println("i:", i, "Title Font Size: ", titleFontSize);
 }
 //println ("New Font Size", titleFontSize);
 
 return size; //purpose of calculator
 }
 */
