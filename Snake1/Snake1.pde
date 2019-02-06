
// SNAKE (RUBIK's magic snake) 

import peasy.*;
PeasyCam camera;

// the central class
Snake snake; 

// fonts 
PFont fontSmall;
PFont fontBig;

// states of the program
final int NORMAL                         = 0;  // NORMAL 
final int ANIMATION_TRANSITION_TO_SPHERE = 1;  // animation tries to achieve the sphere (from the snake)
final int ANIMATION_RANDOM_MOVES         = 2;  // random game 
int state = NORMAL; 

// for state ANIMATION_TRANSITION_TO_SPHERE and ANIMATION_RANDOM_MOVES (animations)
int i = 0;
int timer;

// ----------------------------------------------

void setup() {
  // size(1500, 800, P3D);
  fullScreen(P3D);
  fontSmall=createFont("ARIAL", 12);
  fontBig=createFont("ARIAL", 32);

  textFont(fontSmall);
  textMode(SHAPE);  

  snake = new Snake();

  // camera
  // camera = new PeasyCam(this, 25, 25, -25, 100);
  // camera = new PeasyCam(this, 100);
  camera = new PeasyCam(this, 100, -100, 0, 600);

  background(0);
}

void draw() {
  background(0);
  lights();

  switch (state) {

  case NORMAL:
    stateNormal(); 
    break; 

  case ANIMATION_TRANSITION_TO_SPHERE:
    stateANIMATION_TRANSITION_TO_SPHERE();  
    break;

  case ANIMATION_RANDOM_MOVES:
    stateANIMATION_RANDOM_MOVES();
    break; 

  default:
    println("error 110: unknown state");
    exit(); 
    break;
  }//switch 
  //
} // func 
//
