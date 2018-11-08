String drawXfunction = "X";
PFont drawX;

boolean empty = true;

void placing() {
  if (mousePressed) {
    
    if (mouseX>=width*1/3 && mouseX<=col2x && mouseY>=sbh && mouseY<=(sbh + playareaH*1/3)) {
      empty = false;
      
      fill(255);
      drawX = createFont ("TimesNewRomanPS-BoldMT-48", 55);
      textAlign (CENTER, TOP);
      textFont(drawX, 250);
      text(drawXfunction, width*1/3, sbh-50, playareaW*1/3, (sbh + playareaH*1/3));
    } 
  }
}
