

// functions for mouse I.

void mousePressed() {

  switch(state) {
    //
  case STATE_SPLASHSCREEN :
    state=stateHelp; 
    break; 

  case stateHelp:
    state=stateEditSouth;
    key=0;
    break; 

  case stateWaitForLoad:
  case stateWaitForSave:
    break; 

  default: 
    // these are the states for View south west top 
    if (mouseButton==LEFT) {
      // LEFT
      mousePressedLeftButton(); 
      //
    }//if 
    break;
  } //switch
}//func

void mouseReleased() {
  for (MyItem myI : listMyItem) {
    myI.classMouseReleased();
  }
  cursor3D.classMouseReleased();
  // zoomMode = false;
}//func
//
