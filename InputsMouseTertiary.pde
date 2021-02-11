

// functions for mouse III.

void checkzoomMode() {

  // right mouse button is for Zoom

  // if mouse is not hold we leave
  if (!zoomMode) 
    return;//leave

  if (!mousePressed)
    return; // leave 

  // Zoom depending on state 
  switch (state) {

  case stateEditSouth:
    camRadiusSouth+=mouseY-pmouseY;
    break;

  case stateEditTop:
    camRadiusTop+=mouseY-pmouseY;
    break;

  case stateEditWest:
    camRadiusWest+=mouseY-pmouseY;
    break;

  default:
    // ignore
    break;
  }//switch
  //
}//func

void checkHoldPanMode() {
  // Pan 

  // if not in pan mode, we leave 
  if (!panMode) 
    return;//leave

  // if not mousePressed, we leave
  if (!mousePressed)
    return;//leave

  // Pan depending on state 
  switch (state) {

  case stateEditSouth:
    camPosSouth.x+=mouseX-pmouseX;
    camPosSouth.y+=mouseY-pmouseY;
    break;

  case stateEditTop:
    //
    camPosTop.x+=mouseX-pmouseX;
    camPosTop.z+=mouseY-pmouseY;
    break;

  case stateEditWest:
    //
    camPosWest.z+=mouseX-pmouseX;
    camPosWest.y+=mouseY-pmouseY;
    break;

  default:
    // ignore
    break;
    //
  }//switch
  //
} //func
//
