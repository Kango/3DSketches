

class Leaf {

  float x, y, z;   // position 
  float diameter;  // Durchmesser 
  color col = color(random(222,255), random(222, 256), random(16));

  // Constructor
  Leaf(float x_in, float y_in, float z_in, 
    float diameter_in) {

    x = x_in;
    y = y_in;
    z = z_in;
    diameter = diameter_in;
  } // Constructor 

  void display() {
    // display 
    pushMatrix(); 
    translate(x, y, z);
    fill(col);
    noStroke(); 
    // ellipse(0, 0, diameter, diameter);
    sphere(diameter);
    popMatrix();
  }// function 
  //
}//class
//
