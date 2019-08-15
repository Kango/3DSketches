

class Cloud {

  PShape cloudShape;
  float x, z;

  // constr
  Cloud (float tempx, float tempz, 
    color fillColor_) {
    x=tempx;
    z=tempz;

    // temp: the parts 
    PShape cloudBody = createShape(SPHERE, 90); 
    cloudBody.setStroke(false); 
    cloudBody.setFill(fillColor_);
    cloudBody.scale(1.0, .4, 1.0);

    PShape cloudHead1 = createShape(SPHERE, 50);
    cloudHead1.setStroke(false); 
    cloudHead1.setFill(fillColor_);
    cloudHead1.translate(-40, -20, 0);

    PShape cloudHead2 = createShape(SPHERE, 40); 
    cloudHead2.setStroke(false); 
    cloudHead2.setFill(fillColor_);
    cloudHead2.translate(30, -28, 0);

    // permanent: the group
    // (consisting of the parts before)
    cloudShape = createShape(GROUP); 
    cloudShape.addChild(cloudBody);
    cloudShape.addChild(cloudHead1);
    cloudShape.addChild(cloudHead2);
    cloudShape.setFill(fillColor_);
  } // constr 

  void display () {
    pushMatrix();
    translate (x, GENERAL_Y_HEIGHT-470, z);
    shape(cloudShape);
    popMatrix();
  } // method
} // class

// =======================================================
