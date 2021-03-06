String title="Tic-Tac-Toe", exitbutton="Exit", resetbutton="Reset", easybutton="Easy Mode", mediumbutton="Medium Mode", hardbutton="Hard Mode", xscoreboard="X= ", oscoreboard="O= ", textscoreboard="Scoreboard", status="", name = "By: Maher Al-Rayess";
PFont mainFont, secondaryFont, placingFont;

int statusX, screenW, menuW, screenH, sbh, playareaH, playareaW, cellD, cellH, colx, col2x, col3x, difficulty;
String lastPressed = "", lastPlayerMode = "", theme = "";
String[][] grid;

boolean gameStop = false; // boolean to decide if players can play or not, and if someone won or not
boolean filled = false;

void setup () {
  fullScreen();
  //size(900, 800);
  textSetup();

  statusX = width*14/16;
  screenW = width;
  menuW = screenW*1/3;
  screenH = height;
  sbh = screenH*1/8;
  playareaH = screenH - sbh;
  playareaW = width - menuW - (width - statusX);
  cellD = playareaW*1/3;
  cellH = playareaH*1/3;
  colx = menuW;
  col2x = menuW + cellD;
  col3x = menuW + (cellD*2);
  difficulty = 0;

  grid = new String[3][3]; // initiates the grid (creates it)
  for (int c=0; c<=2; c++) { // 3 columns
    for (int r=0; r<=2; r++) { // 3 rows
      grid[c][r] = ""; // starts off the grid with everything being empty
    }
  }

  theme = "Theme: Dark";
  lastPlayerMode = "1~Player";
  lastPressed = "O";
  updateStatus("X");
  drawShapes();
}

void drawShapes() {
  if ( theme == "Theme: Dark") {
    background(0);

    stroke(#FFFFFF);
    strokeWeight(4);
    line(menuW, 0, width, 0); // Top line
    line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
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
    line(menuW, height-1, width, height-1); //bottom line closing everything

    textDraw(title, mainFont, height, 255, CENTER, CENTER, 0, 0, width*1/3, height*2/16+height*0.03); // title text

    fill(#FFFFFF);
    rect(0, 0, width*0.06, height*0.0475); // exit button

    fill(#FFFFFF);
    rect(width*0.07, 0, (width*0.06), height*0.0475); // reset button

    textDraw(exitbutton, secondaryFont, height, 0, TOP, LEFT, 0, 0, width*0.06, height*0.045); // exit text

    textDraw(resetbutton, secondaryFont, height, 0, TOP, LEFT, width*0.07, 0, width*0.06, height*0.045); // reset text

    textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05); // players text

    textDraw(easybutton, mainFont, height, 255, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); // easy mode text

    textDraw(mediumbutton, mainFont, height, 255, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16); // medium mode text

    textDraw(hardbutton, mainFont, height, 255, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16); // hard mode text

    textDraw(theme, mainFont, height, 255, LEFT, CENTER, 0, (height*13/16), ((width*1/3)/2)+50, height*2/16); // background switch text

    textDraw(textscoreboard, mainFont, height, 255, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16); // scoreboard text

    textDraw(xscoreboard, secondaryFont, height, 255, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16); // X scoreboard text

    textDraw(oscoreboard, secondaryFont, height, 255, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16); // O scoreboard text

    textDraw(name, mainFont, height, 255, CENTER, CENTER, 0, (height*13/16)+(height*1/16)+(height*0.02), ((width*1/3)/2)+75, height*2/16); // my name text
  } else if ( theme == "Theme: Light") {
    background(255);

    stroke(0);
    strokeWeight(4);
    line(menuW, 0, width, 0); // Top line
    line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
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
    line(menuW, height-1, width, height-1); //bottom line closing everything

    textDraw(title, mainFont, height, 0, CENTER, CENTER, 0, 0, width*1/3, height*2/16+height*0.03); // title text

    fill(0);
    rect(0, 0, width*0.06, height*0.0475); // exit button

    fill(0);
    rect(width*0.07, 0, (width*0.06), height*0.0475); // reset button

    textDraw(exitbutton, secondaryFont, height, 255, TOP, LEFT, 0, 0, width*0.06, height*0.045); // exit text

    textDraw(resetbutton, secondaryFont, height, 255, TOP, LEFT, width*0.07, 0, width*0.06, height*0.045); // reset text

    textDraw(lastPlayerMode, mainFont, height, 0, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05); // players text

    textDraw(easybutton, mainFont, height, 0, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); // easy mode text

    textDraw(mediumbutton, mainFont, height, 0, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16); // medium mode text

    textDraw(hardbutton, mainFont, height, 0, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16); // hard mode text

    textDraw(theme, mainFont, height, 0, LEFT, CENTER, 0, (height*13/16), ((width*1/3)/2)+50, height*2/16); // background switch text

    textDraw(textscoreboard, mainFont, height, 0, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16); // scoreboard text

    textDraw(xscoreboard, secondaryFont, height, 0, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16); // X scoreboard text

    textDraw(oscoreboard, secondaryFont, height, 0, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16); // O scoreboard text

    textDraw(name, mainFont, height, 0, CENTER, CENTER, 0, (height*13/16)+(height*1/16)+(height*0.02), ((width*1/3)/2)+75, height*2/16); // my name text
  }
}

void draw () {
  if (mousePressed) {
    int c, r;
    c = ((mouseX-menuW)/cellD);
    r = (mouseY-sbh)/(playareaH*1/3);

    if (c>=0 && c<=2 && r>=0 && r<=2 && grid[c][r] == "" && mouseX>menuW && gameStop == false && (difficulty !=0 || lastPlayerMode == "2~Player")) { // defines boundaries of where mouse is clicked, if clicked in certain areas then it runs the code , only places if boolean is false AKA only when no one won
      if (lastPressed == "X" && lastPlayerMode == "2~Player") {   // if X was placed AND 2 people are playing, it runs the normal code below
        placing(c, r, "O"); // places O
        updateStatus("X"); // updates status to O
        lastPressed = "O"; // switches last pressed to O
        grid[c][r] = "O"; // fills that part of grid with O
        count += 1; // starts adding counter for every piece placed

        if (!gameStop) { // because it is a boolean, the exclamation mark means negating or not true AKA false
          check3InRow(); // runs checker for 2 players when O is placed
        }
      } else {
        updateStatus("O"); // updates status to X
        placing(c, r, "X"); // places X
        lastPressed = "X"; // switches last pressed to X
        grid[c][r] = "X"; // fills that part of grid with X
        count += 1; // starts adding counter for every piece placed

        if (!gameStop) { // because it is a boolean, the exclamation mark means negating or not true AKA false
          check3InRow(); // runs checker for 2 players when X is placed
        }

        if (lastPlayerMode == "1~Player" && !gameStop) { // if X was placed AND 1 player is playing (overrides previous 2 people are playing) 
          if (difficulty == 1) { // if easy mode is pressed
            placeEasyAI(); // runs function for placing Easy AI
            updateStatus("X"); // updates status to O
            lastPressed = "O"; // switches last pressed to O
            count += 1; // starts adding counter for every piece placed
          } else if (difficulty == 2) {
            placeMediumAI(); // runs function for placing Medium AI
            if (filled == false) {
              placeEasyAI(); // runs random placement
            }
            updateStatus("X"); // updates status to O
            lastPressed = "O"; // switches last pressed to O
            count += 1; // starts adding counter for every piece placed
          } else if (difficulty == 3) {
            placeHardAI1();
            if (filled == false) {
              placeMediumAI();
            } 
            if (filled == false) {
              placeHardAI2();
            }
            if (filled == false) { 
              placeEasyAI();
            }
            updateStatus("X"); // updates status to O
            lastPressed = "O"; // switches last pressed to O
            count += 1; // starts adding counter for every piece placed
          }
        }
        if (!gameStop) { // because it is a boolean, the exclamation mark means negating or not true AKA false
          check3InRow(); // runs checker for 1 player
        }
      }
    }
  }
}

void updateStatus(String status) { // function to update the status message
  float statusTxtX = width*15/16, statusTxtY = height*2/8;

  if (theme == "Theme: Dark") {
    fill(0);
    rect(statusX, sbh, width, height-1);
    stroke(#FFFFFF);
    strokeWeight(4);
    line(statusX, sbh, statusX, screenH); // Status line
    line(width-1, 0, width-1, height); // Line on the side
    line(menuW, height-1, width, height-1); //bottom line closing everything
    fill(255);
  } else if (theme == "Theme: Light") {
    fill(255);
    rect(statusX, sbh, width, height-1);
    stroke(0);
    strokeWeight(4);
    line(statusX, sbh, statusX, screenH); // Status line
    line(width-1, 0, width-1, height); // Line on the side
    line(menuW, height-1, width, height-1); //bottom line closing everything
    fill(0);
  }
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
  if (mouseX>=width*0.07 && mouseX <=width*0.13 && mouseY>=0 && mouseY<=height*0.03) {  //reset button ALTERNATIVE TO PRESSING "R" ON KEYBOARD 
    gameStop = false; // each time the reset button is pressed, players are allowed once again to place pieces in the gameboard
    if ( theme == "Theme: Dark") {
      fill(0);
      rect(width*1/3, sbh, width*14/16, height-1);
      stroke(#FFFFFF);
      strokeWeight(4);
      line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
      line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
      line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
      line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
      line(statusX, sbh, statusX, screenH); // Status line
      line(menuW, height-1, width, height-1); //bottom line closing everything
      line(width-1, 0, width-1, height); // Line on the side
    } else if ( theme == "Theme: Light") {
      fill(255);
      rect(width*1/3, sbh, width*14/16, height-1);
      stroke(0);
      strokeWeight(4);
      line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
      line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
      line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
      line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
      line(statusX, sbh, statusX, screenH); // Status line
      line(menuW, height-1, width, height-1); //bottom line closing everything
      line(width-1, 0, width-1, height); // Line on the side
    }

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

void mouseReleased () {
  if (mouseX >= 0 && mouseX <= menuW && mouseY >= sbh+height*0.01 && mouseY <= height*1/4) { // player 1 or player 2 function for either playing against AI or another player
    if (lastPlayerMode == "1~Player") {
      keyPressed();
      Xwin = 0;
      Owin = 0;
      if (theme == "Theme: Dark") {
        drawShapes();

        fill(0);
        stroke(0);
        rect(0, sbh+height*0.015, menuW, sbh-height*0.02);
        fill(255);
        lastPlayerMode = "2~Player";
        textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);
        stroke(255);
        strokeWeight(4);
        line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
        line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

        textDraw(easybutton, mainFont, height, #646464, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); 
        textDraw(mediumbutton, mainFont, height, #646464, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);
        textDraw(hardbutton, mainFont, height, #646464, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);
      } else if (theme == "Theme: Light") {
        drawShapes();

        fill(255);
        stroke(255);
        rect(0, sbh+height*0.015, menuW, sbh-height*0.02);        
        fill(0);
        lastPlayerMode = "2~Player";
        textDraw(lastPlayerMode, mainFont, height, 0, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);
        stroke(0);
        strokeWeight(4);
        line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
        line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

        textDraw(easybutton, mainFont, height, #767676, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); 
        textDraw(mediumbutton, mainFont, height, #767676, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);
        textDraw(hardbutton, mainFont, height, #767676, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);
      }
    } else {
      keyPressed();
      Xwin = 0;
      Owin = 0;
      if (theme == "Theme: Dark") {
        drawShapes();

        fill(0);
        stroke(0);
        rect(0, sbh+height*0.015, menuW, sbh-height*0.02);        
        fill(255);
        lastPlayerMode = "1~Player";
        textDraw(lastPlayerMode, mainFont, height, 255, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);
        stroke(255);
        strokeWeight(4);
        line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
        line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

        textDraw(easybutton, mainFont, height, 255, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); 
        textDraw(mediumbutton, mainFont, height, 255, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);
        textDraw(hardbutton, mainFont, height, 255, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);
      } else if (theme == "Theme: Light") {
        drawShapes();

        fill(255);
        stroke(255);
        rect(0, sbh+height*0.015, menuW, sbh-height*0.02);        
        fill(0);
        lastPlayerMode = "1~Player";
        textDraw(lastPlayerMode, mainFont, height, 0, CENTER, CENTER, 0, height*1.5/16, width*1/3, height*2/16+height*0.05);
        stroke(0);
        strokeWeight(4);
        line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
        line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

        textDraw(easybutton, mainFont, height, 0, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16); 
        textDraw(mediumbutton, mainFont, height, 0, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);
        textDraw(hardbutton, mainFont, height, 0, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);
      }
    }
  }


  if (mouseX >= 0 && mouseX <= menuW && mouseY >= height*4/16 && mouseY <= height*7/16 && lastPlayerMode == "1~Player") { // runs easy AI code when button is clicked
    difficulty = 1;

    if (theme == "Theme: Dark" && lastPlayerMode == "1~Player" && difficulty == 1) {
      keyPressed();

      // easy button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*4/16, menuW, height*3/16);
      textDraw(easybutton, mainFont, height, 0, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      //medium button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*7/16, menuW, height*3/16);
      textDraw(mediumbutton, mainFont, height, 255, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // hard button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*10/16, menuW, height*3/16);
      textDraw(hardbutton, mainFont, height, 255, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(0, height*13/16, width*1/3, height*13/16); // hard button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    } else if (theme == "Theme: Light" && lastPlayerMode == "1~Player" && difficulty == 1) {
      keyPressed();

      // easy button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*4/16, menuW, height*3/16);
      textDraw(easybutton, mainFont, height, 255, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // medium button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*7/16, menuW, height*3/16);
      textDraw(mediumbutton, mainFont, height, 0, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // hard button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*10/16, menuW, height*3/16);
      textDraw(hardbutton, mainFont, height, 0, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(0, height*13/16, width*1/3, height*13/16); // hard button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    }
  }


  if (mouseX >= 0 && mouseX <= menuW && mouseY >= height*7/16 && mouseY <= height*10/16 && lastPlayerMode == "1~Player") { // runs medium AI code when button is clicked
    difficulty = 2;

    if (theme == "Theme: Dark" && lastPlayerMode == "1~Player" && difficulty == 2) {
      keyPressed();

      // medium button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*7/16, menuW, height*3/16);
      textDraw(mediumbutton, mainFont, height, 0, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // easy button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*4/16, menuW, height*3/16);
      textDraw(easybutton, mainFont, height, 255, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // hard button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*10/16, menuW, height*3/16);
      textDraw(hardbutton, mainFont, height, 255, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(0, height*13/16, width*1/3, height*13/16); // hard button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    } else if (theme == "Theme: Light" && lastPlayerMode == "1~Player" && difficulty == 2) {
      keyPressed();

      //medium button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*7/16, menuW, height*3/16);
      textDraw(mediumbutton, mainFont, height, 255, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // easy button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*4/16, menuW, height*3/16);
      textDraw(easybutton, mainFont, height, 0, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // hard button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*10/16, menuW, height*3/16);
      textDraw(hardbutton, mainFont, height, 0, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(0, height*13/16, width*1/3, height*13/16); // hard button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    }
  }


  if (mouseX >= 0 && mouseX <= menuW && mouseY >= height*10/16 && mouseY <= height*13/16 && lastPlayerMode == "1~Player") { // runs hard AI code when button is clicked
    difficulty = 3;

    if (theme == "Theme: Dark" && lastPlayerMode == "1~Player" && difficulty == 3) {
      keyPressed();

      // hard button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*10/16, menuW, height*3/16);
      textDraw(hardbutton, mainFont, height, 0, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(0, height*13/16, width*1/3, height*13/16); // hard button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // easy button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*4/16, menuW, height*3/16);
      textDraw(easybutton, mainFont, height, 255, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      //medium button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*7/16, menuW, height*3/16);
      textDraw(mediumbutton, mainFont, height, 255, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);

      stroke(255);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    } else if (theme == "Theme: Light" && lastPlayerMode == "1~Player" && difficulty == 3) {
      keyPressed();

      // hard button LIGHT -> DARK
      fill(0);
      strokeWeight(0);
      rect(0, height*10/16, menuW, height*3/16);
      textDraw(hardbutton, mainFont, height, 255, CENTER, CENTER, 0, height*8.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(0, height*13/16, width*1/3, height*13/16); // hard button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // easy button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*4/16, menuW, height*3/16);
      textDraw(easybutton, mainFont, height, 0, CENTER, CENTER, 0, height*2.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*1/4, width*1/3, height*1/4); // line between 2 player and easy
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game

      // medium button DARK -> LIGHT
      fill(255);
      strokeWeight(0);
      rect(0, height*7/16, menuW, height*3/16);
      textDraw(mediumbutton, mainFont, height, 0, CENTER, CENTER, 0, height*5.5/16, width*1/3, height*6/16);

      stroke(0);
      strokeWeight(4);
      line(0, height*7/16, width*1/3, height*7/16); // easy button
      line(0, height*10/16, width*1/3, height*10/16); // medium button
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
    }
  }


  if (mouseX >= 0 && mouseX <= menuW && mouseY >= height*13/16 && mouseY <= height) { // function for theme changing
    if ( theme == "Theme: Dark") {
      theme = "Theme: Light";
    } else if ( theme == "Theme: Light") {
      theme = "Theme: Dark";
    }
    keyPressed();
    drawShapes();
  }
}

void keyPressed() {
  if (keyCode == 82) {
    gameStop = false; // each time the reset button is pressed, players are allowed once again to place pieces in the gameboard
    if ( theme == "Theme: Dark") {
      fill(0);
      rect(width*1/3, sbh, width*14/16, height-1);
      stroke(#FFFFFF);
      strokeWeight(4);
      line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
      line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
      line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
      line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
      line(statusX, sbh, statusX, screenH); // Status line
      line(menuW, height-1, width, height-1); //bottom line closing everything
      line(width-1, 0, width-1, height); // Line on the side
    } else if ( theme == "Theme: Light") {
      fill(255);
      rect(width*1/3, sbh, width*14/16, height-1);
      stroke(0);
      strokeWeight(4);
      line(col2x, sbh, col2x, screenH); // tictactoe line 1 (left)
      line(col3x, sbh, col3x, screenH); // tictactoe line 2 (right/center)
      line(menuW, sbh + playareaH*1/3, statusX, sbh + playareaH*1/3); // tictactoe line 1 width (top)
      line(menuW, sbh + playareaH*2/3, statusX, sbh + playareaH*2/3); // tictactoe line 2 width (bottom)
      line(statusX, sbh, statusX, screenH); // Status line
      line(menuW, height-1, width, height-1); //bottom line closing everything
      line(width-1, 0, width-1, height); // Line on the side
    }

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

/*void printGrid()
 {
 println(grid[0][0], grid[1][0], grid[2][0]);
 println(grid[0][1], grid[1][1], grid[2][1]);
 println(grid[0][2], grid[1][2], grid[2][2]);
 println("");
 }*/
