

class Scene {

  // list trees
  ArrayList<Tree> trees = new ArrayList(); 

  // list clouds  
  ArrayList<Cloud> clouds = new  ArrayList();

  // constr 
  Scene() {
    makeTrees();
    initClouds();
  } // constr 


  void initClouds() {
    // clouds
    for (int i = 0; i<34; i++) {

      // we define a cloud
      int extend  = 3600; 
      Cloud currentCloud =
        new Cloud( 
        random(-extend, extend ), 
        random(-extend, extend ), 
        color (random (191, 255))  ); 

      // ...and add it  
      clouds.add (currentCloud);
    }
  }

  void display() {
    for (Tree t : trees) {
      t.display();
    }

    sphereDetail(14);
    for (Cloud cloud : clouds) {
      cloud.display();
    }
  }

  void makeTrees() {

    color[] colorForest={
      color(#31A010), 
      color(#289B06), 
      color(#2B8B0E), 
      color(#2B8B0D)};

    //------
    float x1=-266; 
    float y1=374; 
    float z1=66; 
    color colorTree = colorForest[2];

    trees.add(new Tree(x1, y1, z1, 
      colorTree, 
      38));

    //------
    x1=306; 
    y1=374; 
    z1=-406; 
    colorTree = colorForest[0];

    trees.add(new Tree(x1, y1, z1, 
      colorTree, 
      38));

    //------
    x1=-306; 
    y1=374; 
    z1=-406; 
    colorTree = colorForest[0];

    trees.add(new Tree(x1, y1, z1, 
      colorTree, 
      38));
  }//method

  void floor1() {
    // decoration: the field  
    float y1=500; 
    PVector[] pvList = {
      new PVector (-500, y1, -500), // upper left corner 
      new PVector (-500, y1, 500), // go down |
      new PVector (500, y1, 500), // go right ->
      new PVector (500, y1, -500)  // go up | (to upper right corner) 
    }; 
    fill(#30D139);//
    beginShape();
    for (PVector pv : pvList) {
      vertex(pv.x, pv.y, pv.z);
    }
    endShape();
  }

  void prepareCanvas() {
    background(#12AEFF);

    // avoid clipping : https : // forum.processing.org/two/discussion/4128/quick-q-how-close-is-too-close-why-when-do-3d-objects-disappear
    perspective(PI/3.0, (float) width/height, 1, 1000000);

    // apply lights 
    lights();
  }

  void showCSG() {
    pushMatrix(); 
    csgResult.setStroke(false); 
    translate (410, GENERAL_Y_HEIGHT-47, 404);
    shape(csgResult);
    popMatrix();
  }

  //
}//class

// =============================================================
