
class ThreeD {

  // much better: shapes 3D library by quarks.

  // This class is not about one item (Car) but more a 
  // collection of different commands / tools for the realm of 3D. 
  // (short version of a much bigger class)
  
  // Helper class. 

  // consts

  final color RED     = color (255, 0, 0);
  final color GREEN   = color (0, 255, 0);
  final color BLUE    = color (0, 0, 255);

  final color WHITE   = color (255);
  final color BLACK   = color (0);
  final color GRAY    = color (111);

  // funcs 

  // reference section "2D Primitives" now in 3D ----------------------
  // read the ref there, they are just changed a bit to be 3D

  void quadArray(PVector[] a1) {
    if (a1==null) 
      return;
    if (a1.length==0) 
      return;
    beginShape();
    for (PVector pv : a1) 
      vertex(pv.x, pv.y, pv.z);      
    endShape(CLOSE);
  }

  void linePV ( PVector pv1, PVector pv2) {
    line (pv1.x, pv1.y, pv1.z, 
      pv2.x, pv2.y, pv2.z);
  } 

  // Floor --------------------------------------------- 

  void CheckeredFloor() {

    noStroke();

    for (int i = 0; i < 40; i = i+1) {
      for (int j = 0; j < 40; j = j+1) {

        // % is modulo, meaning rest of division
        if (i%2 == 0) {
          if (j%2 == 0) {
            fill (255, 0, 0);
          } else
          {
            fill ( 103 );
          }
        } else {
          if (j%2 == 0) {
            fill ( 103 );
          } else
          {
            fill (255, 0, 0);
          }
        } // if

        pushMatrix();

        translate ( 40*i-500, 360, 40*j-640 );
        box (40, 7, 40);

        popMatrix();
      } // for
    } // for
  } // 

  void avoidClipping() {
    // avoid clipping : 
    // https : //
    // forum.processing.org/two/discussion/4128/quick-q-how-close-is-too-close-why-when-do-3d-objects-disappear
    perspective(PI/3.0, (float) width/height, 1, 1000000);
  }//
  //
} // class 
//
