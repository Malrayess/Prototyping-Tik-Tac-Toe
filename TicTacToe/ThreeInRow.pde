boolean check3InRowX = false;
boolean check3InRowO = false;
boolean winX = false;
boolean winO = false;
int count = 0;

String[][] boardPiece = new String[3][3];
String[][] onlyXPiece = new String[3][3];
String[][] onlyOPiece = new String[3][3];

void check3InRow() {
  if (count >= 5) {
    check3InRowX = true;
    check3InRowO = true;
  }

  if (check3InRowX == true) {
    onlyX();
    winX = checkNestedFOR("X", onlyXPiece);
  }

  if (check3InRowO == true) {
    onlyO();
    winO = checkNestedFOR("O", onlyOPiece);
  }

  println("X's won:", winX);
  println("O's won:", winO);
}

void onlyX() { //views only X pieces, runs checker for onlyX
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      if (boardPiece[i][j] == "X") {
        onlyXPiece[i][j] = "X";
      }
    }
  }
}

void onlyO() { //views only O pieces, runs checker for onlyO
  for (int i=0; i<3; i++) {
    for (int j=0; j<3; j++) {
      if (boardPiece[i][j] == "O") {
        onlyOPiece[i][j] = "O";
      }
    }
  }
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
