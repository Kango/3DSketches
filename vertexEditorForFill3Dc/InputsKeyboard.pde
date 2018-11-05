
// -----------------------------------------------------------
// Inputs KEYBOARD 

void inputs() {

  // unlike keyPressed, this is read out throughout
  // it's valid for both states

  // it's working only on a selected sphere / corner.
  // When no corner is selected, we leave her: 
  if (currPointFromMouseOver==UNDEFINED)
    return; 

  if (key==CODED) {
    // coded ---
    switch(keyCode) {
      // crs 
    case UP:
      if (currPointFromMouseOver>UNDEFINED) 
        listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z--; 
      break; 
    case DOWN:
      if (currPointFromMouseOver>UNDEFINED) 
        listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z++; 
      break;
      // ---
    case LEFT:
      if (currPointFromMouseOver>UNDEFINED) 
        listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.x--; 
      break; 
    case RIGHT:
      if (currPointFromMouseOver>UNDEFINED) 
        listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.x++; 
      break;

      //
    }//switch 
    //
    return; 
    //
  }// if
  //
  // not coded ---
  switch(key) {
  case 'p':
    if (currPointFromMouseOver>UNDEFINED) 
      listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.y--; 
    break; 
  case 'l':
    if (currPointFromMouseOver>UNDEFINED) 
      listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.y++; 
    break;
  case '0':
    // reset
    if (currPointFromMouseOver>UNDEFINED) 
      listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z=0; 
    break;
    //
  }//switch 
  //
}//func 

void keyReleased() {
  key=0;
}

void keyPressed() {
  switch(state) {

  case STATE_DRAW_SPLASH_SCREEN:
    keyPressedForSTATE_DRAW_SPLASH_SCREEN();
    break; 

  case STATE_DRAW_POINTS : 
    keyPressedForSTATE_DRAW_POINTS(); 
    break; 

  case STATE_DRAW_SHAPES : 
    keyPressedForSTATE_DRAW_SHAPES(); 
    break;

  default: 
    println("Error in keyPressed(): "+state);
    exit(); 
    break; 
    //
  }//switch
}//func 

void keyPressedForSTATE_DRAW_SPLASH_SCREEN() {
  state=STATE_DRAW_POINTS;
  key=0; // kill Esc (or any other key) 
}

void keyPressedForSTATE_DRAW_POINTS () {
  // in state draw points 
  if (key=='c') {
    // delete all 
    listPoints.clear();
  } else if (key==ESC) {
    // Escape 
    currPointFromMouseOver=UNDEFINED;
    holdSlider=false; 
    key=0;
  } else if (key=='Z') {
    exit(); 
    return;
  } else if (key==BACKSPACE) {
    // delete last 
    if (listPoints.size()>0) {
      listPoints.remove(listPoints.size()-1);
    }
  } else if ( key=='e' ) {
    // set state
    state =  STATE_DRAW_SHAPES;
  } else if ( key==DELETE ) {
    // delete red point 
    if (currPointFromMouseOver!=UNDEFINED) {
      listPoints.remove(currPointFromMouseOver);
      currPointFromMouseOver=UNDEFINED;
    }
  } else if ( key=='r' ) {
    // toggle 
    rotateFlag = !rotateFlag;
  }
}//func 

void keyPressedForSTATE_DRAW_SHAPES () {
  // state draw shapes 
  if (key=='c') {
    // delete all indices in current shape
    listShapes.get(currShape).indices.clear();
    // un-mark all points 
    unMarkAllPoints();
  } else if (key==ESC) {
    // Escape 
    currPointFromMouseOver=UNDEFINED;
    holdSlider=false; 
    key=0;
  } else if (key=='Z') {
    exit(); 
    return;
  } else if (key==BACKSPACE) {
    // delete last 
    if (listShapes.get(currShape).indices.size()>0) {
      int indexMy=listShapes.get(currShape).indices.get(listShapes.get(currShape).indices.size()-1); 
      listPoints.get (indexMy).isSelectedForShape=false ;
      listShapes.get(currShape).indices.remove(listShapes.get(currShape).indices.size()-1);
    }
  } else if ( key==' ' ) {
    // toggle 
    showFill = !showFill;
  } else if ( key==DELETE ) {
    // 
    if (currPointFromMouseOver!=UNDEFINED) {
      listPoints.remove(currPointFromMouseOver);
      currPointFromMouseOver=UNDEFINED;
    }
  } else if ( key=='e' ) {
    state = STATE_DRAW_POINTS; // set state
  } else if (key==RETURN||key==ENTER) {
    closeCurrentShape();
  } else if ( key=='x' ) {
    // export 
    closeCurrentShape();
    export();
  } else if ( key=='r' ) {
    // toggle 
    rotateFlag = !rotateFlag;
  }
}//func 
//