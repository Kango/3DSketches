
// functions for mouse I.

void mousePressed() {

  if (mouseButton==LEFT) {
    // LEFT

    // check buttons 
    if (buttonPan.mouseNear()) {
      panMode = 
        ! panMode;
      return;
    }

    // When in Pan Mode, we don't change the beziers 
    if (panMode) {
      return; // leave
    }

    // check beziers 
    if ( ! bezierCamPos.classMousePressed() ) 
      bezierCamLookAt.classMousePressed();
    //
  } 
  // -------------------------------------
  else {
    // RIGHT mouse button : Zoom 
    panMode   = false;
    holdRight = true;
  }
}//func

void mouseReleased() {
  bezierCamPos.classMouseReleased();
  bezierCamLookAt.classMouseReleased();
  holdRight   = false;
}//func
