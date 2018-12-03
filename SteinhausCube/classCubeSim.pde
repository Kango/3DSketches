
// a invisible cube for simulation. 
// When placing and moving a piece, it is placed in this cube first. 
// When hitting return, the cube gets copied into the main cube.

class SimulationCube {

  int MAX = 13; 

  boolean[][][] layout = new boolean [13] [13] [13];
  color[][][] col = new color [13] [13] [13];

  float size = sizeNormal; 

  PVector posNormal = new PVector();
  PVector pos = new PVector();

  // constr 
  SimulationCube ( float xTemp, float yTemp, float zTemp) {

    clear();

    pos.x=xTemp; 
    pos.y=yTemp; 
    pos.z=zTemp;

    posNormal = pos.copy();
  } // constr 

  void clear() {
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          layout[x][y][z]=false;
        }//for
      }//for
    }//for
  }

  void display() {

    switch (state) { 
    case STATE_NORMAL: 
      size = sizeNormal ; 
      pos  = posNormal.copy(); 
      break; 

    case STATE_MAIN_CUBE:
    case STATE_SOLVE: 
      size = sizeMax ;
      pos  = posMax.copy(); 
      break;
    }//switch 

    pushMatrix();

    translate(pos.x, pos.y, pos.z);

    if (freeRotateMainCube) {
      rotateY(map(mouseX, 0, width, -PI, TWO_PI));
      rotateZ(map(mouseY, 0, width, -PI, TWO_PI));
    } else {
      rotateY(angle1);
      // rotateZ(angle2);
    }

    stroke(0); 
    noFill();

    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {

          pushMatrix();

          translate ((float(x)-(8.0-1.5))*size, 
            (float(y)-(8.0-1.5))*size, 
            (float(z)-(8.0-1.5))*size); 

          noFill();
          if (layout[x][y][z]) {
            fill(col[x][y][z]);
            stroke(255, 255, 0);     
            box(size);
          }
          popMatrix();

        }//for
      }//for
    }//for
    popMatrix();
    //angle1+=.041;
    //angle2+=0.0402;
    stroke(0);
    // simulate to show error msg 
    simulateCopySimulationToMainCube();
  }// method

  boolean copySimulationToMainCube() { 

    // simulate and copy (when no failure, this is real and not a simulation)

    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if ( layout[x][y][z] && 
            !okPosition ( x, y, z, OFFSETX2, OFFSETY2, OFFSETZ2)  ) {
            // failure 
            return false; // failure
          }

          // pos is ok (the above return was not executed)
          if ( layout[x][y][z]) {
            // pos is already occupied 
            if (mainCube.layout[x+OFFSETX2][y+OFFSETY2][z+OFFSETZ2]) {
              // we have an overlapping
              return false; // failure
            }
          }
          //
        }
      }
    }
    // no failure detected 

    // copy (does only execute when no failure was encountered)
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if ( layout[x][y][z] 
            // && okPosition ( x, y, z, OFFSETX2, OFFSETY2, OFFSETZ2) 
            ) {
            // copy 
            mainCube.layout[x+OFFSETX2][y+OFFSETY2][z+OFFSETZ2] = true;
            mainCube.col   [x+OFFSETX2][y+OFFSETY2][z+OFFSETZ2] = col[x][y][z];
          } //if
        }//for
      }//for
    }//for

    // success 
    return true;
  }// method

  boolean simulateCopySimulationToMainCube() {
    // simulate

    // simulate
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if ( layout[x][y][z] && 
            !okPosition ( x, y, z, OFFSETX2, OFFSETY2, OFFSETZ2)  ) {
            // failure 
            msgError="not fully inside cube";
            return false; // failure
          }
        }
      }
    }

    // copy (does only execute when no failure was encountered)
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if ( layout[x][y][z] &&
            okPosition ( x, y, z, OFFSETX2, OFFSETY2, OFFSETZ2) ) {
            // simulate copy 
            // if the target position inside cube is already filled, we have an overlapping
            if (mainCube.layout[x+OFFSETX2][y+OFFSETY2][z+OFFSETZ2]) {
              msgError="overlapping";
              return false;
            }
            //mainCube.layout[x+OFFSETX2][y+OFFSETY2][z+OFFSETZ2] = true;
            //mainCube.col   [x+OFFSETX2][y+OFFSETY2][z+OFFSETZ2] = col[x][y][z];
          } //if
        }//for
      }//for
    }//for

    // success 
    return true;
  }// method

  boolean okPosition ( int x, int y, int z, 
    int offsetX, int offsetY, int offsetZ) {

    boolean returnValueOK = true;

    if (  x+offsetX < 0  ) returnValueOK = false;
    if (  y+offsetY < 0  ) returnValueOK = false;
    if (  z+offsetZ < 0  ) returnValueOK = false;

    if (  x+offsetX >= mainCube.layout.length  ) returnValueOK = false;
    if (  y+offsetY >= mainCube.layout.length  ) returnValueOK = false;
    if (  z+offsetZ >= mainCube.layout.length  ) returnValueOK = false;
    //
    return returnValueOK;
    //
  }// method
  //
} //class
//
