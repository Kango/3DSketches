
class SnakePart {

  // rotating anchor to neighbour 
  // PVector anchor1, anchor2;

  // A helper class for 3D related commands (short version of a much bigger class)
  ThreeD threeD = new ThreeD();

  float xValue = .75;

  // floor points 
  PVector v1 =  new PVector( xValue, -1, 1 );
  PVector v2 =  new PVector( xValue, -1, -1 );
  PVector v3 =  new PVector(-xValue, -1, -1 );
  PVector v4 =  new PVector(-xValue, -1, 1 );

  // roof points 
  PVector r1 =  new PVector(xValue, 0, 0);
  PVector r2 =  new PVector(-xValue, 0, 0);

  // floor array 
  PVector[]  floor = { v1, v2, v3, v4 };  

  //roof sides array
  PVector[]  c2 = { v1, r1, r2, v4 };  
  PVector[]  c3 = { v2, r1, r2, v3 };  

  // sides arrays (walls)
  PVector[]  c4 = { v1, r1, v2 };  
  PVector[]  c5 = { v3, r2, v4 };  

  float pos;
  int angle;  

  // constr 
  SnakePart( float pos_, int angle_ ) {
    // constr 

    pos=pos_;
    angle=angle_;

    float f=27; 
    v1.mult(f);
    v2.mult(f);
    v3.mult(f);
    v4.mult(f);

    r1.mult(f);
    r2.mult(f);

    // make anchors from roof 1 and 2  
    //anchor1=threeD.quadArrayCenter(c2);   
    //anchor2=threeD.quadArrayCenter(c3);
    //
  } // constr 

  void display( boolean isActive ) {

    switch (angle) {
    case 0: 
      // OK - looking UP (right angle)
      translate (0, 3, pos-22.5-1); 
      rotateX(radians(-90));
      break; 

    case 90:
      // OK - side 1 - diagonal  
      translate (-19, -11, pos-11 ); 
      rotateZ(radians(90));
      rotateY(radians(45));
      rotateX(radians(-45));
      break; 

    case 180: 
      // OK - straight snake 
      translate (0, -24, pos); 
      rotateZ(radians(180));
      break; 

    case 270: 
      // side 2 - diagonal  
      translate (19, -11, pos-11 ); 
      rotateZ(radians(-90));
      rotateY(radians(-45));
      rotateX(radians(-45));
      break;

    default:
      println("error 107 ++++++++++++++++++++++++++++++++++++++++");
      exit();
      break;
    }//switch 

    if (isActive)
      stroke(threeD.GREEN);
    else 
    stroke(threeD.RED);

    noFill(); 

    //floor
    threeD.linePV (v1, v2);
    threeD.linePV (v2, v3);
    threeD.linePV (v3, v4);
    threeD.linePV (v4, v1);

    threeD.linePV (v1, r1);
    threeD.linePV (v2, r1);

    threeD.linePV (v3, r2);
    threeD.linePV (v4, r2);

    threeD.linePV (r1, r2);

    // Color 
    if (isActive)
      fill(threeD.GREEN);
    else 
    fill(threeD.RED);

    threeD.quadArray(floor);

    //roof 
    fill(threeD.WHITE);
    threeD.quadArray(c2);
    threeD.quadArray(c3);

    // sides
    fill(threeD.WHITE);
    threeD.quadArray(c4);
    threeD.quadArray(c5);
  } //method
  //
} //class
//
