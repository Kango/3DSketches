
// Inputs from keyboard 

void keyPressed () {

  switch (state) {

  case STATE_MAIN_CUBE: 
  case STATE_NORMAL: 
    keyPressedForStateNormal(); 
    break;

  case STATE_LOAD_SOLUTION:
    keyPressedForSTATE_LOAD_SOLUTION();  
    break; 

  case STATE_PREPARE_SOLVE:
    if (key=='y') {
      startSolver();
    } else if (key == 'n' || key == ESC) { 
      state=STATE_NORMAL;
      key=0;// kill Escape
    }
    break; 

  case STATE_SOLVE: 
    // 
    key=0; // kill Escape
    break;

  default:
    //error
    println ("Error 127 ++++++++++"); 
    exit(); 
    break;
    //
  } // switch
}//func 

// ------------------------------------------------------------------

void keyPressedForSTATE_LOAD_SOLUTION() {

  if (key==CODED) {
    // coded key

    boolean hasChangedCrs=false; 

    if (keyCode==LEFT) {
      alFiles_i--;
      if (alFiles_i<0)
        alFiles_i=0;
      hasChangedCrs=true;
    } else if  (keyCode==RIGHT) {
      alFiles_i++; 
      if (alFiles_i>=alFiles.size())
        alFiles_i=alFiles.size()-1;
      hasChangedCrs=true;
    }//else if

    if (hasChangedCrs) {
      // load solution file 
      loadSolutionFile();
    }//if
    return;
  }//if

  //---

  if (key=='#'||key==ESC) { 
    // key # toggles (see other function keyPressedForStateNormal())
    // load solution file 
    mainCube.clear();
    state=STATE_NORMAL;
    key=0; // kill Escape
  }// 
  else if (key=='+') {
    showSolutionAsExploded_View_Drawing = !showSolutionAsExploded_View_Drawing;
  } else if (key>='0' && key<='5') {
    int index_Piece = int(key+""); 
    explodeViewAllowed[index_Piece] = !explodeViewAllowed[index_Piece] ;
  } else if (key==' ') {
    flagShowExploded = !flagShowExploded;
  }
  // 
  key=0; // kill Escape
}//func 

void keyPressedForStateNormal() {
  // 
  boolean changed=false;

  msgError=""; 

  if (key==CODED) {
    // coded key 

    if (currPlacer==-1) 
      return; // leave 

    if (keyCode==LEFT) {
      offsetX--;
      if (! pieces.get(currPlacer).simulateOK())
        offsetX++;
      changed=true;
    } else if (keyCode==RIGHT) {
      offsetX++;
      if (! pieces.get(currPlacer).simulateOK())
        offsetX--;
      changed=true;
    }
    //
    else if (keyCode==UP) {
      offsetY--;
      if (! pieces.get(currPlacer).simulateOK())
        offsetY++;
      changed=true;
    } else if (keyCode==DOWN) {
      offsetY++;
      if (! pieces.get(currPlacer).simulateOK())
        offsetY--;
      changed=true;
    }
  }//if
  // -------------------------------------------------
  else {
    // NOT CODED
    if (key=='p') {
      // similar to cursor keys: z-axis movement
      if (currPlacer==-1) 
        return; // leave 
      offsetZ--;
      if (! pieces.get(currPlacer).simulateOK())
        offsetZ++;
      changed=true;
    } else if (key=='l') { // key L 
      // similar to cursor keys: z-axis movement
      if (currPlacer==-1) 
        return; // leave 
      offsetZ++;
      if (! pieces.get(currPlacer).simulateOK())
        offsetZ--;
      changed=true;
    } 
    //
    else if (key=='#') { // key #
      // load solution file 
      // loadSolutionFile();
      mainCube.load(fileNameSolution);
      alFileName=fileNameSolution;
      state=STATE_LOAD_SOLUTION;
    }//else if 
    // 
    else if (key>='0' && key<='5') {
      // select a piece and copy it into SimulationCube
      currPlacer = int(key+"");
      if (usedPieces[currPlacer]) {
        msgError="piece is already in the cube";
        simulationCube.clear();
        currPlacer = -1;         
        return;
      }
      simulationCube.clear();
      pieces.get(currPlacer).copyPieceIntoSimulationCube();
    } else if (key=='x') {
      mainCube.clear();
      simulationCube.clear();
      usedPiecesClear();
    } else if (key=='r') {
      mainCubeRotate=!mainCubeRotate;
    } else if (key=='f') {
      freeRotateMainCube = ! freeRotateMainCube;
    } else if (key=='m') {
      // toggle between two views 
      if (state==STATE_NORMAL) 
        state = STATE_MAIN_CUBE; 
      else 
      state = STATE_NORMAL;
    } else if (key==ESC) {
      //Escape key
      simulationCube.clear();
      currPlacer = -1;
      if (state==STATE_SOLVE)
        state = STATE_NORMAL; 
      key=0; // kill ESC
    } else if (key=='Z') {
      exit();
      return;
    } else if (key==RETURN||key==ENTER) {
      // return key 
      // copy Simulation cube to main cube
      if (currPlacer==-1)
        return;
      if (simulationCube.copySimulationToMainCube()) {
        // success
        msgError="";
        simulationCube.clear();
        usedPieces[currPlacer]=true; 
        currPlacer=-1; // reset
      } else {
        // failed
        msgError = "Placement not possible\n(piece is not fully inside cube)";
      }
    } else if (key==' ') {
      // space bar [test purpose]
      // showSimulationCube = !showSimulationCube;
    } else if (key=='n') {
      state = STATE_PREPARE_SOLVE;
    } else if (key=='b') {
      // showImageDuringSolver = !showImageDuringSolver; // toggle
    }
    // -------------------------------
    // rotation
    // q/a and w/s and e/d (for the 3 axis)
    else if (
      key=='q'||
      key=='a'||
      key=='w'|| 
      key=='s'||
      key=='e'||
      key=='d') {
      if (currPlacer==-1)
        return;
      // rotate 
      simulationCube.clear();
      pieces.get(currPlacer).rotate(key);
      pieces.get(currPlacer).copyPieceIntoSimulationCube();
    } 
    //
  }//else / not coded  

  //changed ?
  if (changed && currPlacer!=-1) {
    simulationCube.clear();
    // copy piece into SimulationCube
    pieces.get(currPlacer).copyPieceIntoSimulationCube();
    // println(offsetX, offsetY, offsetZ);
    //
  }//if
  //
}
//
