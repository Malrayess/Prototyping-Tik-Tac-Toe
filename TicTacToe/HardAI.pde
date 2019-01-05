void placeHardAI() { // attempts to win, tries to attempt double threat as well as tries to win normally
  filled = false; //sets filled to false, not filled

  // CHECKER FOR IF THERE IS TWO O's IN A ROW, THEN PLACE THIRD
  for (int r=0; r<3; r++) { // checks rows
    if (grid[0][r] == "O" && grid[1][r] == "O" && grid[2][r] == "") {
      placing(2, r, "O");
      grid[2][r] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[1][r] == "O" && grid[2][r] == "O" && grid[0][r] == "") {
      placing(0, r, "O");
      grid[0][r] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[0][r] == "O" && grid[2][r] == "O" && grid[1][r] == "") {
      placing(1, r, "O");
      grid[1][r] = "O";
      filled = true; // fills it in
      return;
    }
  }

  for (int c=0; c<3; c++) { // checks columns
    if (grid[c][0] == "O" && grid[c][1] == "O" && grid[c][2] == "") {
      placing(c, 2, "O");
      grid[c][2] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[c][1] == "O" && grid[c][2] == "O" && grid[c][0] == "") {
      placing(c, 0, "O");
      grid[c][0] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[c][0] == "O" && grid[c][2] == "O" && grid[c][1] == "") {
      placing(c, 1, "O");
      grid[c][1] = "O";
      filled = true; // fills it in
      return;
    }
  }

  //checks diagonals
  if (grid[0][0] == "O" && grid[1][1] == "O" && grid[2][2] == "") {
    placing(2, 2, "O");
    grid[2][2] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][1] == "O" && grid[2][2] == "O" && grid[0][0] == "") {
    placing(0, 0, "O");
    grid[0][0] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[0][0] == "O" && grid[2][2] == "O" && grid[1][1] == "") {
    placing(1, 1, "O");
    grid[1][1] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[2][0] == "O" && grid[1][1] == "O" && grid[0][2] == "") {
    placing(0, 2, "O");
    grid[0][2] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][1] == "O" && grid[0][2] == "O" && grid[2][0] == "") {
    placing(2, 0, "O");
    grid[2][0] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[2][0] == "O" && grid[0][2] == "O" && grid[1][1] == "") {
    placing(1, 1, "O");
    grid[1][1] = "O"; // puts it in the grid that O has been placed there, stops it from placing again
    filled = true; // fills it in
    return;
  }

  // CHECKER FOR IF THEIR IS ONE O, THEN IT TRIES TO WIN BY PLACING AN O BESIDE IT, THEN READS CODE ABOVE^^ IF THIRD SPOT EMPTY IT PLACES IT THERE
  for (int r=0; r<3; r++) { // checks rows
    if (grid[0][r] == "O" && grid[1][r] == "" && grid[2][r] == "") {
      placing(1, r, "O");     
      grid[1][r] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[1][r] == "O" && grid[2][r] == "" && grid[0][r] == "") {
      placing(0, r, "O");   
      grid[0][r] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[2][r] == "O" && grid[1][r] == "" && grid[0][r] == "") {
      placing(1, r, "O");       
      grid[1][r] = "O";
      filled = true; // fills it in
      return;
    }
  }

  for (int c=0; c<3; c++) { // checks columns
    if (grid[c][0] == "O" && grid[c][1] == "" && grid[c][2] == "") {
      placing(c, 1, "O");       
      grid[c][1] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[c][1] == "O" && grid[c][2] == "" && grid[c][0] == "") {
      placing(c, 0, "O");        
      grid[c][0] = "O";
      filled = true; // fills it in
      return;
    }
    if (grid[c][2] == "O" && grid[c][1] == "" && grid[c][0] == "") {
      placing(c, 1, "O");       
      grid[c][1] = "O";
      filled = true; // fills it in
      return;
    }
  }
  
    //checks diagonals
  if (grid[0][0] == "O" && grid[1][1] == "" && grid[2][2] == "") {
    placing(1, 1, "O");     
    grid[1][1] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][1] == "O" && grid[2][2] == "" && grid[0][0] == "") {
    placing(0, 0, "O");     
    grid[0][0] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[2][2] == "O" && grid[1][1] == "" && grid[0][0] == "") {
    placing(1, 1, "O");     
    grid[1][1] = "O";
    filled = true; // fills it in
    return;
  }

  if (grid[2][0] == "O" && grid[1][1] == "" && grid[0][2] == "") {
    placing(1, 1, "O");     
    grid[1][1] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][1] == "O" && grid[0][2] == "" && grid[2][0] == "") {
    placing(2, 0, "O");     
    grid[2][0] = "O";
    filled = true; // fills it in
    return;
  }
  if (grid[1][0] == "O" && grid[1][1] == "" && grid[2][0] == "") {
    placing(1, 1, "O");    
    grid[1][1] = "O"; // puts it in the grid that O has been placed there, stops it from placing again
    filled = true; // fills it in
    return;
  }
}
