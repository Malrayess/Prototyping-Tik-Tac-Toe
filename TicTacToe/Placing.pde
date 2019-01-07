PFont drawX, drawO;

int[] gamegrid;

void placing(int c, int r, String symbol) {
  if (theme == "Theme: Dark") {
    //fill(255);
    //drawX = createFont ("TimesNewRomanPS-BoldMT-48", 55);
    //textAlign (CENTER, TOP);
    //textFont(drawX, 250);
    textDraw(symbol, placingFont, height, 255, CENTER, LEFT, menuW+width*0.010 +(cellD/2) + (cellD*(c-1)), sbh + (playareaH*r/3), cellD, cellH);
    //text(symbol, menuW + (cellD/2) + (cellD*c), sbh + (playareaH*r/3));
  } else if (theme == "Theme: Light") {
    //fill(0);
    //drawX = createFont ("TimesNewRomanPS-BoldMT-48", 55);
    //textAlign (CENTER, TOP);
    //textFont(drawX, 250);
    textDraw(symbol, placingFont, height, 0, CENTER, LEFT, menuW+width*0.010 +(cellD/2) + (cellD*(c-1)), sbh + (playareaH*r/3), cellD, cellH);
    //text(symbol,menuW + (cellD/2) + (cellD*c), sbh + (playareaH*r/3));
  }
}
