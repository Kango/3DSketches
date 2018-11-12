

class Item3D {

  float x=0, y=0, z=0;

  float offsetX=0; 
  float offsetZ2=0; 

  // this is a very important size: size items
  float sizeBox = 70.0;

  // float rotateY=0;

  color colBox = color(255, 0, 0);

  // folded triangle 
  PShape s; 

  // type
  final int typeUndefined      = -1;
  final int typeBox            = 0;
  final int typeShapeTriangle  = 1; 
  final int typeSphere         = 2; 
  // more needed? 

  int type = typeUndefined; 

  // constr ---
  Item3D(float x_, 
    float y_, 
    float z_, 
    float rotateY_, 
    int type_, 
    color col1_) {

    x=x_;
    y=y_;
    z=z_;

    //   rotateY= rotateY_;
    type=type_;

    colBox=col1_;

    makeShape();
  } // constr ---

  void makeShape() {
    s = createShape();
    s.beginShape();
    s.fill(255, 0, 0);
    s.stroke(177);
    s.vertex(100, 0, -100);
    s.vertex(-60, 0, 200);
    s.vertex(-50, 60, -30);
    s.vertex(110, 160, 40);
    s.scale(0.4);
    s.endShape(CLOSE);
  }

  void display(boolean showAsSelected) {

    pushMatrix();

    translate(x, y, z);
    //  rotateY(radians(rotateY)); 

    fill(colBox);
    noStroke(); 

    // depending on the current type 
    switch (type) {

    case typeUndefined:
      // undefined 
      break; 

    case typeBox: 
      if (showAsSelected)
        stroke(255);
      else stroke(111);
      box(sizeBox);
      break; 

    case typeShapeTriangle:
      if (showAsSelected)
        s.setStroke(color(255));
      else s.setStroke(color(111));
      s.setFill(colBox);
      shape(s, 0, 0);
      break;

    case typeSphere: 
      if (showAsSelected)
        stroke(255);
      else 
      noStroke();
      sphereDetail(32);
      sphere(sizeBox/2);
      break;

    default:
      // error 
      break;
      //
    } //switch 

    if (!showAsSelected) {
      // we use the flag we also use for the help text... 
      if (showHelpText) {
        if (type==typeSphere)
          translate(sizeBox/2+0, -sizeBox/2+0, sizeBox/2+0);
        else
          translate(sizeBox/2, -sizeBox/2, sizeBox/2);

        fill(111);
        stroke(0);
        box(sizeBox/6);
      }//if
    }//if

    popMatrix();
  } // method 

  String toString() {
    // " x y z Type R G B "
    return 
      str(x) +", "+ 
      str(y) +", "+ 
      str(z) +", "+ 
      // str(rotateY) +","+ 
      str(type) +", "+ 
      str(red(colBox)) +", "+ 
      str(green(colBox)) +", "+ 
      str(blue(colBox)) ;
  }

  String toStringXYZ() {
    return 
      str(x) +","+ 
      str(y) +","+ 
      str(z) +",";
  }
  //
} // class 
//
