
// red cross

void showCross (float x1, float y1) {

  pushMatrix(); 
  noFill();
  translate(x1, y1); 
  translate (0, 0, 44);

  beginShape();
  fill(255, 0, 0); // RED 
  stroke(2);       // black
  vertex(487, 340);
  vertex(519, 351);
  vertex(474, 434);
  vertex(519, 507);
  vertex(485, 516);
  vertex(456, 473);
  vertex(424, 524);
  vertex(392, 507);
  vertex(432, 434);
  vertex(393, 370);
  vertex(425, 345);
  vertex(455, 396);
  vertex(487, 340);

  endShape(CLOSE);

  popMatrix();
  //
} // func 
//
