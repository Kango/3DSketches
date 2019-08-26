
// the 'callback' functions

void fileSelectedLoad(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected "
      + selection.getAbsolutePath());
    fileToLoad = selection.getAbsolutePath();
  }
}

void fileSelectedSave(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
    fileToSave = selection.getAbsolutePath();
  }
}

// -----------------------------------------------------------------------------------

void loadBeziers() {
  //load
  String[] list = loadStrings (fileToLoad);

  // defining 2 beziers


  String[] listLine0 = split (list[0], ";"); 
  String[][] listLine0b = new String[5][]; 

  int i=0; 
  for (String s : listLine0) {
    listLine0b[i]=split(s, ",");
    i++;
  } 

  PVector[] pvListCamPos = { 
    pvectorFromStringArray(listLine0b[0]), 
    pvectorFromStringArray(listLine0b[1]), 
    pvectorFromStringArray(listLine0b[2]), 
    pvectorFromStringArray(listLine0b[3])  };


  // --------


  String[] listLine1 = split (list[1], ";"); 
  String[][] listLine1b = new String[5][1]; 

  i=0; 
  for (String s : listLine1) {
    listLine1b[i]=split(s, ",");
    i++;
  } 

  PVector[] pvListCamLookAt = { 
    pvectorFromStringArray(listLine1b[0]), 
    pvectorFromStringArray(listLine1b[1]), 
    pvectorFromStringArray(listLine1b[2]), 
    pvectorFromStringArray(listLine1b[3])  };


  bezierCamPos=new MyBezier(pvListCamPos, color(255, 0, 0));   // red 
  bezierCamLookAt=new MyBezier(pvListCamLookAt, color(0, 0, 255) );  // blue 

  state=stateEditSouth;
}

void saveBeziers() {
  //save 
  // String[] list = loadStrings (fileToLoad);
  String[] list = new String[2];
  list[0] = bezierCamPos.toString();
  list[1] = bezierCamLookAt.toString();
  saveStrings( fileToSave, list );
  state=stateEditSouth;
}
