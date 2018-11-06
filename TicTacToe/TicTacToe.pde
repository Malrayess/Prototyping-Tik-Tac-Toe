String title="Tic-Tac-Toe", exitbutton="Exit", easybutton="Easy Mode", mediumbutton="Medium Mode", hardbutton="Hard Mode", xscoreboard="X = ", oscoreboard="O = ", textscoreboard="Scoreboard";
PFont  titleFont, exit, easy, medium, hard, xscore, oscore, scoreboard;

void setup () {
  fullScreen();
  
  background(0);
  
  stroke(#FFFFFF);
  strokeWeight(4);
  line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
  line(0, height*1/4, width*1/3, height*1/4); //name
  line(0, height*7/16, width*1/3, height*7/16); // easy button
  line(0, height*10/16, width*1/3, height*10/16); // medium button
  line(0, height*13/16, width*1/3, height*13/16); // hard button
  line(width, height*2/16, width*1/3, height*2/16); //scoreboard
  line(width*8.35/16, height*2/16, width*8.35/16, height); // tictactoe line 1 (left)
  line(width*11.5/16, height*2/16, width*11.5/16, height); // tictactoe line 2 (right/center)
  line(width*14.5/16, height*2/16, width*14.5/16, height); // dividing line between tictactoe and message of who won/lose/tie and who's turn it is (far right)
  line(width*1/3, height*6.8/16, width*14.5/16, height*6.8/16); // tictactoe line 1 width (top)
  line(width*1/3, height*12/16, width*14.5/16, height*12/16); // tictactoe line 2 width (bottom)
  line(0,height-1, width, height-1); //bottom line closing everything
  
  fill(#FFFFFF);
  rect(0, 0, 100, 50); // exit button

  titleFont = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(titleFont, 75); //Change the number until it fits
  text(title, 0, height*1/16, width*1/3, height*2/16);
  
  fill(0);
  exit = createFont ("Harrington", 55);
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
  
  xscore = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(xscore, 75);
  text(xscoreboard, width*1/3, 0, width*4/16, height*2/16);
  
  oscore = createFont ("Harrington", 55);
  textAlign (CENTER, CENTER);
  textFont(oscore, 75);
  text(oscoreboard, width*6/16, 0, width*14/16, height*2/16);
}

void draw () {

}

void mousePressed () {
  if (mouseX>=0 && mouseX <=100 && mouseY>=0 && mouseY<=50) {  //exit button
    exit ();
  }
}