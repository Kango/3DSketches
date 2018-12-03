
// Inits

void initPieces() {

  // init pieces.

  // The main screen shows 6 pieces in 3 columns (from left to right : 1 column: one piece, 2nd column: two pieces, 3rd column: 3 pieces).
  // Filling ArrayList pieces here. 
  // See tab ToolsLayout to see the individual layouts of the pieces.
  // Each piece has its own unique color. 

  Piece temp1; 

  // -----------------------------------------------
  // left column 
  temp1 = new Piece (layout3, color(0, 0, 255), 
    255, 800, 0 );
  pieces.add(temp1);

  // -----------------------------------------------
  // 2nd column 
  temp1 = new Piece (layout4, color(0, 255, 0), 
    650, 500, 0 );
  pieces.add(temp1);

  temp1 = new Piece (layout5, color(0, 255, 170), 
    650, 800, 0 );
  pieces.add(temp1);

  // ---------------------------------------------
  // 3rd column
  temp1 = new Piece (layout1, color(255, 0, 255), 
    900, 200, 0 );
  pieces.add(temp1);

  temp1 = new Piece (layout2, color(0, 255, 255), 
    900, 500, 0 );
  pieces.add(temp1);

  temp1 = new Piece (layout0, color(255, 0, 0), 
    900, 800, 0 );
  pieces.add(temp1);
}
//
