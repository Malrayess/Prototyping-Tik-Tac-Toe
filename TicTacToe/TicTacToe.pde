String title="Tic-Tac-Toe", exitbutton="Exit", easybutton="Easy Mode", mediumbutton="Medium Mode", hardbutton="Hard Mode", xscoreboard="X = ", oscoreboard="O = ", textscoreboard="Scoreboard", playasswitch="Start game as: ", backgroundswitch="Play in: ";
PFont  titleFont, exit, easy, medium, hard, xscore, oscore, scoreboard, playas, background;

int statusX, screenW, menuW, screenH, sbh, playareaH, playareaW, cellD, colx, col2x, col3x;

void setup () {
  fullScreen();
  background(0);

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

  println(playareaW, playareaH, cellD, menuW, statusX, colx, col2x, col3x);
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
  line(width, height*2/16, width*1/3, height*2/16); //scoreboard
<<<<<<< HEAD
  line(width*8.35/16, height*2/16, width*8.35/16, height); // tictactoe line 1 (left)
  line(width*11.5/16, height*2/16, width*11.5/16, height); // tictactoe line 2 (right/center)
  //line(width*1/3, sbh, statusW, screenH); // dividing line between tictactoe and message of who won/lose/tie and who's turn it is (far right)
  line(width*1/3, height*6.8/16, width*14.5/16, height*6.8/16); // tictactoe line 1 width (top)
  line(width*1/3, height*12/16, width*14.5/16, height*12/16); // tictactoe line 2 width (bottom)
=======
  line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
  line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
  line(statusX, sbh, statusX, screenH); // dividing line between tictactoe and message of who won/lose/tie and who's turn it is (far right)
  line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
  line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
>>>>>>> 3826edb7c39d441f123b76a05a05789e741c5b8c
  line(0, height-1, width, height-1); //bottom line closing everything

  fill(#FFFFFF);
  rect(0, 0, 100, 50); // exit button

  titleFont = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(titleFont, 75); //Change the number until it fits
  text(title, 0, height*1/16, width*1/3, height*2/16);

  fill(0);
  exit = createFont ("Stencil", 55);
  textAlign (CENTER, CENTER);
  textFont(exit, 25);
  text(exitbutton, 0, 0, 100, 50);

  fill(#FFFFFF);
  easy = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(easy, 75);
  text(easybutton, 0, height*3/16, width*1/3, height*4/16);

  medium = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(medium, 75);
  text(mediumbutton, 0, height*5/16, width*1/3, height*6/16);

  hard = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(hard, 75);
  text(hardbutton, 0, height*7/16, width*1/3, height*8/16);

  scoreboard = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(scoreboard, 30);
  text(textscoreboard, width*8/16, 0, width*4/16, height*1/16);

  xscore = createFont ("Stencil", 55);
  textAlign (CENTER, CENTER);
  textFont(xscore, 75);
  text(xscoreboard, width*1/3, 0, width*4/16, height*2/16);

  oscore = createFont ("Stencil", 55);
  textAlign (CENTER, CENTER);
  textFont(oscore, 75);
  text(oscoreboard, width*6/16, 0, width*14/16, height*2/16);

  playas = createFont ("Harrington", 55);
  textAlign (LEFT, CENTER);
  textFont(playas, 45);
  text(playasswitch, 0+15, height*9/16, width*1/3, height*10/16);

  background = createFont ("Harrington", 55);
  textAlign (LEFT, CENTER);
  textFont(background, 45);
  text(backgroundswitch, 0+15, height*10/16, width*1/3, height*10.5/16);
}

void draw () {
  //easy mode hover effect
  if (mouseX>=0 && mouseX<=width*1/3 && mouseY>=height*4/16 && mouseY<=((height*4/16) + (height*3/16))) {
    fill(#FFFFFF);
    rect(0, height*4/16, width*1/3, height*3/16);
    fill(0);
    textAlign (CENTER, CENTER);
    textFont(easy, 75);
    text(easybutton, 0, height*4/16, width*1/3, height*3/16);
    if (mousePressed) {
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
  }
  //medium mode hover effect
  if (mouseX>=0 && mouseX<=width*1/3 && mouseY>=height*7/16 && mouseY<=((height*7/16) + (height*3/16))) {
    fill(#FFFFFF);
    rect(0, height*7/16, width*1/3, height*3/16);
    fill(0);
    textAlign (CENTER, CENTER);
    textFont(medium, 75);
    text(mediumbutton, 0, height*7/16, width*1/3, height*3/16);
  } else {
    fill(0);
    rect(0, height*7/16, width*1/3, height*3/16);
    fill(#FFFFFF);
    textAlign (CENTER, CENTER);
    textFont(medium, 75);
    text(mediumbutton, 0, height*7/16, width*1/3, height*3/16);
  }
  //hard mode hover effect
  if (mouseX>=0 && mouseX<=width*1/3 && mouseY>=height*10/16 && mouseY<=((height*10/16) + (height*3/16))) {
    fill(#FFFFFF);
    rect(0, height*10/16, width*1/3, height*3/16);
    fill(0);
    textAlign (CENTER, CENTER);
    textFont(hard, 75);
    text(hardbutton, 0, height*10/16, width*1/3, height*3/16);
  } else {
    fill(0);
    rect(0, height*10/16, width*1/3, height*3/16);
    fill(#FFFFFF);
    textAlign (CENTER, CENTER);
    textFont(hard, 75);
    text(hardbutton, 0, height*10/16, width*1/3, height*3/16);
  }
}

void mousePressed () {
  if (mouseX>=0 && mouseX <=100 && mouseY>=0 && mouseY<=50) {  //exit button
    exit ();
  }
}
