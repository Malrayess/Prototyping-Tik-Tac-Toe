//String drawXfunction = "X";
PFont drawX, drawO;

int[] gamegrid;

void placing(int c, int r, String symbol) {

      fill(255);
      drawX = createFont ("TimesNewRomanPS-BoldMT-48", 55);
      textAlign (CENTER, TOP);
      textFont(drawX, 250);
      text(symbol, menuW + (cellD/2) + (cellD*c), sbh + (playareaH*r/3));
}