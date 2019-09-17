

void show8LinesPV(PVector pvCenter, // center in 3D 
  float distLineFromCenter, // dist from center to Start Of Line
  float lenLine) {    // length of the line from its start to its end

  /*
  usage:
   PVector centerPV = new PVector(10, 20, 0);
   show8LinesPV(centerPV, 
   24, 33);
   */
  stroke(255, 0, 0); // RED 

  int step = 2; // try 2 or 1 
  for (int x=-1; x<=1; x+=step) 
    for (int y=-1; y<=1; y+=step) 
      for (int z=-1; z<=1; z+=step) {

        // calc start point of line 
        PVector pvFrom = new PVector (
          pvCenter.x+x*distLineFromCenter, 
          pvCenter.y+y*distLineFromCenter, 
          pvCenter.z+z*distLineFromCenter );

        // calc end point of line 
        float outerDist = distLineFromCenter + lenLine;
        PVector pvTo = new PVector (
          pvCenter.x+x*outerDist, 
          pvCenter.y+y*outerDist, 
          pvCenter.z+z*outerDist );

        // draw line 
        linePV(pvFrom, pvTo);
      }//for
}//func

void linePV(PVector pv1, PVector pv2) {
  strokeWeight(3); 
  line (pv1.x, pv1.y, pv1.z, 
    pv2.x, pv2.y, pv2.z);
  strokeWeight(1);
}

void spherePV(PVector pv) {
  pushMatrix();
  translate(pv.x, pv.y, pv.z);
  noStroke();
  fill(0, 0, 255);
  sphere(17);
  popMatrix();
}
//
