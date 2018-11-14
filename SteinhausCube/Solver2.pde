
// minor tools for Solver 

void startSolver() { 
  // start Solver   
  println("solving...."); 
  mainCube.clear();
  simulationCube.clear();
  usedPiecesClear();
  background(90); 
  text("Solving...", 200, 200);
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
    print("\nSUCCESS. Found "
      + foundSolutions
      + " solution. Time: " 
      + dateTimeStampLong()
      + ".");
    mainCube.save1();
    state=STATE_NORMAL;
    msgError="";
    return true;
  } // if
  //
  return false;
  //
}//func 

int usedPiecesCounter() {
  // SOLVER 
  // how many of the 6 pieces are in use? 
  int counter=0; 
  for (int i=0; i<usedPieces.length; i++) {
    if (usedPieces[i]) 
      counter++;
  }
  return counter;
}

void rotate1( char command1 ) {
  // SOLVER 
  if (currPlacer==-1)
    return;

  // rotate 
  simulationCube.clear();
  pieces.get(currPlacer).rotate(command1);
  pieces.get(currPlacer).copyPieceIntoSimulationCube();
}
//
