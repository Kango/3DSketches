
// Used for ArrayList<PVector> listPoints.

class OnePoint {

  // Used for ArrayList<PVector> listPoints.

  // position 
  PVector pvOfClassOnePoint;

  // 2D screen cordinates of these 3D coordinates pvOfClassOnePoint;
  // used to check mouse 
  float scX=0, scY=0;  

  boolean isSelectedForShape = false; 

  PVector nullVector=new PVector(0, 0, 0);

  // constructor
  OnePoint(PVector pv_) {
    pvOfClassOnePoint = pv_.copy();
  }// constructor

  void showOnePoint(boolean highlight) {
    pushMatrix(); 
    translate(
      pvOfClassOnePoint.x, 
      pvOfClassOnePoint.y, 
      pvOfClassOnePoint.z );

    color sphereCol=GREEN;
    if (highlight)
      sphereCol=RED; 
    sphereAt(new PVector(0, 0, 0), sphereCol);

    // set scX and scY (see variable declaration)
    scX = screenX(0, 0, 0); 
    scY = screenY(0, 0, 0);

    popMatrix();
  } // method 

  void sphereAt ( PVector pv, 
    color colorSphere) {
    pushMatrix();       // store Matrix 
    translate(pv.x, pv.y, pv.z); // position
    noStroke();         // no lines on the sphere  
    fill(colorSphere);  // fill color of the sphere 
    sphere(6);          // size of the sphere 
    // if sphere is marked 
    if (isSelectedForShape) {
      translate(-9, -9, 0); // mark it 
      pointPVector(nullVector);
    }
    popMatrix(); // restore Matrix 
    //
  }//sphereAt

  void pointPVector( PVector pv ) { 

    // small func to show a 3D point as marked 

    stroke(255);

    point  (pv.x, pv.y, pv.z); 

    point  (pv.x, pv.y+1, pv.z); 
    point  (pv.x+1, pv.y, pv.z); 

    point  (pv.x, pv.y+2, pv.z); 
    point  (pv.x+2, pv.y, pv.z);

    point  (pv.x, pv.y, pv.z+1); 
    point  (pv.x+1, pv.y, pv.z+1);

    point  (pv.x, pv.y, pv.z+2); 
    point  (pv.x+2, pv.y, pv.z+2);
  }

  String asString() {
    return 
      pvOfClassOnePoint.x
      +", "+pvOfClassOnePoint.y
      +", "+pvOfClassOnePoint.z;
  }
  //
}// class 
//