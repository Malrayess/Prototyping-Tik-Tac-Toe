void placeMediumAI() { //function for placing AI "O"
  filled = false; //sets filled to false, not filled

  for (int r=0; r<3; r++) { // checks rows
    if (grid[0][r] == "X" && grid[1][r] == "X" && grid[2][r] == "") {
      placing(2, r, "O");
      grid[2][r] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[1][r] == "X" && grid[2][r] == "X" && grid[0][r] == "") {
      placing(0, r, "O");
      grid[0][r] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[0][r] == "X" && grid[2][r] == "X" && grid[1][r] == "") {
      placing(1, r, "O");
      grid[1][r] = "O";
      filled = true; // fills it in
      return;
    }
  }

  for (int c=0; c<3; c++) { // checks columns
    if (grid[c][0] == "X" && grid[c][1] == "X" && grid[c][2] == "") {
      placing(c, 2, "O");
      grid[c][2] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[c][1] == "X" && grid[c][2] == "X" && grid[c][0] == "") {
      placing(c, 0, "O");
      grid[c][0] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[c][0] == "X" && grid[c][2] == "X" && grid[c][1] == "") {
      placing(c, 1, "O");
      grid[c][1] = "O";
      filled = true; // fills it in
      return;
    }
  }

  //checks diagonals
  if (grid[0][0] == "X" && grid[1][1] == "X" && grid[2][2] == "") {
    placing(2, 2, "O");
    grid[2][2] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][1] == "X" && grid[2][2] == "X" && grid[0][0] == "") {
    placing(0, 0, "O");
    grid[0][0] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[0][0] == "X" && grid[2][2] == "X" && grid[1][1] == "") {
    placing(1, 1, "O");
    grid[1][1] = "O";
    filled = true; // fills it in
    return;
  }

  if (grid[2][0] == "X" && grid[1][1] == "X" && grid[0][2] == "") {
    placing(0, 2, "O");
    grid[0][2] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][1] == "X" && grid[0][2] == "X" && grid[2][0] == "") {
    placing(2, 0, "O");
    grid[2][0] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[2][0] == "X" && grid[0][2] == "X" && grid[1][1] == "") {
    placing(1, 1, "O");
    grid[1][1] = "O"; // puts it in the grid that O has been placed there, stops it from placing again
    filled = true; // fills it in
    return;
  }
}
