

void showFurtherScreenElements() {

  // other stuff in draw

  if (state==stateHelp||state==STATE_SPLASHSCREEN) {
    return; // leave here
  }

  // the scene - this primitive scene is just for demo purposes 
  scene();

  // Zoom 
  checkzoomMode(); 

  // Pan
  checkHoldPanMode();

  // ***********************************************************

  // HUD 
  // two different types of HUD, either with internal cam or with peasycam
  if (! peasyCamera.isActive()) {
    camera();
  } else {
    peasyCamera.beginHUD();
  }//else 

  fill(0);
  text(stateText[state]+"\n"
    +"3D Cursor is yellow. "
    +"\nh for Help Screen.", 
    22, 22);

  // buttons 
  for (Button currentButton : buttons) {
    currentButton.displayButton();
  }
  //buttonPan.displayButton(panMode);
  //buttonPeasyCam.displayButton(peasyCamera.isActive()); // debug ??? 

  // text for Zoom / hold right
  if (zoomMode) {
    bigMessage("Zoom:\nLeft mouse button, move mouse up and down");
  }//if
  // text for pan
  else if (panMode) {
    bigMessage("PAN\nLeft mouse button, move mouse");
  }//if
  else if ( flagBigMessageBrief  ) {
    bigMessageBrief(stringBigMessageBrief);
  }

  // Show data for dragged item or for cursor3D
  // when we drag 
  if (indexHold>-1) {
    // show data
    // switch off the flag showCursor3DData (this is true when we moved the cursor3D by clicking anywhere in the canvas) 
    showCursor3DData=false; 
    if (indexHold==10000)
      cursor3D.showData(); //
    else 
    listMyItem.get(indexHold).showData(); //
  } else {
    if (showCursor3DData) {
      cursor3D.showDataWithoutCondition();
    }
  }//else 

  //bezierCamLookAt.showData(); //
  if (peasyCamera.isActive()) {
    peasyCamera.endHUD();
  }//if
  //
}

PVector pvectorFromStringArray( String[] s ) {
  return 
    new PVector ( float(s[0]), 
    float(s[1]), 
    float(s[2]) );
}

void bigMessage(String msg) {
  // hint(DISABLE_OPTIMIZED_STROKE);
  hint(DISABLE_DEPTH_TEST);
  pushStyle();
  textAlign(CENTER, CENTER);
  textSize(52);
  textMode(SHAPE);
  fill(0, 255, 0);
  text(msg, width/2, height/2);
  textAlign(LEFT);
  popStyle();
  hint(ENABLE_DEPTH_TEST);
}

void startBigMessageBrief( String msg ) {
  // starts a brief message
  flagBigMessageBrief=true;
  intBigMessageBriefTimer=millis();
  stringBigMessageBrief=msg; //stateText[state]
}

void bigMessageBrief(String msg) {
  // for display
  if (! flagBigMessageBrief)
    return; 

  hint(DISABLE_DEPTH_TEST);
  pushStyle();
  textAlign(CENTER, CENTER);
  textSize(52);
  textMode(SHAPE);
  fill(0, 255, 0);
  text(msg, width/2, height/2);
  textAlign(LEFT);
  popStyle();
  hint(ENABLE_DEPTH_TEST);

  // timer 
  if (millis() - intBigMessageBriefTimer > 2100) {
    flagBigMessageBrief=false; // off
  }
}

void showItemsForEdit() {

  for (MyItem myI : listMyItem)  
    myI.showItem(); //

  cursor3D.showItem(); //

  for (MyItem myI : listMyItem)  
    myI.holdAction(); //

  cursor3D.holdAction(); //
}

void showGeneralItemsForEditModes() {
  //
}

void mySphere(float x, float y, float z, 
  float size1) {
  // one nice wrapper for build in sphere-command
  pushMatrix();
  translate(x, y, z);
  noStroke(); 
  sphere(size1);
  popMatrix();
}

void myBox (float x, float y, float z, 
  float size1) {
  // one nice wrapper for build in box-command 
  pushMatrix();
  translate(x, y, z);
  box(size1);
  popMatrix();
}
//
