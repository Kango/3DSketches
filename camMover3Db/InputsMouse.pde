


void mousePressed() {

  if (mouseButton==LEFT) {
    // LEFT

    if (panMode) {
      checkHoldPanMode();
    }

    if (buttonPan.mouseNear() && !panMode) {
      panMode=true;
      return;
    }

    if ( ! bezierCamPos.classMousePressed() ) 
      bezierCamLookAt.classMousePressed();
    //
  } else {
    // RIGHT 
    holdRight = true;
  }
}

void mouseReleased() {
  bezierCamPos.classMouseReleased();
  bezierCamLookAt.classMouseReleased();
  holdRight = false;
  panMode   = false;
}
