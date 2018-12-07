void setup() {
  fullScreen();
  updateStatus();
}

void draw() {
  if (mousePressed) {
    int c, r;
    c = (mouseX-menuW/cellD);
    c = ((mouseX-menuW)/cellD);
    r = (mouseY-sbh)/(playareaH*1/3);
    println(c, r, cellD, mouseX-menuW, mouseY-sbh, sbh, mouseY, screenH);
    if (c>=0 && c<=2 && r>=0 && r<=2 && grid[c][r] == "" && mouseX>menuW) { // defines boundaries of where mouse is clicked, if clicked in certain area then it AND in another AND etc. then it runs the code
      if (lastPressed == "X") {  
        updateStatus("X"); // updates status to O
        placing(c, r, "O"); // places O
        lastPressed = "O"; // switches last pressed O
        grid[c][r] = "O"; // fills that part of grid with O
      } else {
        updateStatus("O"); // updates status to X
        placing(c, r, "X"); // places X
        lastPressed = "X"; // switches last pressed to X
        grid[c][r] = "X"; // fills that part of grid with X
      }
    }
  }
}



void updateStatus() {

  String fullStatus = "It is player 's turn";
  //String fullStatus = "It is player X's turn";
  float statusTxtX = width*15/16, statusTxtY = height*2.5/7;

  pushMatrix();
  translate(statusTxtX, statusTxtY);
  rotate(HALF_PI);
  textSize(55);
  createFont ("Harrington", 55);
  text(fullStatus, 0, 0);
  //textDraw(status, mainFont, height, 255, CENTER, CENTER, statusX, height*3/12, width, height*1/2);
  popMatrix();
}
