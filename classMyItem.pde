

//   

class MyItem {

  PVector pvPos;
  PVector screenPos=new PVector();

  String myItemName = "box";

  color col1; 

  boolean hold=false; 

  //  int stepsShowInMovement = 400; // try 400 or 1400
  // int i_in_draw=0; 
  // boolean isCamPos=false; 

  int id=listMyItem.size(); 

  // -----------------------------------------------------

  //constr
  MyItem(PVector pvPos_, color col_) {
    pvPos=pvPos_;
    col1=col_;
    //   isCamPos=isCamPos_;
  }
  //constr

  // -----------------------------------------------------

  void showItem() {
    // show 

    fill(col1);
    stroke(100); 

    // if cursor3D
    if (id==10000) {
      noFill(); 
      stroke(255, 255, 0);
    }

    myBox(pvPos.x, pvPos.y, pvPos.z, 17);

    screenPos.x = screenX(pvPos.x, pvPos.y, pvPos.z); 
    screenPos.y = screenY(pvPos.x, pvPos.y, pvPos.z);

    fill(col1);
    noStroke(); 

    // if drag and drop
    if (hold) {
      // show as selected (show 8 lines)
      show8LinesPV(pvPos, 24, 33);
    }
  }//func 

  void showData() {
    // if drag and drop
    if (hold) {
      // show data
      showDataWithoutCondition();
    }
  }//func 

  void showDataWithoutCondition() {
    //
    // show data
    int xpos=92;
    int yAdd=44; 
    // yellow box
    fill(#EEFF0D); 
    stroke(0);
    rect( width-xpos, height/2-12+yAdd, 
      xpos-3, 79);

    // black text 
    fill(0);
    text(myItemName
      +"\n"
      +pvToString(pvPos), 
      width-(xpos-3), height/2+yAdd);
  }//func 

  // --------------------
  // Inputs 

  boolean classMousePressed() {

    // check whether it's near to drag and drop
    if (dist(screenPos.x, screenPos.y, mouseX, mouseY)<22) {
      hold=true;
      indexHold=id; 
      if (myItemName.equals("Cursor")) 
        indexHold=10000; 
      return true;
    }//if
    return false;
  }//method

  void classMouseReleased() {
    hold=false;
    indexHold=-1;
  }

  // ----------------------------

  void holdAction() {

    // when holding the mouse (drag and drop) position gets changed  

    if (hold) {
      //pv.x=mouseX;
      //pv.y=mouseY;

      // change pos depending on view
      switch(state) {
      case stateEditSouth: 
        pvPos.x+=mouseX-pmouseX;
        pvPos.y+=mouseY-pmouseY;
        break;

      case stateEditTop: 
        pvPos.x+=mouseX-pmouseX;
        pvPos.z+=mouseY-pmouseY;
        break;

      case stateEditWest: 
        pvPos.z+=mouseX-pmouseX;
        pvPos.y+=mouseY-pmouseY;
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
    result+=pvPos.x+","+
      pvPos.y+","+
      pvPos.z+"";
    return result;
  }

  // for yellow box 
  String pvToString(PVector pv) {
    return
      "x "+pv.x+"\n"+
      "y "+pv.y+"\n"+
      "z "+pv.z+"\n";
  }

  void update() {
    //screenPos.x = screenX(pvPos.x, pvPos.y, pvPos.z); 
    //screenPos.y = screenY(pvPos.x, pvPos.y, pvPos.z);
    screenPos.set ( screenX(pvPos.x, pvPos.y, pvPos.z), 
      screenY(pvPos.x, pvPos.y, pvPos.z));
  }//func

  boolean keyInput() {
    // keyPressed for registering a key (throughout)  

    float translateStep = 4.0; // speed 

    if (key==CODED) {

      switch(keyCode) {
      case UP: 
        listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
        pvPos.y-=17;
        break;

      case DOWN: 
        listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
        pvPos.y+=17;
        break;

      case LEFT: 
        listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
        pvPos.x-=17;
        break;

      case RIGHT: 
        listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
        pvPos.x+=17;
        break;

      default: 
        // when no key has been found, return false 
        return false;
        //
      }//switch

      return true;
    }//if

    //-----------

    else {

      switch(key) {

      case 'w':
        pvPos.y-=translateStep;
        break; 

      case 'a':
        pvPos.x-=translateStep;
        break; 

      case 's':
        pvPos.y+=translateStep;
        break;

      case 'd':
        pvPos.x+=translateStep;
        break;

        // --

        // depth / z 
      case 'p':
        pvPos.z-=translateStep;
        break; 

      case 'l':
        pvPos.z+=translateStep;
        break;

      case 'o': 
        listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
        pvPos.z-=17;
        break;

      case 'k': 
        listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
        pvPos.z+=17;
        break;

      default:
        // when no key has been found, return false 
        return false; 
        //break; 
        //
      }//switch
      //
      // since we are still in the function, a key has been found, so return true
      return true;  
      //
    }
    //
  }//method
  //
  //
}//class 
// 
