
// https://forum.processing.org/two/discussion/comment/124510/#Comment_124510 
// https://en.wikipedia.org/wiki/Vertex_(computer_graphics)#Application_to_3D_models

// Possible Wishes ----------
// * snap to position shown with color lines
// * undo
// * save / load 
// * export: define shape in target sketch (as opposed to draw shape every time in target sketch)  

// consts
// Text for the splash screen
String TEXT_SPLASH = 
  "The program allows you to draw and edit shapes in 3D, e.g. a space ship. \n"
  +"The shape can then be exported as a processing sketch.\n\n"
  +"The entire shape consists of many shapes, like the walls, the ceiling and so on.\n\n"
  +"To achieve this, you start in a mode to draw points. Here, you enter points with the mouse."
  +"\nThese are the corners of the shapes. \n"
  +"You can edit the points, remove them or move them (x, y and z direction)."
  +"\n\nIn a second mode you can then connect the points with the mouse.\n"
  +"A typical shape has only 3 or 4 corners (wall or ceiling) but you can have as many corners as you like. \nTo finish a shape, you hit return.\n"
  +"Then you can start entering the next shape. \n\n"
  +"To export the shapes, you hit x. The entire new processing sketch is now in your direct window.\n"
  +"You can copy it from there and paste it in a new(!) processing sketch and run it.\n\n"
  +"You can always switch between the 2 modes. \n"
  +"In both modes you see a help text on the right side of the screen which shows your options (yellow box). \n"
  +"To quit the program hit Z (Shift-Z)\n";

// Help / instructions for draw points 
final String HELP1 = 
  "Click mouse to enter points."
  +"\nRight click mouse on a point to move it (xyz)."
  +"\nBackspace to delete last item."
  +"\nHit c to delete entire list."
  +"\nUse r rotate on/off."
  +"\nHit e for connect mode."
  +"\nHit Z to quit.";

// Help / instructions for draw shapes  
final String HELP2 = 
  "Click mouse to connect points."
  +"\nRight click mouse on a point to move it (xyz)."
  +"\nBackspace to delete last point from shape."
  +"\nHit c to delete entire current shape." 
  +"\nHit Space bar: fill on/off." 
  +"\nHit e to go back to points mode."
  +"\nUse r: rotate on/off."
  +"\nHit x to export."
  +"\nHit Z to quit.";

// consts 
final int UNDEFINED   = -1; 

// consts for colors
final color BLACK     = color(0);
final color WHITE     = color(255);  

// 2 values are 0 (RGB)
final color RED       = color(255, 0, 0);  
final color GREEN     = color(0, 255, 0);  
final color BLUE      = color(0, 0, 255);  

// 1 value is 0  
final color YELLOW    = color(255, 255, 0);  
final color PINK      = color(255, 0, 255);  
final color TURQUOISE = color(0, 255, 255);

// ArrayLists 
ArrayList<OnePoint> listPoints = new ArrayList();  
ArrayList<OneShape> listShapes = new ArrayList();

// current shape index for listShapes
int currShape; 

//flags 
boolean showFill     = true;  
boolean flagExported = false; 

//states 
final int STATE_DRAW_POINTS = 0;  // corners const  
final int STATE_DRAW_SHAPES = 1;  // shapes const
final int STATE_DRAW_SPLASH_SCREEN = 2;  // shapes const
int state = STATE_DRAW_SPLASH_SCREEN; // current state 

// mouse over or for slider: selected point  
int currPointFromMouseOver=UNDEFINED;

// for slider
boolean holdSlider=false;  

// Misc ----

// fonts 
PFont pfont1; 
PFont pfont2; 

// rotate 
boolean rotateFlag = false;
float angle1; 

// -------------------------------------------------------------------------------------

void setup() {
  size(1200, 800, P3D);
  background(111);

  listShapes.add(new OneShape());

  println("Welcome to Shape Editor ------------------------\n"+TEXT_SPLASH);
  println("Instructions for Mode draw points -----------------------\n"+HELP1+"\n");
  println("Instructions for Mode draw shapes -----------------------\n"+HELP2+"\n");

  // fonts
  pfont1 = createFont("Arial", 12); // small
  pfont2 = createFont("Arial", 19); // big
  textFont (pfont1);                // small
}//func

void draw() {

  switch(state) {

  case STATE_DRAW_SPLASH_SCREEN:
    drawForSTATE_DRAW_SPLASH_SCREEN();
    break; 

  case STATE_DRAW_POINTS:
    drawForSTATE_DRAW_POINTS();
    break; 

  case STATE_DRAW_SHAPES:
    drawForSTATE_DRAW_SHAPES();
    break;

  default: 
    println("Error in draw(): "+state);
    exit(); 
    break; 
    //
  } //switch
  //
} //func 
//