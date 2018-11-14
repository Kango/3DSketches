
// general tools 

void loadSolutionFile() {
  mainCube.clear();
  simulationCube.clear();
  String name1 = alFiles.get(alFiles_i).getName();
  if (name1.length()>4) {
    if (name1.substring(name1.length()-4).equals(".txt")) { 
      mainCube.load(name1);
      alFileName=name1;
    } else {
      alFileName="could not read";
    }
  }
}//func

ArrayList<File> getFiles() {
  String[] strList; 

  ArrayList<File> alResult=new ArrayList(); 

  // https://docs.oracle.com/javase/7/docs/api/java/io/File.html 
  // https://stackoverflow.com/questions/1158777/rename-a-file-using-java

  File f = dataFile( sketchPath("")); 
  strList = f.list();
  println ("found " + strList.length);

  int i = 0;

  for (File fileName : f.listFiles()) {
    alResult.add(fileName);
  } // for 

  return alResult;
}//func 

String ejectStatus() {

  String result=""; 

  for (boolean b : explodeViewAllowed) {
    if (b)
      result+="y ";
    else
      result+="n ";
  }//for

  return result;
}//func

void checkNumberOfPieces() {

  // called only once from setup();
  // can register when a piece was designed wrong. 
  // The concept is: The sum of all small cubes in all 6 pieces must be 27, the same as cubes in the target cube / main cube. 
  // (of course there can be errors in the piece design not detected here, when the number of small cubes is not wrong)

  int counter = 0; 

  // count all cubes in all 6 pieces : 
  for (Piece currentPiece : pieces) {
    counter += currentPiece.countPieces();
  } //for

  // Show result 
  println ("Check pieces (the sum of cubes in all pieces must be equal to the sum of the cubes in the main cube):"); 
  println ("   Main cube holds 3*3*3 = "+ 3*3*3 + " cubes.");
  println ("   All pieces together hold "+counter + " cubes.");

  // check for error 
  if (counter == mainCube.MAX*mainCube.MAX*mainCube.MAX) {
    println ("   Correct.\n");
  } else {
    // error 
    println ("NOT Correct +++++++++++++++++++++++++++++++++");
    exit(); 
    return;
  }
} //func

void showInstructions(String textMy) {
  // text on the right side 

  // box
  fill(166);
  noStroke();
  rect(width-200-10, 44-10, 
    190+10, 430);

  // text 
  textSize(13); 
  camera(); 
  noLights();
  fill(255, 255, 0); // yellow 
  text(textMy, 
    width-200, 44, 
    190, 900);
  //
} //func 

void usedPiecesClear() {
  // clear the array of usedPieces 
  for (int i=0; i<usedPieces.length; i++) {
    usedPieces[i] = false;
  }//for
} // 
//
