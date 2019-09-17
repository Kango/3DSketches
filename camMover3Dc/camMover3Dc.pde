
// 2019/09/17

// hamoid VideoExport
import com.hamoid.*;

// help text 
final String strHelp = 
  "   \n\n"
  +" This program helps to make a video of your scene. It defines a camera animation for your 3D sketch. It uses two Bezier curves to do so: \n"
  +"     * The red curve is the path of the camera position during the animation, \n"
  +"     * the blue curve is the camera look At during the animation.\n\n"
  +" These curves are defined by a series of anchor and control points.\n"
  +" Each curve is defined by 4 points: \n"
  +"     * The 2 boxes of each curve specify the anchor points.\n" 
  +"     * The 2 spheres of each curve specify the control points which define the shape of the curve. \n "
  +" Bezier curves were developed by French engineer Pierre Bezier.\n\n" 
  +" You can drag and drop the anchor and control points with the mouse (in 3 different views: from South, from Top, from West):\n"
  +"     * Anchor points = boxes\n"
  +"     * control points = spheres.\n\n"
  +" This sketch uses the 2 curves for animation of the camera: \n"
  +"     * the curve for the camera position is red,\n" 
  +"     * the curve for the camera Look At is blue. \n"
  +"\n"
  +" Keys:\n"
  +"     * h   - this help screen (H)\n"
  +"     * 0,9 - screens with camera animation: movie modes (with and without the Look At Curve)\n"
  +"     * 8   - screen with camera animation: movie mode (looking ahead on the camera position curve, ignoring the other curve)\n"  
  +"     * 1,2,3 - edit modes from different sides : from South, from Top and from West (drag and drop applies to different values of the spheres (x,y,z)) \n"
  +"     * Space Bar - change views like above (from 1,2,3,0,9,8...)" 
  +"     * s and l - save and load \n"
  +"     * v - video recording start manually\n"
  +"     * e - end video recording manually\n"
  +"     * Return starts automatically video recording from begin and end of the curves (must be in one of the movie modes, otherwise movie mode 0 is chosen)\n\n"
  +" Zoom and Pan\n"
  +"     * Use right click mouse to change zoom (in Edit modes).\n"
  +"     * Click Pan button to pan. Click and drag mouse in this mode to pan (depending on current view mode). Click Pan again to end mode. \n\n\n";
/*
 Draws 2 Bezier curves on the screen. These curves are defined by a series of anchor and control points. 
 The first two parameters specify the first anchor point and the last two parameters specify the other anchor point. 
 The middle parameters specify the control points which define the shape of the curve. Bezier curves were developed by French engineer Pierre Bezier. 
 Using the 3D version requires rendering with P3D (see the Environment reference for more information).
 This sketch uses the 2 curves for animation of the camera: pvListCamPos is red, pvListCamLookAt is blue.   */

MyBezier bezierCamPos;
MyBezier bezierCamLookAt; 

// consts for state - must be unique numbers 
final int stateEditSouth=0; 
final int stateEditTop=1;
final int stateEditWest=2;
final int stateShowMovie=3; 
final int stateShowMovieWithBeziers=4;
final int stateShowMovieLookingAhead=5;
final int stateWaitForLoad=6; 
final int stateWaitForSave=7; 
final int stateHelp=8;
int state = stateEditSouth; // current 

String[] stateText={"Edit: View from South", 
  "Edit: View from Top", 
  "Edit: View from West", 
  "Movie", 
  "Movie with Look At Bezier", 
  "Movie looking ahead", 
  "", "", "", "", ""
};

// values for camera distance/zoom (from scene) in edit modes
int camRadiusSouth = 1240;
int camRadiusTop   = -1700;
int camRadiusWest  = -700;

// values for cam pos for pan mode
PVector camPosSouth = new PVector (0, 0, 0), 
  camPosTop = new PVector (0, 0, 0), 
  camPosWest = new PVector (0, 0, 0);

// this changes previous values (zoom and pan)
boolean holdRight = false; 
boolean panMode   = false;

// Button 
Button buttonPan; 

// Load / Save
String fileToLoad = ""; 
String fileToSave = ""; 

// VideoExport
boolean videoExportIsOn = false;  
VideoExport videoExport;

boolean recordMovieAfterEnter=false; 
boolean recordMovieAfterEnterHasStarted=false; 

// ------------------------------------------------------------------------

void setup() {
  //
  size(1500, 700, P3D);
  background(111);
  // avoid clipping : https : // forum.processing.org/two/discussion/4128/quick-q-how-close-is-too-close-why-when-do-3d-objects-disappear
  perspective(PI/3.0, (float) width/height, 1, 1000000);

  textSize(12);

  // hamoid video export
  videoExport = new VideoExport(this);

  // button 
  buttonPan = new Button("Pan", width-62, 38 ); 

  // load (these are used, when loading does not fail)
  fileToLoad = sketchPath("") + "standard.txt";
  loadBeziers();
  fileToLoad = "";

  // when loading fails, defineTwoBeziers() generates two beziers  
  if (bezierCamPos==null) {
    defineTwoBeziers();
  }
  //
} // setup

void draw() {

  // this state sketch has stuff in draw() outside the main state switch() :-(

  switch (state) {

  case stateEditSouth:
    // edit 
    background(111); 
    lights();
    camera();
    camera(camPosSouth.x, camPosSouth.y, camRadiusSouth, 
      camPosSouth.x, camPosSouth.y, 0, 
      0, 1, 0);
    showBeziersForEdit();//
    showGeneralItemsForEditModes();
    break; 

  case stateEditTop:
    // edit
    background(111); 
    lights();
    camera(camPosTop.x, camRadiusTop, camPosTop.z, 
      camPosTop.x, 0, camPosTop.z, 
      0, 0, 1);
    showBeziersForEdit();//
    showGeneralItemsForEditModes();
    break; 

  case stateEditWest:
    //from west 
    background(111); 
    lights();
    camera(camRadiusWest, camPosWest.y, camPosWest.z, 
      0, camPosWest.y, camPosWest.z, 
      0, 1, 0);
    showBeziersForEdit();//
    showGeneralItemsForEditModes();
    break;

  case stateShowMovie:
    background(111); 
    lights();
    PVector pos = bezierCamPos.showAsMovie(); //
    PVector lookAt = bezierCamLookAt.showAsMovie(); //
    camera(pos.x, pos.y, pos.z, 
      lookAt.x, lookAt.y, lookAt.z, 
      0, 1, 0);
    break; 

  case stateShowMovieWithBeziers:
    background(111); 
    lights();
    pos = bezierCamPos.showAsMovie(); //
    lookAt = bezierCamLookAt.showAsMovie(); //
    camera(pos.x, pos.y, pos.z, 
      lookAt.x, lookAt.y, lookAt.z, 
      0, 1, 0);
    bezierCamLookAt.showBezier(); //
    bezierCamLookAt.showInMovement(); //
    break; 

  case stateShowMovieLookingAhead:
    background(111); 
    lights();
    pos = bezierCamPos.showAsMovie(); //
    lookAt = bezierCamPos.showAsMovie(); //
    camera(pos.x, pos.y, pos.z, 
      lookAt.x, lookAt.y, lookAt.z, 
      0, 1, 0);
    break; 

  case stateWaitForLoad:
    // waiting 
    if (!fileToLoad.equals("")) {
      // then load 
      loadBeziers();
    }
    break;

  case stateWaitForSave:
    // waiting 
    if (!fileToSave.equals("")) {
      // then save 
      saveBeziers();
    }
    break; 

  case stateHelp:
    help();
    break;

  default: 
    //error
    println("error 114: unknown state in draw(): "
      +state);
    exit(); 
    return;
    //
  } //switch 

  // show other texts
  showFurtherScreenElements();
  //
} //draw()
//
