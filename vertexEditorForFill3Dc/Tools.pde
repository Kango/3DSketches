
// Tools Major 

void onMouseOverManagement() {

  // on mouse over - effect

  // mouse over mode -------------------------------------------------------
  if (currPointFromMouseOver!=UNDEFINED) {
    fill(255);
    text(
      "Use Slider below for Z (click or drag)."
      +"\nUse crs up and down to change Z (0 to reset)."
      +"\nUse crs left and right to change X."
      +"\nUse p and l to change Y."
      +"\nUse DEL to delete the sphere."
      +"\nUse Esc to save and quit the mode."
      +"\n"
      +listPoints.get(currPointFromMouseOver).asString(), 
      12, 300
      //listPoints.get(currPointFromMouseOver).scX+12, 
      //listPoints.get(currPointFromMouseOver).scY+12
      );
  }//if

  // slider 
  if (currPointFromMouseOver==UNDEFINED) 
    return;

  // show slider -----------------------------
  noStroke(); 
  fill(255); 
  rect(0, height-20, 
    width, 20); 
  text("Change Z value here. (click or drag; use crs up and down, 0 to reset)", 
    3, height-25);

  float sliderX=map(listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z, -1000, 1000, 0, width);
  stroke(255, 0, 0); 
  line (sliderX, height-20, 
    sliderX, height);

  if (holdSlider) {
    float valueForZ=map(mouseX, 0, width, -1000, 1000); 
    listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z=valueForZ;
  }
}

void matchesWithMouseOrPreviousSpheresXYZ() {

  // Show match as (blue) line.
  // Either mouse or selected / red sphere.  

  stroke(BLUE);

  // No sphere selected? 
  if (currPointFromMouseOver==UNDEFINED) {

    // this is only relevant in state STATE_DRAW_POINTS 
    if (state != STATE_DRAW_POINTS) 
      return; // leave here

    // check mouse 
    for (int i = 0; i < listPoints.size(); i++) {

      // show match as blue line

      if (abs(mouseX-listPoints.get(i).scX) < 3.0) 
        line (listPoints.get(i).scX, listPoints.get(i).scY, mouseX, mouseY);

      if (abs(mouseY-listPoints.get(i).scY) < 3.0) 
        line (listPoints.get(i).scX, listPoints.get(i).scY, mouseX, mouseY);
    }//for
  }//if 
  else {
    // one sphere is selected / red (currPointFromMouseOver)
    // check this sphere against others (mouse doesn't matter here) 

    textForExplainingColors(); 

    for (int i = 0; i < listPoints.size(); i++) {

      strokeWeight(2);
      // Don't check against itself 
      if (i!=currPointFromMouseOver) {
        if (oneCoordinateMatches(i)) { 
          // show this match as line 
          line (listPoints.get(currPointFromMouseOver).scX, listPoints.get(currPointFromMouseOver).scY, 
            listPoints.get(i).scX, listPoints.get(i).scY);
        }
      }
      strokeWeight(1); // reset to normal
    }//for
  }//else 

  stroke(0);
}//func 

void textForExplainingColors() {
  final int yDiff=23;
  fill(BLACK);
  text("While you move the red spheres it is highlighted when its position matches the position of another sphere", 23, height-220); 
  fill(BLUE); 
  text("A blue line symbolizes match in X-Value", 23, height-220+yDiff);
  fill(TURQUOISE);
  text("A turquoise line symbolizes match in Y-Value", 23, height-220+yDiff+yDiff);
  fill(PINK);
  text("A pink line symbolizes match in Z-Value", 23, height-220+yDiff+yDiff+yDiff);
}

boolean oneCoordinateMatches(int i) {
  if (abs(listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.x - listPoints.get(i).pvOfClassOnePoint.x) < 5.0) {
    stroke(BLUE);
    return true;
  }
  if (abs(listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.y - listPoints.get(i).pvOfClassOnePoint.y) < 5.0) {
    stroke(TURQUOISE);
    return true;
  }
  if (abs(listPoints.get(currPointFromMouseOver).pvOfClassOnePoint.z - listPoints.get(i).pvOfClassOnePoint.z) < 5.0) {
    stroke(PINK);
    return true;
  }
  return false;
}//func

void onMouseShowLines () {

  if (currPointFromMouseOver==UNDEFINED) 
    return;

  switch(state) {
  case STATE_DRAW_POINTS:
    for (int i = 0; i < listPoints.size()-1; i++) {
      stroke(0); 
      line( 
        listPoints.get(i).pvOfClassOnePoint.x, 
        listPoints.get(i).pvOfClassOnePoint.y, 
        listPoints.get(i).pvOfClassOnePoint.z, 

        listPoints.get(i+1).pvOfClassOnePoint.x, 
        listPoints.get(i+1).pvOfClassOnePoint.y, 
        listPoints.get(i+1).pvOfClassOnePoint.z
        );
    }//for
    break; 

  case STATE_DRAW_SHAPES:
    for (int i = 0; i < listShapes.get(currShape).indices.size()-1; i++) {
      stroke(0); 
      line( 
        listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.x, 
        listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.y, 
        listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.z, 

        listPoints.get(listShapes.get(currShape).indices.get(i+1)).pvOfClassOnePoint.x, 
        listPoints.get(listShapes.get(currShape).indices.get(i+1)).pvOfClassOnePoint.y, 
        listPoints.get(listShapes.get(currShape).indices.get(i)).pvOfClassOnePoint.z
        );
    }//for
    break;
  }//switch
}

void showlistPoints1() {
  //
  for (OnePoint onePoint : listPoints) {
    onePoint.showOnePoint(false);
  }
  // show selected point if there is one 
  if (currPointFromMouseOver!=UNDEFINED) {
    listPoints.get(currPointFromMouseOver).showOnePoint(true);
  }
}

void textOutput() {
  // List of shapes : ---------------------------------
  String textResult1=""; 
  for (OneShape os : listShapes) {
    // get edges of os 
    for (int i : os.indices) {
      textResult1 += str(i)+", ";
    }
    textResult1 += "\n";
  }//for

  String a1=""; 
  int yPosText = 360; 
  for (int i : listShapes.get(currShape).indices) {
    a1 += str(i)+", ";
  }
  fill(255); 
  text("Current shape consists of corners # "
    +"\nUse mouse to connect points\n"
    +a1
    +"\nHit enter to close current shape.", 
    width-210, yPosText); 

  fill(255);
  String flagExportedText="";
  if (flagExported) 
    flagExportedText="(exported)\n";
  else flagExportedText="(not exported)\n";

  text("\nList of shapes :\n"
    +textResult1
    +"\n\n"
    +flagExportedText, 
    width-210, yPosText+120);
}
//