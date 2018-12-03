
// minor tools for Solver 

void startSolver() { 
  // start Solver   
  println("Start solving "
    +dateTimeStampLong()
    +"."); 
  mainCube.clear();
  simulationCube.clear();
  usedPiecesClear();
  background(90); 
  text("Solving...\n\n\nplease note that he finds identical solutions which are just the rotated cube", 
    200, 200, 
    width-300, 900);
  state=STATE_SOLVE;
}

void resetRotation() {
  for (Piece pieceCurrent : pieces) {
    pieceCurrent.resetPiece();
  }
}

void rotate_Times_Cmd(int number, char dirCommand) {
  //
  if (number == 0) 
    return; 

  for (int i=0; i<number; i++) {
    pieces.get(currPlacer).rotate(dirCommand);
  }
} 

boolean checkForSuccess() {
  // SOLVED? This checks if all cubes within Main Cube are occupied (equal to no overlapping) / success
  if (mainCube.countPieces() == 27) {        
    //solved
    foundSolutions++;
    msgError="";
    print("\nSUCCESS. Found "
      + foundSolutions
      + " solution(s). Time: " 
      + dateTimeStampLong()
      + ".");
    mainCube.save1(); // save 
    state=STATE_NORMAL;
    msgError="";
    return true;
  } // if
  //
  return false;
  //
}//func 
//
