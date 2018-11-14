
// main tab for Solver (solve() is called by drawForStateSolve()) 

void solve() {

    // Solver 

    println(dateTimeStampLong()); 

    //reset 
    mainCube.clear();
    simulationCube.clear();
    usedPiecesClear(); 

    offsetX=0;  
    offsetY=0; 
    offsetZ=0; 
    
    placeOnePiece();

    println("\nleaving solve. Found "
      +foundSolutions
      +" solutions."); 
  //
} //func

void placeOnePiece() {
  //   
  // *******************************************
  // CODE automatic generated 
  // *******************************************


        // reset rotation
        resetRotation();
        simulationCube.clear();
     
        // for ALL except the first
        int valueToExploreStart=4;
        int valueToExploreEnd=7;
        
        // for the first
        int valueToExploreStart2=5;
        int valueToExploreEnd2=7;
        
        // for the 2nd
        int valueToExploreStart3=4;
        int valueToExploreEnd3=6;

 mainCube.clear();
  // rotate 
  for (int rotX0 = 0; rotX0 < 3; rotX0++) {
    for (int rotY0 = 0; rotY0 < 3; rotY0++) {
      for (int rotZ0 = 0; rotZ0 < 3; rotZ0++) {
  // move 
  for (int xAdd0=valueToExploreStart2; xAdd0<valueToExploreEnd2; xAdd0++) {
    for (int yAdd0=valueToExploreStart2; yAdd0<valueToExploreEnd2; yAdd0++) {
      for (int zAdd0=valueToExploreStart2; zAdd0<valueToExploreEnd2; zAdd0++) {

        print("1");
        
 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xAdd0;
      offsetY=yAdd0;
      offsetZ=zAdd0;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX1 = 0; rotX1 < 3; rotX1++) {
    for (int rotY1 = 0; rotY1 < 3; rotY1++) {
      for (int rotZ1 = 0; rotZ1 < 3; rotZ1++) {
  // move 
  for (int xAdd1=valueToExploreStart3; xAdd1<valueToExploreEnd3; xAdd1++) {
    for (int yAdd1=valueToExploreStart3; yAdd1<valueToExploreEnd3; yAdd1++) {
      for (int zAdd1=valueToExploreStart3; zAdd1<valueToExploreEnd3; zAdd1++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xAdd0;
      offsetY=yAdd0;
      offsetZ=zAdd0;

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
      offsetX=xAdd1;
      offsetY=yAdd1;
      offsetZ=zAdd1;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX2 = 0; rotX2 < 3; rotX2++) {
    for (int rotY2 = 0; rotY2 < 3; rotY2++) {
      for (int rotZ2 = 0; rotZ2 < 3; rotZ2++) {
  // move 
  for (int xAdd2=valueToExploreStart; xAdd2<valueToExploreEnd; xAdd2++) {
    for (int yAdd2=valueToExploreStart; yAdd2<valueToExploreEnd; yAdd2++) {
      for (int zAdd2=valueToExploreStart; zAdd2<valueToExploreEnd; zAdd2++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xAdd0;
      offsetY=yAdd0;
      offsetZ=zAdd0;

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
      offsetX=xAdd1;
      offsetY=yAdd1;
      offsetZ=zAdd1;

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
      offsetX=xAdd2;
      offsetY=yAdd2;
      offsetZ=zAdd2;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {
  
  // rotate 
  for (int rotX3 = 0; rotX3 < 3; rotX3++) {
    for (int rotY3 = 0; rotY3 < 3; rotY3++) {
      for (int rotZ3 = 0; rotZ3 < 3; rotZ3++) {
  // move 
  for (int xAdd3=valueToExploreStart; xAdd3<valueToExploreEnd; xAdd3++) {
    for (int yAdd3=valueToExploreStart; yAdd3<valueToExploreEnd; yAdd3++) {
      for (int zAdd3=valueToExploreStart; zAdd3<valueToExploreEnd; zAdd3++) {
             
 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xAdd0;
      offsetY=yAdd0;
      offsetZ=zAdd0;

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
      offsetX=xAdd1;
      offsetY=yAdd1;
      offsetZ=zAdd1;

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
      offsetX=xAdd2;
      offsetY=yAdd2;
      offsetZ=zAdd2;

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
      offsetX=xAdd3;
      offsetY=yAdd3;
      offsetZ=zAdd3;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX4 = 0; rotX4 < 3; rotX4++) {
    for (int rotY4 = 0; rotY4 < 3; rotY4++) {
      for (int rotZ4 = 0; rotZ4 < 3; rotZ4++) {
  // move 
  for (int xAdd4=valueToExploreStart; xAdd4<valueToExploreEnd; xAdd4++) {
    for (int yAdd4=valueToExploreStart; yAdd4<valueToExploreEnd; yAdd4++) {
      for (int zAdd4=valueToExploreStart; zAdd4<valueToExploreEnd; zAdd4++) {

 mainCube.clear();
 resetRotation();
        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xAdd0;
      offsetY=yAdd0;
      offsetZ=zAdd0;

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
      offsetX=xAdd1;
      offsetY=yAdd1;
      offsetZ=zAdd1;

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
      offsetX=xAdd2;
      offsetY=yAdd2;
      offsetZ=zAdd2;

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
      offsetX=xAdd3;
      offsetY=yAdd3;
      offsetZ=zAdd3;

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
      offsetX=xAdd4;
      offsetY=yAdd4;
      offsetZ=zAdd4;

// place piece inside SIM CUBE 
if (pieces.get(currPlacer).simulateOK()) {
pieces.get(currPlacer).copyPieceIntoSimulationCube(); 
if ( simulationCube.copySimulationToMainCube() ) {

  // rotate 
  for (int rotX5 = 0; rotX5 < 3; rotX5++) {
    for (int rotY5 = 0; rotY5 < 3; rotY5++) {
      for (int rotZ5 = 0; rotZ5 < 3; rotZ5++) {
  // move 
  for (int xAdd5=valueToExploreStart; xAdd5<valueToExploreEnd; xAdd5++) {
    for (int yAdd5=valueToExploreStart; yAdd5<valueToExploreEnd; yAdd5++) {
      for (int zAdd5=valueToExploreStart; zAdd5<valueToExploreEnd; zAdd5++) {

mainCube.clear();
resetRotation();

        currPlacer = arrOfIL[0];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX0, 'q');
        rotate_Times_Cmd(rotY0, 'w');
        rotate_Times_Cmd(rotZ0, 'e');
      offsetX=xAdd0;
      offsetY=yAdd0;
      offsetZ=zAdd0;

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

        currPlacer = arrOfIL[1];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX1, 'q');
        rotate_Times_Cmd(rotY1, 'w');
        rotate_Times_Cmd(rotZ1, 'e');
      offsetX=xAdd1;
      offsetY=yAdd1;
      offsetZ=zAdd1;

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

        currPlacer = arrOfIL[2];

        simulationCube.clear();

        // rotate x times
        rotate_Times_Cmd(rotX2, 'q');
        rotate_Times_Cmd(rotY2, 'w');
        rotate_Times_Cmd(rotZ2, 'e');
      offsetX=xAdd2;
      offsetY=yAdd2;
      offsetZ=zAdd2;
      
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

        currPlacer = arrOfIL[3];

        // rotate x times
        rotate_Times_Cmd(rotX3, 'q');
        rotate_Times_Cmd(rotY3, 'w');
        rotate_Times_Cmd(rotZ3, 'e');
      offsetX=xAdd3;
      offsetY=yAdd3;
      offsetZ=zAdd3;
      
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

        currPlacer = arrOfIL[4];

        // rotate x times
        rotate_Times_Cmd(rotX4, 'q');
        rotate_Times_Cmd(rotY4, 'w');
        rotate_Times_Cmd(rotZ4, 'e');
      offsetX=xAdd4;
      offsetY=yAdd4;
      offsetZ=zAdd4;
      
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

        currPlacer = arrOfIL[5];

        // rotate x times
        rotate_Times_Cmd(rotX5, 'q');
        rotate_Times_Cmd(rotY5, 'w');
        rotate_Times_Cmd(rotZ5, 'e');
      offsetX=xAdd5;
      offsetY=yAdd5;
      offsetZ=zAdd5;
      
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
  if(checkForSuccess()){
     return; 
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
}
  }}}}}}}}}}}}}}}}}}}

  // *******************************************
  // END  CODE  automatic generated 
  // *******************************************
}//func
//
