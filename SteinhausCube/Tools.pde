
// general tools 

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
