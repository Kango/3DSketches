

void help() {

  background(255);

  fill(0);
  camera();

  textMode(SHAPE); 
  textSize(34);
  text("Help", 12, 33); 

  textSize(12);
  text(strHelp, 12, 23);

  textSize(19);
  fill(255, 0, 0); 
  text(" Hit Escape to leave the help screen.", 12, height-22);

  // reset
  textSize(12);
}
//
