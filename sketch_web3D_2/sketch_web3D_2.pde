

ArrayList <Mover> moverList  = new ArrayList <Mover>();

void setup() {

  //  size(800, 500, P3D);
  //  size(displayWidth, displayHeight, P3D);
  fullScreen(P3D);

  sphereDetail(17);

  int total = 0;
  while (total<50) {
    float x=random(width/2-266, width/2+266);
    float y=random(height/2-266, height/2+266);
    float z=random(-266, +266);
    Mover newMover= new Mover (
      x, y, z, 
      random(8, 57), 
      numberAround0Without0(), 
      numberAround0Without0(), 
      numberAround0Without0()  );

    moverList.add(newMover);
    total++;
  }
}

void draw() {
  background(0);
  lights(); 

  for (Mover currMover : moverList) {
    currMover.update();
    currMover.DrawSphere();
  }
}

//---------------------------------------------------------------------
// Tools 

float numberAround0Without0() {
  // returns a pos OR a neg number without the area around 0 
  float result = random(0.3, 0.5); // pos

  if (random(100) < 50) 
    return -result; // neg

  return result; // pos
}

// ======================================================================

class Mover {

  float speedX, speedY, speedZ;
  float rad;

  float x;
  float y;
  float z;

  color colMover; 

  Mover(float x_, float y_, float z_, 
    float rad_, 
    float speedX_, 
    float speedY_, 
    float speedZ_) {

    this.x=x_;
    this.y=y_;
    this.z=z_;

    this.rad=rad_;

    this.speedX=speedX_;
    this.speedY=speedY_;
    this.speedZ=speedZ_;

    colMover=color(random(256), 
      random(256), 
      random(256));
  }//constr 

  void update() {
    x += speedX;
    y += speedY;
    z += speedZ;
    float dist=800; 
    speedX=keepInside(speedX, x, width/2-dist, width/2+dist);
    speedY=keepInside(speedY, y, height/2-dist, height/2+dist);
    speedZ=keepInside(speedZ, z, -300, -110);
  }

  float keepInside(
    float speed, 
    float position, 
    float min, float max) {
    // boundary control:
    // keeps position inside min and max by changing speed
    if (position<min)return abs(speed);
    if (position>max)return -abs(speed);
    return speed;
  }

  void DrawSphere() {
    fill(colMover);
    noStroke();
    pushMatrix();
    translate(x, y, z);
    sphere(rad);
    popMatrix();
  }
  //
}//class
//
