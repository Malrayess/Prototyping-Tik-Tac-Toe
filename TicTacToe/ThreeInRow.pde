boolean check3InRowX = false;
boolean check3InRowO = false;
boolean winX = false;
boolean winO = false;
int count = 0;

void check3InRow() {
  if (checkRows("X") || checkColumn("X") || checkDiagonal("X")) { // calls on the boolean loops
    gameStop = true; // stops any placing after win
    updateStatus("X won the game!"); // text says X won
  } else if (checkRows("O") || checkColumn("O") || checkDiagonal("O")) { // calls on the boolean loops
    gameStop = true; // stops any placing after win
    updateStatus("O won the game!"); // text says O won
  } else if (count == 9) {
    gameStop = true;
    updateStatus("The game is a tie!");
  }
  //println("X wins = "+ str(checkRows("X"))); //inputs into console if X won, calls on checkRows
  //println("O wins = "+ str(checkRows("O"))); //inputs into console if O won, calls on checkRows
}

boolean checkRows(String XorO) { 
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

boolean checkColumn(String XorO) { 
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

boolean checkDiagonal(String XorO) {
  if ((grid[0][0] == XorO && grid[1][1] == XorO && grid[2][2] == XorO) || (grid[0][2] == XorO && grid[1][1] == XorO && grid[2][0] == XorO)) { // checks for the two possible diagonals in the game
    return true; //if win is true, then there are 3 X's or 3 O's in this diagonal, so return true
  } else {
    return false; // if none of the diagonals contain 3 equal, return false
  }
}

//String[][] boardPiece = new String[3][3];
/*String[][] boardPiece = 
 {{"", "", ""}, 
 {"", "", ""}, 
 {"", "", ""}};*/

/*
int row, column;
 void XOboardplacing() { // this is to fill in the XorO in the boardPiece grid/check where XorO is placed 
 if (mouseY > sbh && mouseY < (sbh + playareaH*1/3)) { //For rows of grid
 row = 0;
 println("row = 0");
 } else if (mouseY > (sbh + playareaH*1/3) && mouseY < (sbh + playareaH*2/3)) {
 row = 1;
 println("row = 1");
 } else if (mouseY > (sbh + playareaH*2/3) && mouseY < (height-1)) {
 row = 2;
 println("row = 2");
 }
 
 if (mouseX > menuW && mouseX < col2x) {
 column = 0;
 println("column = 0");
 } else if (mouseX > col2x && mouseX < col3x) {
 column = 1;
 println("column = 1");
 } else if (mouseX > col3x && mouseX < statusX) {
 column = 2;
 println("column = 2");
 }
 
 boardPiece[row][column] = "X";
 }
 */

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
