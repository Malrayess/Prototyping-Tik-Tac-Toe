void placeEasyAI() { //function for placing AI "O"
  filled = false;
  while (filled == false) {
    int j = (int)random(3);
    int i = (int)random(3);
    if (grid[j][i] == "") { // if grid cell is empty
      placing(j, i, "O"); // places O
      grid[j][i] = "O"; // fills that part with O so nothing else is placed and does not allow X to be placed there either
      filled = true;
    }
  }
}

//PAST ATTEMPT, THIS WAS A SCANNER THAT ONLY GENERATED THE "O" WHEN THE CELL WAS EMPTY NOT AT RANDOM, ONCE ONE CELL WAS FILLED IT WOULD PLACE IT IN THE NEXT
/*boolean filled = false;
 for (int i=0; i<3; i++) { // i = row
 for (int j=0; j<3; j++) { // j = column
 
 if (grid[j][i] == "") { // if grid cell is empty
 placing(j, i, "O"); // places O
 grid[j][i] = "O"; // fills that part with O so nothing else is placed and does not allow X to be placed there either
 filled = true;
 break; // jumps out of for loop
 }
 }
 if (filled) {
 break;
 }
 }
 }*/
