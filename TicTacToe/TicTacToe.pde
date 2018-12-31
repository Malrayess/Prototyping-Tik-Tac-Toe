String title="Tic-Tac-Toe", exitbutton="Exit", easybutton="Easy Mode", mediumbutton="Medium Mode", hardbutton="Hard Mode", xscoreboard="X= ", oscoreboard="O= ", textscoreboard="Scoreboard", playasswitch="Start game as:", backgroundswitch="Play in:", status="";
PFont mainFont, secondaryFont, placingFont /*, titleFont, exit, easy, medium, hard, xscore, oscore, scoreboard, playas, background*/;

int statusX, screenW, menuW, screenH, sbh, playareaH, playareaW, cellD, colx, col2x, col3x;
String lastPressed = "", lastPlayerMode = "";
String[][] grid;

boolean runMode = false; // boolean to decide if mode is played and not other modes, only one at a time
boolean gameStop = false; // boolean to decide if players can play or not, and if someone won or not

void setup () {
  fullScreen();
  //size(900, 800);
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

  lastPlayerMode = "1~Player";
  lastPressed = "O";
  updateStatus("X");
  println(screenW, playareaW, playareaH, cellD, menuW, statusX, colx, col2x, col3x);
  drawShapes();
}

void drawShapes() {
  stroke(#FFFFFF);
  strokeWeight(4);
  line(menuW, 0, width, 0); // Top line
  line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
  line(0, height*1/4, width*1/3, height*1/4); //name
  line(width*0.03, sbh+height*0.01, width*1/3-width*0.03, sbh+height*0.01); //splits title and 2 player gamemode
  line(0, height*7/16, width*1/3, height*7/16); // easy button
  line(0, height*10/16, width*1/3, height*10/16); // medium button
  line(0, height*13/16, width*1/3, height*13/16); // hard button
  line(width, sbh, width*1/3, sbh); //scoreboard
  line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
  line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
  line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
  line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
  line(statusX, sbh, statusX, screenH); // Status line
  line(width-1, 0, width-1, height); // Line on the side
  line(0, height-1, width, height-1); //bottom line closing everything

  textDraw(title, mainFont, height, 255, CENTER, CENTER, 0, 0, width*1/3, height*2/16+height*0.03);
  /*titleFont = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(titleFont, 75); //Change the number until it fits
   text(title, 0, height*1/16, width*1/3, height*2/16);*/

  fill(#FFFFFF);
  rect(0, 0, width*0.06, height*0.0475); // exit button

  textDraw(exitbutton, secondaryFont, height, 0, TOP, LEFT, 0, 0, width*0.06, height*0.045);
  /*fill(0);
   exit = createFont ("Stencil", 55);
   textAlign (CENTER, CENTER);
   textFont(exit, 25);
   text(exitbutton, 0, 0, 100, 50);*/

  textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);

  textDraw(easybutton, mainFont, height, 255, 0, CENTER, CENTER, height*2.5/16, width*1/3, height*6/16);
  /*fill(#FFFFFF);
   easy = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(easy, 75);
   text(easybutton, 0, height*3/16, width*1/3, height*4/16);*/

  textDraw(mediumbutton, mainFont, height, 255, 0, CENTER, CENTER, height*5.5/16, width*1/3, height*6/16);
  /*medium = createFont ("Harrington", 55);
   textAlign (CENTER, CENTER);
   textFont(medium, 75);
   text(mediumbutton, 0, height*5/16, width*1/3, height*6/16);*/

  textDraw(hardbutton, mainFont, height, 255, 0, CENTER, CENTER, height*8.5/16, width*1/3, height*6/16);
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
    //println(c, r, cellD, mouseX-menuW, mouseY-sbh, sbh, mouseY, screenH);

    /*if (mouseX >= 0 && mouseX <= menuW && mouseY >= sbh+height*0.01 && mouseY <= height*7/16) {
     if (lastPlayerMode == "1~Player") {
     fill(0);
     rect(0, sbh+height*0.01, menuW, height*2.5/16);
     fill(255);
     stroke(4);
     line(width*0.03, sbh+height*0.01, width*1/3-width*0.03, sbh+height*0.01); //splits title and 2 player gamemode
     lastPlayerMode = "2~Player";
     textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);
     
     stroke(#D6D6D6);
     rect(0, height*7/16, menuW, height*13/16);
     textDraw(easybutton, mainFont, height, 255, 0, CENTER, CENTER, height*2.5/16, width*1/3, height*6/16); 
     textDraw(mediumbutton, mainFont, height, 255, 0, CENTER, CENTER, height*5.5/16, width*1/3, height*6/16);
     textDraw(hardbutton, mainFont, height, 255, 0, CENTER, CENTER, height*8.5/16, width*1/3, height*6/16);
     
     stroke(255);
     strokeWeight(4);
     line(0, height*7/16, width*1/3, height*7/16); // easy button
     line(0, height*10/16, width*1/3, height*10/16); // medium button
     line(0, height*13/16, width*1/3, height*13/16); // hard button 
     } else {
     fill(0);
     rect(0, sbh+height*0.01, menuW, height*2.5/16);
     fill(255);
     stroke(4);
     line(width*0.03, sbh+height*0.01, width*1/3-width*0.03, sbh+height*0.01); //splits title and 2 player gamemode
     lastPlayerMode = "1~Player";
     textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);
     
     stroke(0);
     rect(0, height*7/16, menuW, height*13/16);
     textDraw(easybutton, mainFont, height, 255, 0, CENTER, CENTER, height*2.5/16, width*1/3, height*6/16); 
     textDraw(mediumbutton, mainFont, height, 255, 0, CENTER, CENTER, height*5.5/16, width*1/3, height*6/16);
     textDraw(hardbutton, mainFont, height, 255, 0, CENTER, CENTER, height*8.5/16, width*1/3, height*6/16);
     
     stroke(255);
     strokeWeight(4);
     line(0, height*7/16, width*1/3, height*7/16); // easy button
     line(0, height*10/16, width*1/3, height*10/16); // medium button
     line(0, height*13/16, width*1/3, height*13/16); // hard button
     }
     }*/

    if (c>=0 && c<=2 && r>=0 && r<=2 && grid[c][r] == "" && mouseX>menuW && gameStop == false && lastPlayerMode == "2~Player") { // defines boundaries of where mouse is clicked, if clicked in certain areas then it runs the code , only places if boolean is false AKA only when no one won
      if (lastPressed == "X") {  
        updateStatus("X"); // updates status to O
        placing(c, r, "O"); // places O
        lastPressed = "O"; // switches last pressed to O
        grid[c][r] = "O"; // fills that part of grid with O
        count += 1; // starts adding counter for every piece placed
      } else {
        updateStatus("O"); // updates status to X
        placing(c, r, "X"); // places X
        lastPressed = "X"; // switches last pressed to X
        grid[c][r] = "X"; // fills that part of grid with X
        count += 1; // starts adding counter for every piece placed
      }
    }
  }
  if (!gameStop) { // because it is a boolean, the exclamation mark means negating or not true AKA false
    check3InRow();
  }
}

void updateStatus(String status) { // function to update the status message
  float statusTxtX = width*15/16, statusTxtY = height*2/8;

  fill(0);
  rect(statusX, sbh, width, height-1);
  stroke(#FFFFFF);
  strokeWeight(4);
  line(statusX, sbh, statusX, screenH); // Status line
  line(width-1, 0, width-1, height); // Line on the side
  line(0, height-1, width, height-1); //bottom line closing everything
  fill(255);

  String fullStatus;
  if (gameStop == false) { // if game is still going, run this code
    fullStatus = "It is player "+status+"'s turn"; // it is player "XorO's" turn
  } else {
    fullStatus = status; // game is stopped, someone won, runs the text that says someone won
  }

  pushMatrix();
  translate(statusTxtX, statusTxtY);
  rotate(HALF_PI);
  textSize(55);
  textFont(mainFont);
  textAlign(LEFT, CENTER); // aligns status to fix the moving problem
  text(fullStatus, 0, 0);
  //textDraw(status, mainFont, height, 255, CENTER, CENTER, statusX, height*3/12, width, height*1/2);
  popMatrix();
}

void mousePressed () {
  if (mouseX>=0 && mouseX <=width*0.06 && mouseY>=0 && mouseY<=height*0.03) {  //exit button
    exit ();
  }
  if (mouseX >= 0 && mouseX <= menuW && mouseY >= 0 && mouseY <= height*10/16) { // runs easy AI code when button is clicked
    //placeEasyAI();
  }
}

void mouseReleased () {
  if (mouseX >= 0 && mouseX <= menuW && mouseY >= sbh+height*0.01 && mouseY <= height*7/16) { // player 1 or player 2 function for either playing against AI or another player
    if (lastPlayerMode == "1~Player") {
      fill(0);
      rect(0, sbh+height*0.015, menuW, height*1/4);
      fill(255);
      stroke(4);
      line(0, height*1/4, width*1/3, height*1/4); //name
      line(width*0.03, sbh+height*0.01, width*1/3-width*0.03, sbh+height*0.01); //splits title and 2 player gamemode
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
      lastPlayerMode = "2~Player";
      textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);

      textDraw(easybutton, mainFont, height, 255, #D6D6D6, CENTER, CENTER, height*2.5/16, width*1/3, height*6/16); 
      textDraw(mediumbutton, mainFont, height, 255, #D6D6D6, CENTER, CENTER, height*5.5/16, width*1/3, height*6/16);
      textDraw(hardbutton, mainFont, height, 255, #D6D6D6, CENTER, CENTER, height*8.5/16, width*1/3, height*6/16);
    } else {
      fill(0);
      rect(0, sbh+height*0.015, menuW, height*1/4);
      fill(255);
      stroke(4);
      line(0, height*1/4, width*1/3, height*1/4); //name
      line(width*0.03, sbh+height*0.01, width*1/3-width*0.03, sbh+height*0.01); //splits title and 2 player gamemode
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
      lastPlayerMode = "1~Player";
      textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);

      textDraw(easybutton, mainFont, height, 255, 0, CENTER, CENTER, height*2.5/16, width*1/3, height*6/16); 
      textDraw(mediumbutton, mainFont, height, 255, 0, CENTER, CENTER, height*5.5/16, width*1/3, height*6/16);
      textDraw(hardbutton, mainFont, height, 255, 0, CENTER, CENTER, height*8.5/16, width*1/3, height*6/16);
    }
  }
}

void keyPressed() {
  if (keyCode == 82) {
    gameStop = false; // each time the reset button is pressed, players are allowed once again to place pieces in the gameboard
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
    line(width-1, 0, width-1, height); // Line on the side

    for (int c=0; c<=2; c++) {
      for (int r=0; r<=2; r++) {
        grid[c][r] = "";
      }
    }
    lastPressed= "O";
    updateStatus("X");
    count = 0; //  resets amount of pieces to 0
  }
}
