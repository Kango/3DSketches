
// main tab for Solver (solve() is called by drawForStateSolve()) 

void solve() {

    // Solver 

    //reset 
    mainCube.clear();
    simulationCube.clear();
    usedPiecesClear(); 

    offsetX=0;  
    offsetY=0; 
    offsetZ=0; 
    
    solveHelper();

    println(
      "\nleaving solve. Found "
      +foundSolutions
      +" solution(s). Time: "
      +dateTimeStampLong()
      +"."); 
  //
} //func

void solveHelper() {
  //   
  // *******************************************
  // CODE automatic generated 
  // *******************************************

        // reset rotation
        resetRotation();
        simulationCube.clear();
     
        // for ALL for-loops for position 
        int valueToExploreStart = 4; // 4  (4 to 6 not working, 5 to 7 not working)
        int valueToExploreEnd   = 7; // 7            

  // rotate 
  for (int rotX0 = 0; rotX0 < 3; rotX0++) {
    for (int rotY0 = 0; rotY0 < 3; rotY0++) {
      for (int rotZ0 = 0; rotZ0 < 3; rotZ0++) {
  // move 
  for (int xPos0=valueToExploreStart; xPos0<valueToExploreEnd; xPos0++) {
    for (int yPos0=valueToExploreStart; yPos0<valueToExploreEnd; yPos0++) {
      for (int zPos0=valueToExploreStart; zPos0<valueToExploreEnd; zPos0++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xPos0;
      offsetY=yPos0;
      offsetZ=zPos0;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX1 = 0; rotX1 < 3; rotX1++) {
    for (int rotY1 = 0; rotY1 < 3; rotY1++) {
      for (int rotZ1 = 0; rotZ1 < 3; rotZ1++) {
  // move 
  for (int xPos1=valueToExploreStart; xPos1<valueToExploreEnd; xPos1++) {
    for (int yPos1=valueToExploreStart; yPos1<valueToExploreEnd; yPos1++) {
      for (int zPos1=valueToExploreStart; zPos1<valueToExploreEnd; zPos1++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xPos0;
      offsetY=yPos0;
      offsetZ=zPos0;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[1];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX1, 'q');
        rotate_Times_Cmd(rotY1, 'w');
        rotate_Times_Cmd(rotZ1, 'e');
      offsetX=xPos1;
      offsetY=yPos1;
      offsetZ=zPos1;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX2 = 0; rotX2 < 3; rotX2++) {
    for (int rotY2 = 0; rotY2 < 3; rotY2++) {
      for (int rotZ2 = 0; rotZ2 < 3; rotZ2++) {
  // move 
  for (int xPos2=valueToExploreStart; xPos2<valueToExploreEnd; xPos2++) {
    for (int yPos2=valueToExploreStart; yPos2<valueToExploreEnd; yPos2++) {
      for (int zPos2=valueToExploreStart; zPos2<valueToExploreEnd; zPos2++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xPos0;
      offsetY=yPos0;
      offsetZ=zPos0;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[1];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX1, 'q');
        rotate_Times_Cmd(rotY1, 'w');
        rotate_Times_Cmd(rotZ1, 'e');
      offsetX=xPos1;
      offsetY=yPos1;
      offsetZ=zPos1;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[2];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX2, 'q');
        rotate_Times_Cmd(rotY2, 'w');
        rotate_Times_Cmd(rotZ2, 'e');
      offsetX=xPos2;
      offsetY=yPos2;
      offsetZ=zPos2;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {
  
  // rotate 
  for (int rotX3 = 0; rotX3 < 3; rotX3++) {
    for (int rotY3 = 0; rotY3 < 3; rotY3++) {
      for (int rotZ3 = 0; rotZ3 < 3; rotZ3++) {
  // move 
  for (int xPos3=valueToExploreStart; xPos3<valueToExploreEnd; xPos3++) {
    for (int yPos3=valueToExploreStart; yPos3<valueToExploreEnd; yPos3++) {
      for (int zPos3=valueToExploreStart; zPos3<valueToExploreEnd; zPos3++) {
             
 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xPos0;
      offsetY=yPos0;
      offsetZ=zPos0;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[1];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX1, 'q');
        rotate_Times_Cmd(rotY1, 'w');
        rotate_Times_Cmd(rotZ1, 'e');
      offsetX=xPos1;
      offsetY=yPos1;
      offsetZ=zPos1;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[2];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX2, 'q');
        rotate_Times_Cmd(rotY2, 'w');
        rotate_Times_Cmd(rotZ2, 'e');
      offsetX=xPos2;
      offsetY=yPos2;
      offsetZ=zPos2;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[3];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX3, 'q');
        rotate_Times_Cmd(rotY3, 'w');
        rotate_Times_Cmd(rotZ3, 'e');
      offsetX=xPos3;
      offsetY=yPos3;
      offsetZ=zPos3;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX4 = 0; rotX4 < 3; rotX4++) {
    for (int rotY4 = 0; rotY4 < 3; rotY4++) {
      for (int rotZ4 = 0; rotZ4 < 3; rotZ4++) {
  // move 
  for (int xPos4=valueToExploreStart; xPos4<valueToExploreEnd; xPos4++) {
    for (int yPos4=valueToExploreStart; yPos4<valueToExploreEnd; yPos4++) {
      for (int zPos4=valueToExploreStart; zPos4<valueToExploreEnd; zPos4++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xPos0;
      offsetY=yPos0;
      offsetZ=zPos0;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[1];
        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX1, 'q');
        rotate_Times_Cmd(rotY1, 'w');
        rotate_Times_Cmd(rotZ1, 'e');
      offsetX=xPos1;
      offsetY=yPos1;
      offsetZ=zPos1;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[2];
        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX2, 'q');
        rotate_Times_Cmd(rotY2, 'w');
        rotate_Times_Cmd(rotZ2, 'e');
      offsetX=xPos2;
      offsetY=yPos2;
      offsetZ=zPos2;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[3];
        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX3, 'q');
        rotate_Times_Cmd(rotY3, 'w');
        rotate_Times_Cmd(rotZ3, 'e');
      offsetX=xPos3;
      offsetY=yPos3;
      offsetZ=zPos3;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

        currPlacer = arrOfIL[4];
        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX4, 'q');
        rotate_Times_Cmd(rotY4, 'w');
        rotate_Times_Cmd(rotZ4, 'e');
      offsetX=xPos4;
      offsetY=yPos4;
      offsetZ=zPos4;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX5 = 0; rotX5 < 3; rotX5++) {
    for (int rotY5 = 0; rotY5 < 3; rotY5++) {
      for (int rotZ5 = 0; rotZ5 < 3; rotZ5++) {
  // move 
  for (int xPos5=valueToExploreStart; xPos5<valueToExploreEnd; xPos5++) {
    for (int yPos5=valueToExploreStart; yPos5<valueToExploreEnd; yPos5++) {
      for (int zPos5=valueToExploreStart; zPos5<valueToExploreEnd; zPos5++) {

        resetRotation();

        currPlacer = arrOfIL[5];

        // rotate x times
        rotate_Times_Cmd(rotX5, 'q');
        rotate_Times_Cmd(rotY5, 'w');
        rotate_Times_Cmd(rotZ5, 'e');
      offsetX=xPos5;
      offsetY=yPos5;
      offsetZ=zPos5;
      
        // clear
        simulationCube.clear();

        // place piece inside SIM CUBE
        if (pieces.get(currPlacer).simulateOK()) {

          pieces.get(currPlacer).copyPieceIntoSimulationCube();

          if (simulationCube.copySimulationToMainCube()) {
            // good result ! 
            // simulationCube.clear();
          } else continue; 
        } else continue; 

  // solved ?
  if(checkForSuccess()){   // (if solved, saving etc. is done in checkForSuccess())
    // yes, solved 
    // Do we search only one solution? 
    if(flagProgramFindsOnlyFirstSolution){
      // yes, leave here (else continue)
      return; 
    }//if
  }//if
  
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
}
  }}}}}}}}}}}}}}}}}}}

  // *******************************************
  // END  CODE  automatic generated 
  // *******************************************
}//func
//
