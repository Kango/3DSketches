
// -----------------------------------------------------------
// Inputs MOUSE

void mouseReleased() {
  holdSlider=false;
}

void mousePressed() {

  if (state==STATE_DRAW_SPLASH_SCREEN) { 
    state=STATE_DRAW_POINTS;
    return;//leave
  }

  if (mouseButton==RIGHT) {
    // select 
    for (int i = 0; i < listPoints.size(); i++) {
      if (dist(mouseX, mouseY, listPoints.get(i).scX, listPoints.get(i).scY) < 20) {
        //
        currPointFromMouseOver=i; 
        return; // we leave here
      }
    }
    return;   // we leave here (so after here, there is only left mouse button to be handled)
  }//if 

  //-----

  // left mouse button 
  if (currPointFromMouseOver!=UNDEFINED) {
    if (mouseY>height-20) {
      //slider
      holdSlider=true; 
      float valueForZ=map(mouseX, 0, width, -1000, 1000); 
      listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z=valueForZ;
    }//if
    return; // leave here
  }//if

  switch(state) {

  case STATE_DRAW_SPLASH_SCREEN :
    // should not be executed (state is handled above)
    state=STATE_DRAW_POINTS;
    break; 

  case STATE_DRAW_POINTS :
    // add a point 
    PVector pv1 = new PVector(mouseX-width/2, mouseY, 0); 
    listPoints.add(new OnePoint(pv1)); 
    flagExported = false; // changed
    break; 

  case STATE_DRAW_SHAPES : 
    // add a corner to the current shape 
    for (int i=0; i<listPoints.size(); i++) {
      OnePoint onePoint = listPoints.get(i); 

      // clicked on a sphere 
      if (dist(mouseX, mouseY, onePoint.scX, onePoint.scY) < 20) {
        listShapes.get(currShape).indices.add ( i ); // add corner to the current shape 
        onePoint.isSelectedForShape=true;  // mark sphere as selected 
        flagExported = false;  // changed
        return;
      }
    }//for
    break;

  default: 
    println("Error in mousePressed(): "+state);
    exit(); 
    break; 
    //
  } //switch
  //
} //func
//