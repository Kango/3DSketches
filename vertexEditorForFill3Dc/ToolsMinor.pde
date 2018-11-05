
// Minor Tools

void showModeInHeadline(String textMode, color colorMode) {  
  // show Mode Headline 
  textAlign(CENTER); 
  fill(colorMode); // GREEN or BLACK  
  textFont (pfont2);
  text(textMode, 
    width/2, 19); 
  textAlign(LEFT);
  textFont (pfont1);
}

void showInstructions(String localHelp, int heightRect) {

  // upper right corner / right side texts

  // mouse text : upper right corner
  fill(255); 
  text("Mouse: "
    +mouseX
    +", "
    +mouseY
    +"", 
    width-210, 19);

  // yellow box 
  fill(YELLOW);
  stroke(0); 
  rect( width-217, 39, 
    205, heightRect);
  // and text inside 
  fill(0); 
  text( localHelp, 
    width-210, 39, 
    200, 900);
}

String stringWithoutCommaAtEnd(String textMy) {
  // removes comma at end of the string 
  if (textMy.length()>0) {
    if (textMy.charAt(textMy.length()-1) == '\n' ) {
      textMy = textMy.substring (0, textMy.length()-1); 
      if (textMy.charAt(textMy.length()-1) == ',' )
        textMy = textMy.substring (0, textMy.length()-1);
    }
  }
  return textMy;
}

void closeCurrentShape() {
  //
  listShapes.add(new OneShape());
  currShape++;
  // un-mark all points 
  unMarkAllPoints();
}

void unMarkAllPoints() {
  // un-mark all spheres: referring to the little white sign upon a sphere 
  for (int i=0; i<listPoints.size(); i++) {
    OnePoint onePoint = listPoints.get(i); 
    onePoint.isSelectedForShape=false;  // un-mark sphere
  }
}
//