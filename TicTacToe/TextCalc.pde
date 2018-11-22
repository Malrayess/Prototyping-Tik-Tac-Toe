void textSetup() {
  easy = createFont ("Harrington", 55);
  medium = createFont ("Harrington", 55);
  hard = createFont ("Harrington", 55);
  scoreboard = createFont ("Harrington", 55);
  xscore = createFont ("Harrington", 55);
  oscore = createFont ("Harrington", 55);
  playas = createFont ("Harrington", 55);
  background = createFont ("Harrington", 55);
}
void textDraw(String string, PFont font, float height, color ink, int alignH, int alignV, float rectX, float rectY, float rectWidth, float rectHeight ) {
  float fontSize = height;
  fill(ink);
  textAlign(alignH, alignV);

  //reference to text calc
  println(string.length() );
  if (string.length() >= 13) { //number changes depending on geometry ratio (width/height)
    fontSize = textCalculator(height, string, rectWidth);
  } else if (string.length() >= 9) {
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