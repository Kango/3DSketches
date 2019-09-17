

// bring in your own scene here 


void scene() {

  basic3Cubes(); 

  pushMatrix();
  translate(0, 0, -300); 
  basic3Cubes(); 
  popMatrix();

  pushMatrix();
  translate(120, 0, 300); 
  basic3Cubes(); 
  popMatrix();

  pushMatrix();
  translate(520, 300+72/2-210/2, 311);
  box(72, 210, 72);
  popMatrix();
}

void basic3Cubes() {
  //
  fill(2, 34, 255);
  stroke(111); 
  myBox(0, 300, 311, 72);

  fill(2, 234, 255);
  stroke(111); 
  myBox(150, 300, 311, 72);

  fill(252, 34, 25);
  stroke(111); 
  myBox(-150, 300, 311, 72);
}
