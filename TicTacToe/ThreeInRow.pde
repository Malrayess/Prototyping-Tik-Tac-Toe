boolean check3InRowX = false;
boolean check3InRowO = false;
boolean winX = false;
boolean winO = false;
int count = 0;
int Xwin = 0;
int Owin = 0;

void check3InRow() {
  if (checkRows("X") || checkColumn("X") || checkDiagonal("X")) { // calls on the boolean loops
    gameStop = true; // stops any placing after win
    updateStatus("X won the game!"); // text says X won
    Xwin += 1;    
    printWinScore("X");
  } else if (checkRows("O") || checkColumn("O") || checkDiagonal("O")) { // calls on the boolean loops
    gameStop = true; // stops any placing after win
    updateStatus("O won the game!"); // text says O won
    Owin += 1;
    printWinScore("O");
  } else if (count == 9) {
    gameStop = true;
    updateStatus("The game is a tie!");
  }
}

void printWinScore (String winner) {
  if (winner == "X") {
    if ( theme == "Theme: Dark") {
      fill(0);
      rect(menuW, 0, width, sbh);
      fill(255);
      stroke(#FFFFFF);
      strokeWeight(4);
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
      line(width, sbh, width*1/3, sbh); //scoreboard
      line(width-1, 0, width-1, height); // Line on the side
      textDraw(textscoreboard, mainFont, height, 255, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16);
      textDraw(xscoreboard + Xwin, secondaryFont, height, 255, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16);
      textDraw(oscoreboard + Owin, secondaryFont, height, 255, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16);
    } else if ( theme == "Theme: Light") {
      fill(255);
      rect(menuW, 0, width, sbh);
      fill(0);
      stroke(0);
      strokeWeight(4);
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
      line(width, sbh, width*1/3, sbh); //scoreboard
      line(width-1, 0, width-1, height); // Line on the side
      textDraw(textscoreboard, mainFont, height, 0, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16);
      textDraw(xscoreboard + Xwin, secondaryFont, height, 0, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16);
      textDraw(oscoreboard + Owin, secondaryFont, height, 0, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16);
    }
  } else if (winner == "O") {
    if ( theme == "Theme: Dark") {
      fill(0);
      rect(menuW, 0, width, sbh);
      fill(255);
      stroke(#FFFFFF);
      strokeWeight(4);
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
      line(width, sbh, width*1/3, sbh); //scoreboard
      line(width-1, 0, width-1, height); // Line on the side
      textDraw(textscoreboard, mainFont, height, 255, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16);
      textDraw(xscoreboard + Xwin, secondaryFont, height, 255, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16);
      textDraw(oscoreboard + Owin, secondaryFont, height, 255, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16);
    } else if ( theme == "Theme: Light") {
      fill(255);
      rect(menuW, 0, width, sbh);
      fill(0);
      stroke(0);
      strokeWeight(4);
      line(width*1/3, 0, width*1/3, height); // dividing line between buttons and the game
      line(width, sbh, width*1/3, sbh); //scoreboard
      line(width-1, 0, width-1, height); // Line on the side
      textDraw(textscoreboard, mainFont, height, 0, CENTER, TOP, width*7.7/16, 0, width*12/16, height*6/16);
      textDraw(xscoreboard + Xwin, secondaryFont, height,0, TOP, CENTER, width*8/16, height*0.01, width*4/16, height*2/16);
      textDraw(oscoreboard + Owin, secondaryFont, height, 0, TOP, CENTER, width*12/16, height*0.01, width*4/16, height*2/16);
    }
  }
}

boolean checkRows(String XorO) { // function that checks 3 in a row horizontally
  for (int i=0; i<3; i++) { //for every row
    boolean win = true;     //set win to true
    for (int j=0; j<3; j++) { //for every column    
      if (grid[i][j] != XorO) {  //if the column does not equal the sign that you are checking
        win = false;                   // meaning its the other, or it's empty, then set win to false
      }
    }
    if (win) {
      return true;    //if win is true, then there are 3 X's or 3 O's in this row, so return true
    }
  }
  return false;      // if none of the rows contain 3 equal, return false
}

boolean checkColumn(String XorO) { // function that checks 3 in a row vertically
  for (int i=0; i<3; i++) { //for every column
    boolean win = true;     //set win to true
    for (int j=0; j<3; j++) { //for every column    
      if (grid[j][i] != XorO) {  //if the column does not equal the sign that you are checking
        win = false;                   // meaning its the other, or it's empty, then set win to false
      }
    }
    if (win) {
      return true;    //if win is true, then there are 3 X's or 3 O's in this column, so return true
    }
  }
  return false;      // if none of the columns contain 3 equal, return false
}

boolean checkDiagonal(String XorO) { // function that checks 3 in a row diagonally
  if ((grid[0][0] == XorO && grid[1][1] == XorO && grid[2][2] == XorO) || (grid[0][2] == XorO && grid[1][1] == XorO && grid[2][0] == XorO)) { // checks for the two possible diagonals in the game
    return true; //if win is true, then there are 3 X's or 3 O's in this diagonal, so return true
  } else {
    return false; // if none of the diagonals contain 3 equal, return false
  }
}

/* HARDCODED TROUBLE THAT CAN BE SYMPLIFIED, NOT USED BECAUSE IT TAKES TOO LONG AND IS TOO MUCH CODE
 boolean checkNestedFOR(String symbol) {
 boolean win = false;
 //grid[row, column], a 2D array used to store the pieces 
 
 //(1D):3 in a row increase by 1 [0,1,2 | 1,2,3 | 2,3,4]
 //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
 //R+1/C(same), R+1/C=1(same), R+1/C=2(same)
 if (grid[0][0] == symbol && grid[0][1] == symbol && grid[0][2] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 if (grid[1][0] == symbol && grid[1][1] == symbol && grid[1][2] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 if (grid[2][0] == symbol && grid[2][1] == symbol && grid[2][2] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 
 //(1D):3 in a row increase by 2 [2,4,6]
 //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
 //R(same)/C+1, R=1()/C+1, R=2(same)/C+1
 if (grid[0][2] == symbol && grid[1][1] == symbol && grid[2][0] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 
 //(1D):3 in a row increase by 3 [0,3,6 | 1,4,7 | 2,5,8]
 //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
 //R(same)/C+1, R=1(same)/C+1, R=2(same)/C+1
 if (grid[0][0] == symbol && grid[1][0] == symbol && grid[2][0] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 if (grid[0][1] == symbol && grid[1][1] == symbol && grid[2][1] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 if (grid[0][2] == symbol && grid[1][2] == symbol && grid[2][2] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 
 //(1D):3 in a row increase by 4 [0,4,8]
 //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
 //R+1/C+1, R+1/C+1, R+1/C+1
 if (grid[0][0] == symbol && grid[1][1] == symbol && grid[2][2] == symbol) {
 //println("Middle: ", "\t\tFirst", "\t\tWin");
 win = true;
 } else {
 //println("Middle: ", "\t\tFirst", "\t\tNothing");
 }
 return win;
 }
 */
