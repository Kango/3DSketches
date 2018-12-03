
// depending from state these functions are called from draw() 

void drawForStateNormal() {

  // normal state / normal view 

  // show 6 pieces 
  for (Piece currentPiece : pieces) {
    currentPiece.display();
  } //for

  // show target cube and Simulation cube 
  if (showSimulationCube)
    simulationCube.display();
  mainCube.display();

  // error message 
  fill(255, 0, 0); 
  text(msgError, 300, 410);  

  // for target cube / Simulation cube: angle
  if (mainCubeRotate && !mousePressed) {
    angle1+=.041;
  }

  // 2D part / HUD  ---------
  camera();
  noLights();
  //  hint(DISABLE_DEPTH_MASK);
  hint(DISABLE_DEPTH_TEST);

  // show 6 pieces 
  for (Piece currentPiece : pieces) {
    if (usedPieces[currentPiece.ID]) {
      showCross (currentPiece.pos.x-460, currentPiece.pos.y-410);
    }
  }//for

  // show text / instructions
  showInstructions(MAIN_HELP);
}

void drawForStateMainCube() {

  // View like normal view but shows main cube (central and big) without the 6 pieces  

  // show target cube and Simulation cube 
  mainCube.display();
  if (showSimulationCube)
    simulationCube.display();

  // for target cube / Simulation cube: angle
  if (mainCubeRotate && !mousePressed) {
    angle1+=.041;
  }

  // 2D part / HUD  ---------
  camera();
  noLights();
  hint(DISABLE_DEPTH_TEST);

  // error message 
  fill(255, 0, 0); 
  textSize(28); 
  text(msgError, 17, height-19);  

  if (currPlacer!=-1) {
    fill(0); 
    textSize(28); 
    text("piece is pending - use return to place the piece", 
      width/2+17, height-19);
  }

  // show text / instructions
  showInstructions(MAIN_HELP);
} // func 

void drawForStateShowSolution() {

  // shows a loaded solution as cube. 
  // Exploded View Drawing.
  // View like normal view but shows main cube (central and big) without the 6 pieces  

  // show target cube and Simulation cube
  if (showSolutionAsExploded_View_Drawing)
    mainCube.displayAsExploded_View_Drawing(false);
  else
    mainCube.displayAsExploded_View_Drawing(true); 

  // for target cube / Simulation cube: angle
  if (mainCubeRotate && !mousePressed) {
    angle1+=.041;
  }

  // 2D part / HUD  -------
  camera();
  noLights();
  hint(DISABLE_DEPTH_TEST);

  // show text / instructions
  showInstructions(MAIN_HELP_SOLUTION);
  text("Eject Status: "
    +ejectStatus(), 
    width-200, 264 );
  fill(255);
  text(alFileName, 23, height-23);
  text(errText, 223, height-23);
  //
} // func 

void drawForStatePrepareSolve() {
  textAlign(CENTER); 
  textFont(pfont); 
  fill(255);

  text ("This will take maybe 3 or 4 minutes and the program is stuck during this time. "
    +"\nThe screen is not updated. For information see direct window.\n\n"
    +"\n\n\n(please note that he also finds identical solutions which are just the rotated cube)\n\n"
    +"Do you want to continue?  \n\n\ny / n", 
    width/2, 220);

  textAlign(LEFT);
  String textSol1 = "\nHit k to change";
  if (flagProgramFindsOnlyFirstSolution) 
    text("finds only first solution"+textSol1, 
      20, 200, 
      width-300, 900);
  else 
  text("finds every solution"+textSol1, 
    20, 200, 
    width-300, 900);
} // func 

void drawForStateSolve() {

  // SOLVER - takes approx. 4 minutes to one night 

  solve(); // see tab Solver1
  state=STATE_NORMAL;
} // func 
//
