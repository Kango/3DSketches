

void defineTwoBeziers() {

  // defining 2 beziers (just in case loading fails)

  PVector[] pvListCamPos = { 
    new PVector(15, 80, -110), 
    new PVector(10, 10, -120), 
    new PVector(90, 90, 0), 
    new PVector(85, 20, 0)   }; 

  PVector[] pvListCamLookAt = { 
    new PVector(115, 180, 110), 
    new PVector(110, 110, 120), 
    new PVector(190, 190, 0), 
    new PVector(185, 120, 0)   }; 

  bezierCamPos=new MyBezier(pvListCamPos, color(255, 0, 0), true);   // red 
  bezierCamLookAt=new MyBezier(pvListCamLookAt, color(0, 0, 255), false );  // blue
  //
}

void showFurtherScreenElements() {

  // other stuff in draw

  if (state==stateHelp) {
    return; // leave here
  }

  // the scene - this primitive scene is just for demo purposes 
  scene();

  // Zoom 
  checkHoldRight(); 

  // Pan
  checkHoldPanMode();

  // hamoid VideoExport
  if (videoExportIsOn) {
    if (state==stateShowMovieWithBeziers||
      state==stateShowMovie||
      state==stateShowMovieLookingAhead) {
      videoExport.saveFrame();
    }
  }

  // ***********************************************************

  // HUD 
  camera();
  fill(0);
  text(stateText[state]+"\n"
    +"Curve for the Camera Positions is red, curve for the Camera LookAt is blue. "
    +"Anchor points = boxes, control points = sphere. \nh for Help Screen.", 
    22, 22);

  // Button 
  buttonPan.display(panMode);

  // text for Zoom / hold right
  if (holdRight) {
    bigMessage("Zoom:\nMove mouse up and down");
  }//if

  // text for pan
  if (panMode) {
    bigMessage("PAN");
  }//if

  bezierCamPos.showData(); //
  bezierCamLookAt.showData(); //
  //
}

PVector pvectorFromStringArray( String[] s ) {
  return 
    new PVector ( float(s[0]), 
    float(s[1]), 
    float(s[2]) );
}

void bigMessage(String msg) {
  pushStyle();
  textAlign(CENTER, CENTER);
  textSize(52);
  textMode(SHAPE);
  fill(0, 255, 0);
  text(msg, width/2, height/2);
  textAlign(LEFT);
  popStyle();
}

void showBeziersForEdit() {

  bezierCamPos.showBezier(); //
  bezierCamLookAt.showBezier(); //

  bezierCamPos.showInMovement(); //
  bezierCamLookAt.showInMovement(); //

  bezierCamPos.holdAction(); // 
  bezierCamLookAt.holdAction(); //
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
