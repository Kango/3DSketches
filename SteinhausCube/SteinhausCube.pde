
// The Steinhaus-Cube
// Steinhaus Cube (Mikusiñski's Cube) - http : // puzzlewillbeplayed.com/333/Steinhaus/
// Six pieces need to be placed into the empty main cube. 
// (re-build the empty 3x3x3 cube with the 6 different pieces) 

//*************************************************************************
// TO DO:
//     take back move (or remove pieces from main cube by clicking its numbers)
//*************************************************************************

final String MAIN_HELP = 
  "*** Fill the Cube ***\n\n"
  +"(The Steinhaus-Cube)\n"
  +"Six pieces need to be placed into the empty main cube "
  +"(re-build the empty 3x3x3 cube with the six different pieces).\n\n"
  +"Use 0..5 to select a piece.\n"
  +"Use x to clear the cube.\n"
  +"Use cursor and p/l to move piece.\n"
  +"Use qa, ws, ed to rotate piece.\n"
  +"Use Enter to place piece.\n"
  +"Use Escape to cancel a piece.\n"
  +"Use r to toggle rotation.\n"
  +"Use f to toggle mouse rotation.\n"
  +"Use m to toggle view.\n"
  +"Use n for Solver.\n"
  +"Use # to load a Solution.\n"
  +"\nUse Z to quit program.";

final String MAIN_HELP_SOLUTION =
  "*** Fill the Cube ***\n\n"
  +"(Solution Screen)\n"
  +"\nUse # to quit this screen."
  +"\nUse + to change size."
  +"\nUse Space bar un-explode."
  +"\nHold mouse to stop rotation."
  +"\nUse 0..5 to eject piece y/n."
  +"\nUse Z to quit program.";

final int STATE_NORMAL         = 0;   // normal view 
final int STATE_MAIN_CUBE      = 1;   // View like normal view but shows main cube (central and big) without the 6 pieces
final int STATE_PREPARE_SOLVE  = 2;   // prepare SOLVER 
final int STATE_SOLVE          = 3;   // SOLVER 
final int STATE_LOAD_SOLUTION  = 4;   // Load and display 
int state = STATE_NORMAL; 

final float sizeNormal = 38; 
final float sizeMax = 180; // or 220; or so
PVector posMax = new PVector();

// list of pieces to fill the target cube via simulation cube  
ArrayList<Piece> pieces = new ArrayList ();

// register which piece is already used 
boolean[] usedPieces = new boolean [6];

MainCube mainCube; // target cube (visible cube 3x3x3)
SimulationCube simulationCube;   // simulation cube (invisible cube, surrounding the main cube)

// offset from simulation cube to main cube (constants)
final int OFFSETX2=-5, OFFSETY2=-5, OFFSETZ2=-5;

// rotate on/off 
boolean mainCubeRotate=true;

// which piece is placed (current piece)
int currPlacer = -1; // index for ArrayList pieces

// placing position 
// placing by user (crs and p/l) 
int offsetX=5, offsetY=5, offsetZ=5;

// rotation 
float angle1; // 
float angle2; //  
boolean freeRotateMainCube = false;  

// Misc 
PFont pfont;
String msgError="";

// for test purpose: show Simulation cube on / off 
boolean showSimulationCube=true;

// SOLVER : -------------------------------------------------------
int foundSolutions;  // solutions
int[]  arrOfIL = {0, 1, 2, 3, 4, 5};  

// load solution (key #) ------------------------------------------
String fileNameSolution = "S20181113_130944.txt";
boolean showSolutionAsExploded_View_Drawing=true; 
boolean[] explodeViewAllowed={true, true, true, false, true, true}; // eject status y/n
boolean flagShowExploded = true; 

ArrayList<File> alFiles = null;  
int alFiles_i=0; 
String alFileName="";

// -------------------------------------------------------

void setup() {

  size(1300, 990, P3D);
  //fullScreen(P3D);

  pfont=createFont("ARIAL", 13);
  textFont(pfont); 

  mainCube = new MainCube ( 335, 295, -110 );
  simulationCube = new SimulationCube ( 335, 295, -110 );

  posMax = new PVector(width/2, 600, -430);

  println (MAIN_HELP+"\n================================\n");

  initPieces(); 
  checkNumberOfPieces();

  alFiles = getFiles();  // command 1
} // func 

void draw() {

  background(111); // gray 
  // reset some stuff that was set differently by the HUD
  hint(ENABLE_DEPTH_TEST);
  lights();

  // see tab ToolsStates
  switch (state) {

  case STATE_NORMAL: 
    drawForStateNormal(); 
    break;

  case STATE_MAIN_CUBE: 
    drawForStateMainCube(); 
    break;

  case STATE_LOAD_SOLUTION:
    showSolution();  
    break; 

  case STATE_PREPARE_SOLVE:
    drawForStatePrepareSolve(); 
    break;

  case STATE_SOLVE: 
    drawForStateSolve(); 
    break;

  default:
    //error
    println ("Error 198 ++++++++++++++++++++++++++++++++++++++++++"); 
    exit(); 
    break;
    //
  } // switch
  //
} // func 
//
