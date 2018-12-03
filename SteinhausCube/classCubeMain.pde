
// the target cube 

class MainCube {

  final int MAX = 3; 

  boolean[][][] layout = new boolean [3] [3] [3];
  color[][][] col = new color [3] [3] [3];

  float size = sizeNormal; 

  PVector posNormal = new PVector();
  PVector pos = new PVector();

  // constr -----
  MainCube ( float xTemp, float yTemp, float zTemp ) {

    for (int x=0; x<3; x++) { 
      for (int y=0; y<3; y++) { 
        for (int z=0; z<3; z++) {
          layout[x][y][z] = false;
          col[x][y][z]    = color(255);
        }//for
      }//for
    }//for

    pos.x=xTemp; 
    pos.y=yTemp; 
    pos.z=zTemp;

    posNormal = pos.copy();
  } // constr ----

  void clear() {
    for (int x=0; x<3; x++) { 
      for (int y=0; y<3; y++) { 
        for (int z=0; z<3; z++) {
          layout[x][y][z]=false;
        }//for
      }//for
    }//for
  }

  void display() {

    setSizeForCube();

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

    for (int x=0; x<3; x++) { 
      for (int y=0; y<3; y++) { 
        for (int z=0; z<3; z++) {
          pushMatrix();

          translate ((float(x)-1.5)*size, 
            (float(y)-1.5)*size, 
            (float(z)-1.5)*size);

          if (layout[x][y][z]) {
            fill(col[x][y][z]);
          } else {
            noFill();
          }
          box(size);
          popMatrix();
        }//for
      }//for
    }//for
    popMatrix();
    //angle1+=.041;
    //angle2+=0.0402;
  }// method

  void displayAsExploded_View_Drawing(boolean flagSmallCubes) {

    setSizeForCube();

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

    // analyze and build hashMap_pvExploded_View_Drawing
    HashMap<Integer, PVector > hashMap_pvExploded_View_Drawing = getHashMapForPiecesPVectors(); 
    PVector pvExploded_View_Drawing=new PVector();

    // display empty cube 
    diplayEmptyCube(); 

    // display 
    for (int x=0; x<3; x++) { 
      for (int y=0; y<3; y++) { 
        for (int z=0; z<3; z++) {

          pushMatrix();

          translate ((float(x)-1.5)*size, 
            (float(y)-1.5)*size, 
            (float(z)-1.5)*size);

          if (flagShowExploded) {
            // use the PVector pvExploded_View_Drawing 
            int c1 = col[x][y][z]; 
            pvExploded_View_Drawing = hashMap_pvExploded_View_Drawing.get(c1);
            translate( pvExploded_View_Drawing.x, 
              pvExploded_View_Drawing.y, 
              pvExploded_View_Drawing.z);
          }

          if (layout[x][y][z]) {
            fill(col[x][y][z]);
          } else {
            noFill();
          }
          if (flagSmallCubes)
            box(size/3);
          else box(size);

          popMatrix();
        }//for
      }//for
    }//for
    popMatrix();
    //angle1+=.041;
    //angle2+=0.0402;
  }// method

  void setSizeForCube() {

    switch (state) { 
    case STATE_NORMAL: 
      size = sizeNormal; 
      pos  = posNormal.copy(); 
      break; 

    case STATE_MAIN_CUBE:
    case STATE_SOLVE: 
    case STATE_LOAD_SOLUTION:
      size = sizeMax; 
      pos  = posMax.copy(); 
      break;
    }
  }

  void diplayEmptyCube() {
    for (int x=0; x<3; x++) { 
      for (int y=0; y<3; y++) { 
        for (int z=0; z<3; z++) {
          pushMatrix();

          translate ((float(x)-1.5)*size, 
            (float(y)-1.5)*size, 
            (float(z)-1.5)*size);

          noFill();
          stroke(0); 
          // stroke(col[x][y][z]);
          box(size);
          popMatrix();
        }
      }
    }
  }

  HashMap<Integer, PVector> getHashMapForPiecesPVectors() {

    // analyze and calculate PVector for Exploded_View_Drawing 

    PVector pvExploded_View_Drawing=new PVector();

    int k=0; 

    HashMap<Integer, PVector > hashMap_pvExploded_View_Drawing = new HashMap<Integer, PVector>();

    // the PVectors for the pieces 
    PVector[]pvExploded_View_DrawingList= { 
      new PVector( -171, -112, 33.2), // turquoise piece
      new PVector( -30, -252, 199.2), // green priece 
      new PVector( 21, 182, -33.2), // red 
      new PVector( 0, 0, 410), // blue
      new PVector( 21, 212, 199), // aquamarine  
      new PVector( 21, -212, -199) }; // pink

    for (int x=0; x<3; x++) { 
      for (int y=0; y<3; y++) { 
        for (int z=0; z<3; z++) {

          int col1 = col[x][y][z]; 

          // do we have the color already?
          if (hashMap_pvExploded_View_Drawing.containsKey(col1)) {
            // yes, old one, do nothing
          } else 
          {
            // No, new color
            if (explodeViewAllowed[k]) {
              // get pv from list 
              pvExploded_View_Drawing = pvExploded_View_DrawingList[k].copy();
              // we put the pvExploded_View_Drawing in 
              hashMap_pvExploded_View_Drawing.put(col1, pvExploded_View_Drawing);
              k++;
            } // if
            else {
              // null PVector
              hashMap_pvExploded_View_Drawing.put(col1, new PVector(0, 0, 0));
              k++;
            }
          } //else
        }
      }
    }//for

    return hashMap_pvExploded_View_Drawing;
  } // method 

  int countPieces() {
    // the number of OCCUPIED small cubes within the cube is returned  
    int counter=0;
    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {
          if (layout[x][y][z]) {
            counter++;
          }//if
        }//for
      }//for
    }//for
    return counter;
  }// method

  // --------------------------------------------

  void save1() {
    String[] a1 = new String [ 27 ];
    int k=0; 

    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {

          a1[k] = str ( col [x][y][z] );
          k++;
        }//for
      }//for
    }//for

    saveStrings ( "Sol"
      +dateTimeStampShort()
      +".txt", a1 );
  }

  void load(String fileNameSolutionLocal) {
    String[] s1 = loadStrings (fileNameSolutionLocal);

    int k=0; 

    clear();

    for (int x=0; x<MAX; x++) { 
      for (int y=0; y<MAX; y++) { 
        for (int z=0; z<MAX; z++) {

          if (s1[k].equals("-1")) {
            // error
            col [x][y][z] = color(0); // black
            println("Error - undefined block in solution");
            layout[x][y][z]=false;
          } else {
            // good value 
            col [x][y][z] =  color ( int (  s1[k] )) ; 
            layout[x][y][z]=true;
            k++;
          }//else
        }//for
      }//for
    }//for
  }
  //
}//class
//
