String title="Tic-Tac-Toe";
String exitbutton="Exit";
PFont  titleFont, exit;

void setup () {
  fullScreen();
  
  background(0);
  
  stroke(#FFFFFF);
  strokeWeight(4);
  line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
  line(0, height*1/4, width*1/3, height*1/4); //name
  line(0, height*7/16, width*1/3, height*7/16); //button
  line(0, height*10/16, width*1/3, height*10/16); // button
  line(0, height*13/16, width*1/3, height*13/16); // button
  line(width, height*2/16, width*1/3, height*2/16); //scoreboard
  line(width*8.35/16, height*2/16, width*8.35/16, height); // tictactoe line 1 (left)
  line(width*11.5/16, height*2/16, width*11.5/16, height); // tictactoe line 2 (right/center)
  line(width*14.5/16, height*2/16, width*14.5/16, height); // dividing line between tictactoe and message of who won/lose/tie and who's turn it is (far right)
  line(width*1/3, height*6.8/16, width*14.5/16, height*6.8/16); // tictactoe line 1 width (top)
  line(width*1/3, height*12/16, width*14.5/16, height*12/16); // tictactoe line 2 width (bottom)
  
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
}

void draw () {

}

void mousePressed () {
  if (mouseX>=0 && mouseX <=100 && mouseY>=0 && mouseY<=50) {  //exit button
    exit ();
  }
}
