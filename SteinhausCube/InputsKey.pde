
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
    keyPressedForSTATE_STATE_PREPARE_SOLVE();   
    break; 

  case STATE_SOLVE: 
    key=0; // kill Escape
    break;

  default:
    //error
    println ("Error 127, tab InputsKey ++++++++++"); 
    exit(); 
    break;
    //
  } // switch
} //func 

// ------------------------------------------------------------------

void keyPressedForSTATE_STATE_PREPARE_SOLVE() {
  // screen with a question, do you want to start solving? 
  if (key=='y') {
    // yes, solve
    startSolver();
  } else if (key == 'n' || key == ESC) {
    // no, abort 
    state=STATE_NORMAL;
    key=0;// kill Escape
  } else if (key == 'k') {
    // letter k: toggle 
    flagProgramFindsOnlyFirstSolution = 
      !flagProgramFindsOnlyFirstSolution;
  }
}//func 

void keyPressedForSTATE_LOAD_SOLUTION() {

  if (key==CODED) {
    // coded key

    boolean hasChangedCrs=false; 
    errText = "";

    if (keyCode==LEFT) {
      alFiles_i--;
      if (alFiles_i<0) {
        alFiles_i=0;
        errText = "first file";
      }  
      hasChangedCrs=true;
    } else if  (keyCode==RIGHT) {
      alFiles_i++; 
      if (alFiles_i>=alFiles.size()) {
        alFiles_i=alFiles.size()-1;
        errText = "last file";
      }
      hasChangedCrs=true;
    }//else if

    if (hasChangedCrs) {
      // load solution file 
      loadSolutionFile();
    }//if
    //
    return; // leave here (coded keys) 
    //
  }//if

  //---
  //only not coded keys here :  

  if (key=='#'||key==ESC) {
    // go back to main screen; 
    // key # toggles (see other function keyPressedForStateNormal())
    mainCube.clear();
    state=STATE_NORMAL;
    key=0; // kill Escape
  } else if (key=='+') {
    showSolutionAsExploded_View_Drawing = 
      !showSolutionAsExploded_View_Drawing;
  } else if (key>='0' && key<='5') {
    // array of exploded status for each piece
    int index_Piece = int(key+""); 
    explodeViewAllowed[index_Piece] = 
      !explodeViewAllowed[index_Piece];
  } else if (key==' ') {
    // space bar 
    flagShowExploded = 
      !flagShowExploded;
  } else if (key=='r') {
    // letter r
    mainCubeRotate = 
      !mainCubeRotate;
  }//else if

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
    else if (key=='#') { 
      // load solution file 
      loadSolutionFile();
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
