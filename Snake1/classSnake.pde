
// the entire snake 

class Snake {

  // A helper class for 3D related commands (short version of a much bigger class)
  ThreeD threeD1 = new ThreeD();

  // snake consists of a lot of elements
  ArrayList<SnakePart> snakeParts = new ArrayList();  

  // active element (change with x/-) 
  int active = 5; 

  // constr 
  Snake() {
    int angle=180;
    // snake consists of a lot of elements
    // we build them in a for-loop
    for (int i = 0; i<24; i++) {
      snakeParts.add(new SnakePart( 27, angle));
    }//for
  } // constr 

  void display() {

    threeD1.avoidClipping();

    for (int i = 0; i<24; i++) {
      if (i==active)
        snakeParts.get(i).display( true ); // active / green 
      else 
      snakeParts.get(i).display( false ); // not active / red
    } //for
  } //method

  void turnActive() {
    // rotate active element / space bar
    snakeParts.get(active).angle += 90;
    if (snakeParts.get(active).angle >= 360)
      snakeParts.get(active).angle = 0; // reset
  } //method

  boolean snakeComplete( int[] list ) {
    // returns if snake is completed (identical with list values)
    boolean complete = true; // qed 
    for (int i = 0; i<24; i++) {
      if (snakeParts.get(i).angle != list[i]) 
        complete=false;
    }//for
    return complete;
  }
  //
} //class
//
