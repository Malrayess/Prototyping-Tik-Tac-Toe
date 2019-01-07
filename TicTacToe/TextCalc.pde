void textSetup() {
  mainFont = createFont ("Harrington", 55);
  secondaryFont = createFont ("Stencil", 55);
  placingFont = createFont ("TimesNewRomanPS-BoldMT-48", 55);
}

void textDraw(String string, PFont font, float height, color ink, int alignH, int alignV, float rectX, float rectY, float rectWidth, float rectHeight) {
  float fontSize = height;
  fill(ink);
  textAlign(alignH, alignV);

  //reference to text calc
  if (string.length() >= 13) { //number changes depending on geometry ratio (width/height)
    fontSize = textCalculator(height, string, rectWidth);
  } else if (string.length() >= 17) { // change number as needed
    fontSize = fontSize * 0.7;
  } else if (string.length() >= 12 && mediumbutton == "Medium Mode") {
    fontSize = fontSize * 0.063;
  } else if (string.length() >= 11) {
    fontSize = fontSize * 0.07;
  } else if (string.length() >= 10) {
    fontSize = fontSize * 0.04;
  } else if (string.length() >= 9) {
    fontSize = fontSize * 0.10;
  } else if (string.length() >= 8) {
    fontSize = fontSize * 0.08;
  } else if (string.length() >= 7) {
    fontSize = fontSize * 0.06;
  } else if (string.length() >= 4) {
    fontSize = fontSize * 0.0425;
  } else if (string.length() >= 2) {
    fontSize = fontSize * 0.06;
  } else if (string.length() >= 1) {
    fontSize = fontSize * 0.10;
  }

  textFont(font, fontSize); //Change the number until it fits
  //text(string, rectX, rectY, menuW, height*6/16);
  text(string, rectX, rectY, menuW, rectHeight);
}
float textCalculator(float size, String string, float rectWidth) {
  float i = 1;
  textSize(size); //For textWidth Sizing
  while (textWidth(string) > rectWidth) {
    size = size * i;
    textSize (size);
    i = i - 0.001;
  }

  return size; //purpose of calculator
}
