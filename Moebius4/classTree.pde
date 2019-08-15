

class Tree {

  float x, y, z, size; 
  color colTree;

  //constr
  Tree ( float x1, float y1, float z1, 
    color c1, 
    float size1) {

    x=x1;
    y=y1;
    z=z1;

    colTree=c1;
    size=random(22, 62);
  }//constr

  void display() {
    noStroke();
    fill(colTree);

    pushMatrix(); 
    translate(x, y, z);

    strokeWeight(6); 
    stroke(#C68214); 
    line(0, 0, 0, 
      0, y, 0);
    strokeWeight(1);

    noStroke(); 
    fill(colTree);
    sphere(size);

    popMatrix();
  }//method
  //
} // class
//
