

// -------------------------------------------------------------------------------
// called from draw() 

void drawForSTATE_DRAW_SPLASH_SCREEN() {

  //show splash screen

  background(111);

  // Headline
  showModeInHeadline("Welcome to Shape Editor (hit any key to go to draw mode)", WHITE);

  text(TEXT_SPLASH
    +"\n\nThis help text is now also in your direct window and can be copied from there.\n"
    +"\nHit any key to go on.", 23, 80, 
    width-46, 900);
}

void drawForSTATE_DRAW_POINTS() {

  // enter points 

  background(111);
  lights(); 

  pushMatrix();  
  translate(width/2, 0);
  if (rotateFlag) {
    rotateY(angle1);
    angle1+=.021;
  }//if

  // the list that has been entered
  showlistPoints1();
  onMouseShowLines();
  popMatrix();

  // on mouse over - effect
  onMouseOverManagement();

  matchesWithMouseOrPreviousSpheresXYZ();

  // show Instructions
  showInstructions(HELP1, 154);

  // get continous inputs 
  inputs();

  // Mode Headline
  showModeInHeadline("Mode draw points (hit e to go to edges mode)", WHITE);
} //func 

void drawForSTATE_DRAW_SHAPES() {
  // connect points to shapes 

  background(111);
  lights();

  pushMatrix();  
  translate(width/2, 0);
  if (rotateFlag) {
    angle1+=.021;
  }//if
  rotateY(angle1);

  // all Shapes
  for (OneShape os : listShapes) {
    os.showOneShape(false);
  }
  listShapes.get(currShape).showOneShape(true); // show highlighted shape separate

  // lines for curr shapes -------------------------------------- 

  for (int i = 0; i < listShapes.get(currShape).indices.size()-1; i++) {
    stroke(0); 
    line( 
      listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.x, 
      listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.y, 
      listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.z, 

      listPoints.get(listShapes.get(currShape).indices.get(i+1)).pvOfClassOnePoint.x, 
      listPoints.get(listShapes.get(currShape).indices.get(i+1)).pvOfClassOnePoint.y, 
      listPoints.get(listShapes.get(currShape).indices.get(i+1)).pvOfClassOnePoint.z
      );
  }//for 

  // show the list that has been entered as points  
  showlistPoints1();
  popMatrix(); 

  // show Instructions
  showInstructions(HELP2, 212);

  // get continous inputs 
  inputs();

  // on mouse over - effect
  onMouseOverManagement(); 

  matchesWithMouseOrPreviousSpheresXYZ();

  // text  -------------------------------
  textOutput(); 

  showModeInHeadline("Mode draw edges (hit e to go back to points mode)", GREEN); 
  //
} //func 
//