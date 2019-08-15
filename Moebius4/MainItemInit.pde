

// defining a QUAD_STRIP shape 

int i2_span=100; 

void initMainItem() {

  // https://de.wikipedia.org/wiki/M%C3%B6biusband

  boolean grid=false; 

  moebius1=createShape(); 
  moebius1.beginShape(QUAD_STRIP);

  if (grid) {
    // only grid 
    moebius1.noFill();
    moebius1.stroke(0);
  } else {
    // full fill
    moebius1.fill(255, 0, 0);
    moebius1.noStroke();
  }

  // i2 -> radius (how wide the red strip is) 
  // i3 / i  -> alpha (angle) 

  for (int i2=-i2_span; i2<i2_span; i2++) {
    for (int i3=0; i3<361; i3++) {

      int i=i3; 
      if (i>360) 
        i=i-360; 

      makeVertex3D(i2, i); 
      makeVertex3D(i2+1, i); 
      //
    }//for
    //
    makeVertex3D(-50, 1);  //Added !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
    //
  }//for

  // ---------------------------------

  /*
   for (int i2=-i2_span; i2<i2_span-1; i2+=1) {
   
   float r = i2/i2_span; 
   float alpha=radians(359); 
   PVector v = new PVector(
   cos(alpha) * ( 1+ ((r/2) * cos ( alpha / 2 )  )  ), 
   sin(alpha) * ( 1+ ((r/2) * cos ( alpha / 2 )  )  ), 
   (r/2) * sin(alpha/2));
   v.mult(factor1);
   v.y+=yadd1;
   //  moebius1.vertex(v.x, v.y, v.z);
   
   r = (i2+1)/i2_span;  
   alpha=radians(0);
   v = new PVector(
   cos(alpha) * ( 1+ ((r/2) * cos ( alpha / 2 )  )  ), 
   sin(alpha) * ( 1+ ((r/2) * cos ( alpha / 2 )  )  ), 
   (r/2) * sin(alpha/2));
   v.mult(factor1);
   v.y+=yadd1;
   //  moebius1.vertex(v.x, v.y, v.z);
   //
   }//for
   
   */

  moebius1.endShape();

  println("");
  println (">>>>"
    +leaves.size());
}//func

void makeVertex3D( int i2, int i) {

  float factor1 = 220; 
  float yadd1   = 200; 

  float r = i2/i2_span; 
  float alpha=radians(i); 
  PVector v = new PVector(
    cos(alpha) * ( 1+ ((r/2) * cos ( alpha / 2 )  )  ), 
    sin(alpha) * ( 1+ ((r/2) * cos ( alpha / 2 )  )  ), 
    (r/2) * sin(alpha/2));
  v.mult(factor1);
  v.y+=yadd1;
  moebius1.vertex(v.x, v.y, v.z);
}
//
