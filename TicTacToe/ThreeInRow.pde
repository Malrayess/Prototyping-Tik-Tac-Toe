boolean check3InRowX = false;
boolean check3InRowO = false;
boolean winX = false;
boolean winO = false;
int count = 0;

//String[][] boardPiece = new String[3][3];
String[][] boardPiece = {{"X", "", "O"},
                         {"O", "O","O"}, 
                         {"X", "", "X"}};

void check3InRow() {
  println("X wins = "+ str(checkRows("X"))); //inputs into console if X won, calls on checkRows
  println("O wins = "+ str(checkRows("O"))); //inputs into console if O won, calls on checkRows
}

boolean checkRows(String XorO) { 
  for (int i=0; i<3; i++) { //for every row
    boolean win = true;     //set win to true
    for (int j=0; j<3; j++) { //for every column    
      if (boardPiece[i][j] != XorO) {  //if the column does not equal the sign that you are checking
        win = false;                   // meaning its the other, or it's empty, then set win to false
      }                                
    }
    if (win) {
      return true;    //if win is true, then there are 3 X's or 3 O's in this row, so return true
    
    }
  }
  return false;      // if none of the rows contain 3 equal, return false
}

  boolean checkNestedFOR(String symbol, String[][] pieces) {
  boolean win = false;
  //grid[row, column], a 2D array used to store the pieces 

  //(1D):3 in a row increase by 1 [0,1,2 | 1,2,3 | 2,3,4]
  //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
  //R+1/C(same), R+1/C=1(same), R+1/C=2(same)
  if (grid[0][0] == symbol && grid[0][1] == symbol && pieces[0][2] == symbol) {
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
  if (pieces[2][0] == symbol && pieces[2][1] == symbol && pieces[2][2] == symbol) {
    //println("Middle: ", "\t\tFirst", "\t\tWin");
    win = true;
  } else {
    //println("Middle: ", "\t\tFirst", "\t\tNothing");
  }

  //(1D):3 in a row increase by 2 [2,4,6]
  //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
  //R(same)/C+1, R=1()/C+1, R=2(same)/C+1
  if (pieces[0][2] == symbol && pieces[1][1] == symbol && pieces[2][0] == symbol) {
    //println("Middle: ", "\t\tFirst", "\t\tWin");
    win = true;
  } else {
    //println("Middle: ", "\t\tFirst", "\t\tNothing");
  }

  //(1D):3 in a row increase by 3 [0,3,6 | 1,4,7 | 2,5,8]
  //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
  //R(same)/C+1, R=1(same)/C+1, R=2(same)/C+1
  if (pieces[0][0] == symbol && pieces[1][0] == symbol && pieces[2][0] == symbol) {
    //println("Middle: ", "\t\tFirst", "\t\tWin");
    win = true;
  } else {
    //println("Middle: ", "\t\tFirst", "\t\tNothing");
  }
  if (pieces[0][1] == symbol && pieces[1][1] == symbol && pieces[2][1] == symbol) {
    //println("Middle: ", "\t\tFirst", "\t\tWin");
    win = true;
  } else {
    //println("Middle: ", "\t\tFirst", "\t\tNothing");
  }
  if (pieces[0][2] == symbol && pieces[1][2] == symbol && pieces[2][2] == symbol) {
    //println("Middle: ", "\t\tFirst", "\t\tWin");
    win = true;
  } else {
    //println("Middle: ", "\t\tFirst", "\t\tNothing");
  }

  //(1D):3 in a row increase by 4 [0,4,8]
  //(2D):3 in a row (as it is going down, how R changes & how C changes in each IF statement)
  //R+1/C+1, R+1/C+1, R+1/C+1
  if (pieces[0][0] == symbol && pieces[1][1] == symbol && pieces[2][2] == symbol) {
    //println("Middle: ", "\t\tFirst", "\t\tWin");
    win = true;
  } else {
    //println("Middle: ", "\t\tFirst", "\t\tNothing");
  }
  return win;
}
