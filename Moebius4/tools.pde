

void endSketch() {
  // hamoid video export 
  if (videoExportIsOn) {
    videoExport.endMovie();
    exit();
  }
}

// ---------------------------------------------------------------------------------------

void myBox(float x, float y, float z, // pos
  float w, float h, float d) {        // size 

  // nice wrapper for build in box-command
  //w   float: dimension of the box in the x-dimension
  //h   float: dimension of the box in the y-dimension
  //d   float: dimension of the box in the z-dimension

  pushMatrix();
  translate(x, y, z);
  box(w, h, d);
  popMatrix();
}

void mySphere(float x, float y, float z, 
  float size1) {
  // nice wrapper for build in sphere-command
  pushMatrix();
  translate(x, y, z);
  sphere(size1);
  popMatrix();
}

String videoExportIsOnToString() {
  if (videoExportIsOn) 
    return " with Video Export.";
  else return " no Video Export.";
}
//
