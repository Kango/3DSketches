

void help() {

  background(255);
  fill(0);
  camera();
  text("Help\n\n"
    +" This program defines a camera animation for your 3D sketch. It uses 2  Bezier curves to do so: \n"
    +"     * The red curve is the path of the camera position during the animation, \n"
    +"     * the blue curve is the camera look At during the animation.\n\n"
    +" These curves are defined by a series of anchor and control points.\n"
    +" Each curve is defined by 4 points: \n"
    +"     * The 2 boxes of each curve specify the anchor points.\n" 
    +"     * The 2 spheres of each curve specify the control points which define the shape of the curve. \n Bezier curves were developed by French engineer Pierre Bezier.\n\n" 
    +" You can drag and drop the anchor and control points with the mouse (in 3 different views: from South, from Top, from West).\n"
    +" This sketch uses the 2 curves for animation of the camera: the curve for the camera position is red, the curve for the camera Look At is blue. \n"
    +" Anchor points = boxes, control points = spheres.\n\n"
    +"Keys:\n"
    +"     * h - this help screen\n"
    +"     * 0,9 - screens with camera animation (with and without the Look At Curve)\n"
    +"     * 1,2,3 - edit modes from different sides : from South, from Top and from West (drag and drop applies to different values of the spheres (x,y,z)). \n"
    +"     * s and l - save and load \n\n"
    +" Use right click mouse to change zoom (in Edit modes).\n\n Hit Escape to leave the help screen.", 12, 22);
}

PVector pvectorFromStringArray( String[] s ) {
  return new PVector ( float(s[0]), float(s[1]), float(s[2])  );
}

void showBeziersForEdit() {

  bezierCamPos.showBezier(); //
  bezierCamLookAt.showBezier(); //

  bezierCamPos.showInMovement(); //
  bezierCamLookAt.showInMovement(); //

  bezierCamPos.holdAction(); // 
  bezierCamLookAt.holdAction(); //
}

void showGeneralItemsForEditModes() {
  //
}

void mySphere(float x, float y, float z, 
  float size1) {
  // one nice wrapper for build in sphere-command
  pushMatrix();
  translate(x, y, z);
  noStroke(); 
  sphere(size1);
  popMatrix();
}

void myBox (float x, float y, float z, 
  float size1) {
  // one nice wrapper for build in box-command
  pushMatrix();
  translate(x, y, z);
  box(size1);
  popMatrix();
}
