

/*
 Draws 2 Bezier curves on the screen. These curves are defined by a series of anchor and control points. 
 The first two parameters specify the first anchor point and the last two parameters specify the other anchor point. 
 The middle parameters specify the control points which define the shape of the curve. Bezier curves were developed by French engineer Pierre Bezier. 
 Using the 3D version requires rendering with P3D (see the Environment reference for more information).
 
 This sketch uses the 2 curves for animation of the camera: pvListCamPos is red, pvListCamLookAt is blue
 
 */

MyBezier bezierCamPos;
MyBezier bezierCamLookAt; 

final int stateEditSouth=0; 
final int stateEditTop=1;
final int stateEditWest=2;
final int stateShowMovie=3; 
final int stateShowMovieWithBeziers=4; 
final int stateWaitForLoad=5; 
final int stateWaitForSave=6; 
final int stateHelp=7;
int state = stateEditSouth; 

String[] stateText={"Edit: View from South", 
  "Edit: View from Top", 
  "Edit: View from West", 
  "Movie", 
  "Movie with Look At Bezier", 
  "", "", "", "", "", ""
};

// values for camera distance (from scene) in edit modes
int camRadiusSouth = 1240;
int camRadiusTop   = -1700;
int camRadiusWest  = -700;

// values for cam pos for pan mode
PVector camPosSouth = new PVector (0, 0, 0), 
  camPosTop = new PVector (0, 0, 0), 
  camPosWest = new PVector (0, 0, 0);

// this changes previous values 
boolean holdRight = false; 
boolean panMode   = false;

Button buttonPan; 

// Load / Save
String fileToLoad = ""; 
String fileToSave = ""; 

// ------------------------------------------------------------------------

void setup() {
  //
  size(900, 700, P3D);
  background(111);

  buttonPan = new Button(); 

  // defining 2 beziers 
  PVector[] pvListCamPos = { 
    new PVector(15, 80, -110), 
    new PVector(10, 10, -120), 
    new PVector(90, 90, 0), 
    new PVector(85, 20, 0)   }; 

  PVector[] pvListCamLookAt = { 
    new PVector(115, 180, 110), 
    new PVector(110, 110, 120), 
    new PVector(190, 190, 0), 
    new PVector(185, 120, 0)   }; 

  bezierCamPos=new MyBezier(pvListCamPos, color(255, 0, 0));   // red 
  bezierCamLookAt=new MyBezier(pvListCamLookAt, color(0, 0, 255) );  // blue 

  println ("pvListCamPos is red, pvListCamLookAt is blue");
} // setup

void draw() {

  // this state sketch has stuff in draw() outside the main state switch :-(

  switch (state) {

  case stateEditSouth:
    // edit / 
    background(111); 
    lights();
    camera();
    camera(camPosSouth.x, camPosSouth.y, camRadiusSouth, 
      0, 0, 0, 
      0, 1, 0);
    showBeziersForEdit();//
    showGeneralItemsForEditModes();
    break; 

  case stateEditTop:
    // edit
    background(111); 
    lights();
    camera(camPosTop.x, camRadiusTop, camPosTop.z, 
      0, 0, 0, 
      0, 0, 1);
    showBeziersForEdit();//
    showGeneralItemsForEditModes();
    break; 

  case stateEditWest:
    //from west 
    background(111); 
    lights();
    camera(camRadiusWest, camPosWest.y, camPosWest.z, 
      0, 0, 0, 
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
    // bezierCamLookAt.showInMovement(); //
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
    println("error 114: unknown state in draw(): "
      +state);
    exit(); 
    return;
    //
  }//switch 

  // other stuff in draw 
  if (state!=stateHelp) {
    scene();

    checkHoldRight(); 

    // HUD 
    camera();
    fill(0);
    text(stateText[state]+"\n"
      +"Curve for the Camera Positions is red, curve for the Camera LookAt is blue. Anchor points = boxes, control points = sphere. \nh for Help Screen.", 
      22, 22);

    /*
    // Button 
     if (panMode) 
     fill(0, 255, 0);
     else 
     fill(0);
     buttonPan.display();
     */

    // text for Zoom / hold right
    if (holdRight) {
      pushStyle();
      textAlign(CENTER, CENTER);
      textSize(52);
      textMode(SHAPE);
      fill(0, 255, 0);
      text("Zoom", width/2, height/2);
      textAlign(LEFT);
      popStyle();
    }//if
    //
  }//if
  //
} //draw()
//
