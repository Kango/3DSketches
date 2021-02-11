
// save and load 

// 1. the 'callback' functions

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
// 2. when file name is established, we load and save: 

void loadItems() {
  //load
  //
  String[] list = loadStrings (fileToLoad);

  if (list==null) 
    return;

  listMyItem.clear();

  // load list
  for ( String s : list) {
    //
    listMyItem.add(new MyItem(getPVectorFromString(s), color(0, 0, 255)));   //  blue
  }

  state=stateEditSouth;
}

PVector getPVectorFromString(String s_) {
  String[] partsInThisLine = split(s_, ",");
  return new PVector(float (partsInThisLine[0]), 
    float (partsInThisLine[1]), 
    float (partsInThisLine[2]));
}

void saveItems() {
  //save 
  //
  String[] list = new String[0];

  // list[0] = bezierCamPos.toString();
  //list[1] = bezierCamLookAt.toString();

  int i=0; 
  for (MyItem myI : listMyItem) {
    list = (String[]) append(list, myI.toString());
    i++;
  }//for 

  saveStrings( fileToSave, list );
  state=stateEditSouth;
}
//
