String title="Tic-Tac-Toe", exitbutton="Exit", easybutton="Easy Mode", mediumbutton="Medium Mode", hardbutton="Hard Mode", xscoreboard="X = ", oscoreboard="O = ", textscoreboard="Scoreboard", playasswitch="Start game as:", backgroundswitch="Play in:", status="";
PFont mainFont, secondaryFont, placingFont /*, titleFont, exit, easy, medium, hard, xscore, oscore, scoreboard, playas, background*/;

int statusX, screenW, menuW, screenH, sbh, playareaH, playareaW, cellD, colx, col2x, col3x;
String lastPressed = "";
String[][] grid;

void setup () {
  //fullScreen();
  size(900, 800);
  background(0);
  textSetup();

  statusX = width*14/16;
  screenW = width;
  menuW = screenW*1/3;
  screenH = height;
  sbh = screenH*1/8;
  playareaH = screenH - sbh;
  playareaW = width - menuW - (width - statusX);
  cellD = playareaW*1/3;
  colx = menuW;
  col2x = menuW + cellD;
  col3x = menuW + (cellD*2);

  grid = new String[3][3];
  for (int c=0; c<=2; c++)
  {
    for (int r=0; r<=2; r++)
    {
      grid[c][r] = "";
    }
  }

  lastPressed = "O";
  updateStatus("X");
  println(screenW, playareaW, playareaH, cellD, menuW, statusX, colx, col2x, col3x);
  drawShapes();
}

void drawShapes() {
  stroke(#FFFFFF);
  strokeWeight(4);
  line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
  line(0, height*1/4, width*1/3, height*1/4); //name
  line(0, height*7/16, width*1/3, height*7/16); // easy button
  line(0, height*10/16, width*1/3, height*10/16); // medium button
  line(0, height*13/16, width*1/3, height*13/16); // hard button
  line(width, sbh, width*1/3, sbh); //scoreboard
  line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
  line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
  line(statusX, sbh, statusX, screenH); // Status line
  line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
  line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
  line(0, height-1, width, height-1); //bottom line closing everything

  fill(#FFFFFF);
  rect(0, 0, 100, 40); // exit button

  textDraw(title, mainFont, height, 255, CENTER, CENTER, 0, 0, width*1/3, height*5/16);
  /*titleFont = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(titleFont, 75); //Change the number until it fits
   text(title, 0, height*1/16, width*1/3, height*2/16);*/

  textDraw(exitbutton, secondaryFont, height, 0, LEFT, TOP, 0, 0, height*0.01, height*6/16);
  /*fill(0);
   exit = createFont ("Stencil", 55);
   textAlign (CENTER, CENTER);
   textFont(exit, 25);
   text(exitbutton, 0, 0, 100, 50);*/

  textDraw(easybutton, mainFont, height, 255, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); // title
  /*fill(#FFFFFF);
   easy = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(easy, 75);
   text(easybutton, 0, height*3/16, width*1/3, height*4/16);*/

  textDraw(mediumbutton, mainFont, height, 255, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);
  /*medium = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(medium, 75);
   text(mediumbutton, 0, height*5/16, width*1/3, height*6/16);*/

  textDraw(hardbutton, mainFont, height, 255, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);
  /*hard = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(hard, 75);
   text(hardbutton, 0, height*7/16, width*1/3, height*8/16);*/

  textDraw(playasswitch, mainFont, height, 255, LEFT, CENTER, 0, height*10.5/16, ((width*1/3)/2)+50, height*6/16);
  /*playas = createFont ("Harrington", 55);
   textAlign (LEFT, CENTER);
   textFont(playas, 45);
   text(playasswitch, 0+15, height*9/16, width*1/3, (height*10/16)-10);*/

  textDraw(backgroundswitch, mainFont, height, 255, LEFT, CENTER, 0, (height*10.5/16)+75, ((width*1/3)/2)+50, height*6/16);
  /*background = createFont ("Harrington", 55);
   textAlign (LEFT, CENTER);
   textFont(background, 45);
   text(backgroundswitch, 0+15, height*10/16, width*1/3, height*10.5/16);*/

  textDraw(textscoreboard, mainFont, height, 255, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16);
  /*scoreboard = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(scoreboard, 30);
   text(textscoreboard, width*8/16, 0, width*4/16, height*1/16);*/

  textDraw(xscoreboard, secondaryFont, height, 255, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16);
  /*xscore = createFont ("Stencil", 55);
   textAlign (CENTER, CENTER);
   textFont(xscore, 75);
   text(xscoreboard, width*1/3, 0, width*4/16, height*2/16);*/

  textDraw(oscoreboard, secondaryFont, height, 255, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16);
  /*oscore = createFont ("Stencil", 55);
   textAlign (CENTER, CENTER);
   textFont(oscore, 75);
   text(oscoreboard, width*6/16, 0, width*14/16, height*2/16);*/
}

void draw () {
  /*
  //easy mode hover effect
   if (mouseX>=0 && mouseX<=width*1/3 && mouseY>=height*4/16 && mouseY<=((height*4/16) + (height*3/16))) {
   fill(#FFFFFF);
   rect(0, height*4/16, width*1/3, height*3/16);
   fill(0);
   textAlign (CENTER, CENTER);
   textFont(easy, 75);
   text(easybutton, 0, height*4/16, width*1/3, height*3/16);
   if (mousePressed) {
   testBool = !testBool;
   
   fill(#FFFFFF);
   rect(0, height*4/16, width*1/3, height*3/16);
   fill(0);
   textAlign (CENTER, CENTER);
   }
   } else {
   fill(0);
   rect(0, height*4/16, width*1/3, height*3/16);
   fill(#FFFFFF);
   textAlign (CENTER, CENTER);
   textFont(easy, 75);
   text(easybutton, 0, height*4/16, width*1/3, height*3/16);
   }*/

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
  check3InRow();
}

void updateStatus(String status) { // function to update the status message
  fill(0);
  rect(statusX, sbh, width, height-1);
  stroke(#FFFFFF);
  strokeWeight(4);
  line(statusX, sbh, statusX, screenH); // Status line
  fill(255);

  String fullStatus = "It is player "+status+"'s turn";
  //String fullStatus = "It is player X's turn";
  float statusTxtX = width*15/16, statusTxtY = height*2.5/7;

  pushMatrix();
  translate(statusTxtX, statusTxtY);
  rotate(HALF_PI);
  textSize(55);
  textFont(mainFont);
  text(fullStatus, 0, 0);
  //textDraw(status, mainFont, height, 255, CENTER, CENTER, statusX, height*3/12, width, height*1/2);
  popMatrix();
}

void mousePressed () {
  if (mouseX>=0 && mouseX <=100 && mouseY>=0 && mouseY<=40) {  //exit button
    exit ();
  }
}

void keyPressed() {
  if (keyCode == 82) {
    fill(0);
    rect(width*1/3, sbh, width*14/16, height-1);
    stroke(#FFFFFF);
    strokeWeight(4);
    line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
    line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
    line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
    line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
    line(statusX, sbh, statusX, screenH); // Status line
    line(0, height-1, width, height-1); //bottom line closing everything

    for (int c=0; c<=2; c++)
    {
      for (int r=0; r<=2; r++)
      {
        grid[c][r] = "";
      }
    }
    lastPressed= "O";
    updateStatus("X");
  }
}
