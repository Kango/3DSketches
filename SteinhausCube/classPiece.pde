
// class for one of the 6 pieces 

class Piece {

  final int MAX=3;  // size in cubes per edge 

  color colPiece;  // color
  boolean[][][] layout = new boolean[MAX][MAX][MAX]; // which cubes inside piece are occupied?
  final boolean[][][] layoutUnchanged = new boolean[MAX][MAX][MAX]; // unchanging copy:  which cubes inside piece are occupied? (this is not rotated)

  int size = 35; // pixels 

  // optical rotate 
  float angle1 = random(TWO_PI); 
  float angle2 = random(TWO_PI); 

  // pos 
  PVector pos = new PVector();

  // ID 
  int ID = pieces.size(); 

  // constructor  ----
  Piece ( int[][][] layoutTemp, 
    color colorTemp, 
    float xTemp, float yTemp, float zTemp ) {

    colPiece   = colorTemp; 

    // read layoutTemp
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if (layoutTemp[x][y][z]==1) {
            layout[x][y][z]=true;
          } else { 
            layout[x][y][z]=false;
          } //

          // make a copy 
          layoutUnchanged[x][y][z]=layout[x][y][z];
        }//for
      }//for
    }//for

    // read pos 
    pos.x=xTemp; 
    pos.y=yTemp; 
    pos.z=zTemp;
  } // constr  ---- 

  void display() {
    fill(0); 
    textSize(17); 
    text(ID, pos.x-72, pos.y-66);
    if (ID==currPlacer) {
      text("  current", pos.x-60, pos.y-66);
    }

    pushMatrix();
    translate(pos.x, pos.y, pos.z);
    if (!usedPieces[ID]) {
      rotateY(angle1);
      rotateZ(angle2);
    }

    fill(colPiece); 
    stroke(0); 
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if (layout[x][y][z]) {
            pushMatrix();
            translate ((x-1)*size, (y-1)*size, (z-1)*size); 
            box(size); 
            popMatrix();
          }//if
        }//for
      }//for
    }//for
    popMatrix();

    angle1+=.041;
    angle2+=0.0402;
  }// method

  void copyPieceIntoSimulationCube() {
    // copy piece into Simulation cube;
    // requires that offsetX, offsetY, offsetZ are OK, 
    // otherwise piece is copied only partly. 
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if (layout[x][y][z]  
            // && okPosition( x, y, z, offsetX, offsetY, offsetZ)
            ) {
            simulationCube.layout[x+offsetX][y+offsetY][z+offsetZ] = true;
            simulationCube.col[x+offsetX][y+offsetY][z+offsetZ]    = colPiece;
          }//if
        }//for
      }//for
    }//for
  }// method

  boolean simulateOK() {
    // simulate : copy piece into main cube 
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {

          if (layout[x][y][z] && 
            !okPosition( x, y, z, offsetX, offsetY, offsetZ) ) {
            return false;
          }//if
        }//for
      }//for
    }//for
    return true;
  }// method

  boolean okPosition  ( int x, int y, int z, 
    int offsetX, int offsetY, int offsetZ) {

    boolean returnValueOK = true;

    if (  x+offsetX < 0  ) returnValueOK = false;
    if (  y+offsetY < 0  ) returnValueOK = false;
    if (  z+offsetZ < 0  ) returnValueOK = false;

    if (  x+offsetX >= simulationCube.layout.length  ) returnValueOK = false;
    if (  y+offsetY >= simulationCube.layout.length  ) returnValueOK = false;
    if (  z+offsetZ >= simulationCube.layout.length  ) returnValueOK = false;
    //
    return returnValueOK;
    //
  }// method

  void rotate(char command) {
    // rotate 
    // copy destination / target 
    boolean[][][] layout2 = new boolean [3] [3] [3];
    int targetX, targetY, targetZ;

    switch(command) {

      // around z axis (y constant) -------------------------------
    case 'q':
      for (int x=0; x<MAX; x++) { 
        for (int y=0; y<MAX; y++) { 
          for (int z=0; z<MAX; z++) {
            targetX=2-z;
            targetY=y;
            targetZ=x;
            layout2[targetX][targetY][targetZ]=layout[x][y][z]; // true;
          }//for
        }//for
      }//for
      break; 

    case 'a':
      for (int x=0; x<MAX; x++) { 
        for (int y=0; y<MAX; y++) { 
          for (int z=0; z<MAX; z++) {
            targetX=z;
            targetY=y;
            targetZ=2-x;
            layout2[targetX][targetY][targetZ]=layout[x][y][z]; // true;
          }//for
        }//for
      }//for
      break;

      // around x axis (z constant) ---------------------------------
    case 'w':
      for (int x=0; x<MAX; x++) { 
        for (int y=0; y<MAX; y++) { 
          for (int z=0; z<MAX; z++) {
            targetX=y;
            targetY=2-x; // OK
            targetZ=z;
            layout2[targetX][targetY][targetZ]=layout[x][y][z]; // true;
          }//for
        }//for
      }//for
      break; 

    case 's':
      for (int x=0; x<MAX; x++) { 
        for (int y=0; y<MAX; y++) { 
          for (int z=0; z<MAX; z++) {
            targetX=2-y;
            targetY=x;
            targetZ=z;
            layout2[targetX][targetY][targetZ]=layout[x][y][z];
          }//for
        }//for
      }//for
      break;

      // around y axis (x constant) -----------------------------------
    case 'e':
      for (int x=0; x<MAX; x++) { 
        for (int y=0; y<MAX; y++) { 
          for (int z=0; z<MAX; z++) {
            targetX=x;
            targetY=z;
            targetZ=2-y;
            layout2[targetX][targetY][targetZ]=layout[x][y][z];
          }//for
        }//for
      }//for
      break; 

    case 'd':
      for (int x=0; x<MAX; x++) { 
        for (int y=0; y<MAX; y++) { 
          for (int z=0; z<MAX; z++) {
            targetX=x;
            targetY=2-z;
            targetZ=y;
            layout2[targetX][targetY][targetZ]=layout[x][y][z];
          }//for
        }//for
      }//for
      break;

    default:
      println ("Error 170  +++++++++++++++++++++++++++++++++++++++++"); 
      exit(); 
      return; 
      //
    }//switch 

    //copy layout2 to layout
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          layout[x][y][z]  =  layout2[x][y][z];
        }//for
      }//for
    }//for
    //
  }// method

  void resetPiece() {

    // Restore original after rotations

    // read layoutUnchanged
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          // 
          // make a copy (restore original after rotations)   
          layout[x][y][z]=layoutUnchanged[x][y][z];
        }
      }
    }//for
  }//method 

  int countPieces() {
    // for an initial check the number of small cubes within this piece is returned  
    int counter=0;
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {

          if (layout[x][y][z]) {
            counter++;
          }//if
          //
        }//for
      }//for
    }//for
    return counter;
  }// method
  //
}//class
//
