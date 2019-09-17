

// the 'callback' functions

void fileSelectedLoad(File selection) {
  if (selection == null) {
    //println("Window was closed or the user hit cancel.");
    state=stateEditSouth;
  } else {
    // println("User selected " + selection.getAbsolutePath());
    fileToLoad = selection.getAbsolutePath();
  }
}

void fileSelectedSave(File selection) {
  if (selection == null) {
    //println("Window was closed or the user hit cancel.");
    state=stateEditSouth;
  } else {
    //println("User selected " + selection.getAbsolutePath());
    fileToSave = selection.getAbsolutePath();

    // add file ending when too short (avoiding an error with substring (below) when fileToSave might be too short)
    if (fileToSave.length()<4)
      fileToSave+=".txt"; // add .txt

    // add file ending when missing   
    String ending = fileToSave.substring( fileToSave.length()-4, fileToSave.length() ); 
    if ( ending != ".txt" ) {
      // add .txt 
      fileToSave+=".txt";
    }
  }
}

// -----------------------------------------------------------------------------------
// when file name is established, we load and save: 

void loadBeziers() {
  //load
  //
  /*
  file looks like this
   -815.0,80.0,5.0;10.0,10.0,-120.0;76.0,90.0,-87.0;240.0,20.0,-98.0;
   115.0,180.0,110.0;110.0,110.0,120.0;190.0,190.0,0.0;185.0,120.0,0.0;
   */
  String[] list = loadStrings (fileToLoad);

  if (list==null) 
    return;

  // defining 2 beziers from file
  bezierCamPos=new MyBezier(getPVectorArrayFromString(list[0]), color(255, 0, 0), true);   // red 
  bezierCamLookAt=new MyBezier(getPVectorArrayFromString(list[1]), color(0, 0, 255), false );  // blue 

  state=stateEditSouth;
}

PVector[] getPVectorArrayFromString(String stringList) {
  // expects -815.0,80.0,5.0;10.0,10.0,-120.0;76.0,90.0,-87.0;240.0,20.0,-98.0; as parameter (4 3D points separated by ; and each point x,y,z separated by , ).
  // We split at ; and then 4 times at , 

  String[] listLine0 = split (stringList, ";"); // result is 4 PVectors (each with x,y,z) 
  String[][] listLine0b = new String[5][];  // result is a grid with 4 lines each with 3 columns for x,y,z

  int i=0; 
  for (String s : listLine0) {
    listLine0b[i]=split(s, ","); // grid: one line in the grid is filled with x,y,z
    i++;
  } 

  PVector[] pvList = { 
    pvectorFromStringArray(listLine0b[0]), 
    pvectorFromStringArray(listLine0b[1]), 
    pvectorFromStringArray(listLine0b[2]), 
    pvectorFromStringArray(listLine0b[3])  };

  return pvList;
}//func

void saveBeziers() {
  //save 
  //
  String[] list = new String[2];
  list[0] = bezierCamPos.toString();
  list[1] = bezierCamLookAt.toString();
  saveStrings( fileToSave, list );
  state=stateEditSouth;
}
//
