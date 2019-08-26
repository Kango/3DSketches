

void checkHoldRight() {
  if (!holdRight) 
    return;//leave

  switch (state) {

  case stateEditSouth:
    camRadiusSouth+=mouseX-pmouseX;
    break;

  case stateEditTop:
    camRadiusTop+=mouseX-pmouseX;
    break;

  case stateEditWest:
    camRadiusWest+=mouseX-pmouseX;
    break;

  default:
    // ignore
    break;
  }//switch
  //
}//func

void checkHoldPanMode() {
  if (!panMode) 
    return;//leave

  switch (state) {

  case stateEditSouth:
    camPosSouth.x+=mouseX-pmouseX;
    camPosSouth.y+=mouseY-pmouseY;
    break;

  case stateEditTop:
    //
    break;

  case stateEditWest:
    //
    break;

  default:
    // ignore
    break;
    //
  }//switch
  //
}//func
