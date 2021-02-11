
// Colors 
// MAIN Colors 

final color BLACK = color (0);
final color WHITE = color (255);

final color RED   = color (255, 0, 0);
final color GREEN = color (0, 255, 0);
final color BLUE  = color (0, 0, 255);

// Other colors 

final int LIGHTGRAY = color(111); 
final int DARKGRAY  = color(66);

final color YELLOW  = color (255, 255, 0);
// 

void splashScreen() {
  // yellow box 

  camera();

  final int widthBox=600; 
  final float heightY=263;

  fill(YELLOW); 
  stroke(BLACK); 
  rect(width/2-widthBox/2, 110, 
    widthBox, heightY); 
  noFill(); 
  int innerFrameDistance=3; 
  rect(width/2-widthBox/2 +innerFrameDistance, 110+innerFrameDistance, 
    widthBox    -2*innerFrameDistance, heightY-2*innerFrameDistance);

  fill(BLACK);
  textSize(60); 
  textMode(SHAPE); 
  text("Draw Program 3D ", 
    width/2-widthBox/2 + 9, 290);
  textSize(33);
  text("with 3 different views", 
    width/2-widthBox/2 + 39, 333);

  // reset
  fill(WHITE);
  textSize(12);

  // Status Bar (bottom of the screen)
  statusBar("Click the mouse.  ");
}

void statusBar(String statusBarText) {
  // footer 
  fill(LIGHTGRAY);
  noStroke();
  rect(0, height-20, 
    width, 22);

  fill(WHITE);
  text(statusBarText, 
    15, height-5);
}
