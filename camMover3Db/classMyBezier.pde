
// represents one bezier  

class MyBezier {

  PVector[] pvList;
  PVector[] screenPos=new PVector[4];

  color col1; 

  boolean hold=false; 
  int indexHold=-1; 

  int stepsshowInMovement = 400;
  int i_in_draw=0; 

  //constr
  MyBezier(PVector[] pvList_, color col_) {
    pvList=pvList_;
    col1=col_;
    for (int i=0; i<4; i++)
      screenPos[i]=new PVector();
  }
  //constr

  // -----------------------------------------------------

  void showBezier() {

    // show main points 
    fill(col1);
    int i2=0; 
    for (PVector pv : pvList) {      
      if (i2==0||i2==3) 
        myBox(pv.x, pv.y, pv.z, 17);
      else 
      mySphere(pv.x, pv.y, pv.z, 17);
      screenPos[i2].x = screenX(pv.x, pv.y, pv.z); 
      screenPos[i2].y = screenY(pv.x, pv.y, pv.z);
      i2++;
    }

    noFill();
    // anchor point, control, control, anchor point 
    bezier(
      pvList[0].x, pvList[0].y, 
      pvList[1].x, pvList[1].y, 
      pvList[2].x, pvList[2].y, 
      pvList[3].x, pvList[3].y);

    // show many points 
    fill(255);
    int steps = 40;
    for (int i = 0; i <= steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(pvList[0].x, pvList[1].x, pvList[2].x, pvList[3].x, t);
      float y = bezierPoint(pvList[0].y, pvList[1].y, pvList[2].y, pvList[3].y, t);
      float z = bezierPoint(pvList[0].z, pvList[1].z, pvList[2].z, pvList[3].z, t);
      mySphere(x, y, z, 5);
    }//for

    // if drag and drop
    if (hold) {
      // show as selected 
      show8LinesPV(pvList[indexHold], 24, 33);
    }
  }//func 

  void showInMovement() {
    fill(col1);
    float t = i_in_draw / float(stepsshowInMovement);
    float x = bezierPoint(pvList[0].x, pvList[1].x, pvList[2].x, pvList[3].x, t);
    float y = bezierPoint(pvList[0].y, pvList[1].y, pvList[2].y, pvList[3].y, t);
    float z = bezierPoint(pvList[0].z, pvList[1].z, pvList[2].z, pvList[3].z, t);
    mySphere(x, y, z, 5);

    i_in_draw++;
    if ( i_in_draw > stepsshowInMovement ) {
      i_in_draw=0;
    }//if
  }//func

  PVector showAsMovie() {
    // fill(col1);
    float t = i_in_draw / float(stepsshowInMovement);
    float x = bezierPoint(pvList[0].x, pvList[1].x, pvList[2].x, pvList[3].x, t);
    float y = bezierPoint(pvList[0].y, pvList[1].y, pvList[2].y, pvList[3].y, t);
    float z = bezierPoint(pvList[0].z, pvList[1].z, pvList[2].z, pvList[3].z, t);
    //   mySphere(x, y, z, 5);

    i_in_draw++;
    if ( i_in_draw > stepsshowInMovement ) {
      i_in_draw=0;
    }//if

    return new PVector(x, y, z);
  }//func

  // --------------------
  // Inputs 

  boolean classMousePressed() {

    // search a point to drag and drop

    int i=0; 
    for (PVector pv : pvList) {
      if (dist(screenPos[i].x, screenPos[i].y, mouseX, mouseY)<22) {
        hold=true;
        indexHold=i; 
        return true;
      }//if
      i++;
    }//for
    return false;
  }

  void classMouseReleased() {
    hold=false;
    indexHold=-1;
  }

  // -----

  void holdAction() {

    // when holding the mouse (drag and drop) position gets changed  

    if (hold) {
      //pvList[indexHold].x=mouseX;
      //pvList[indexHold].y=mouseY;

      // change pos depending on view
      switch(state) {
      case stateEditSouth: 
        pvList[indexHold].x+=mouseX-pmouseX;
        pvList[indexHold].y+=mouseY-pmouseY;
        break;

      case stateEditTop: 
        pvList[indexHold].x+=mouseX-pmouseX;
        pvList[indexHold].z+=mouseY-pmouseY;
        break;

      case stateEditWest: 
        pvList[indexHold].z+=mouseX-pmouseX;
        pvList[indexHold].y+=mouseY-pmouseY;
        break;

      default:
        //ignore 
        break;
      }//switch
    }//if
  }//func

  // for save 
  String toString() {
    String result=""; 
    for (PVector pv : pvList) {      
      // 
      result+=pv.x+","+
        pv.y+","+
        pv.z+";";
    }
    return result;
  }
  //
}//class 
// 
