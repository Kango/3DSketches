

// To do : search ???
// 
//         
// 2019/09/17
// 2020/11/10

import peasy.PeasyCam;
import com.hamoid.*;

// help text 
final String strHelp = 
  "   \n\n\n"
  +" This program is a 3D Drawing Program.  \n"
  +" It has a 3D cursor, you can place boxes and you have 3 different views and you can freely rotate with Peasy Cam.\n\n"
  +" You can move the 3 example boxes in the upper screen section and drag/drop the boxes with the mouse (in 3 different views: from South, from Top, from West):\n"
  +" (The boxes below are just decoration.)\n"
  +" The yellow box is your 3D Cursor.\n\n"
  +" Keys:\n"
  +"     * h   - this help screen (H)\n"
  +"     * 1,2,3 - edit modes from different sides : from South, from Top and from West (drag and drop applies to different values of the spheres (x,y,z)) \n"
  +"     * Space Bar - change views like above (from 1,2,3,1,2,3....)\n"
  +"     * wasd and l and p for moving the 3D Cursor\n"
  +"     * cursor and o and k for moving the 3D Cursor with DRAWING boxes\n" 
  +"     * Return: add boxes\n"   
  //  +"     * m and n: save and load \n"
  +"     * Backspace: delete last box \n\n"
  +" Zoom and Pan\n"
  +"     * Use Zoom Button plus left mouse button to change zoom (in Edit modes).\n"
  +"     * Click Pan Button to pan. Click and drag mouse in this mode to pan (depending on current view mode). "
  +"     * Click Pan Button again to end mode. \n\n"
  +" Click 'Peasy Cam'-Button to switch peasy cam on and off. \n";

ArrayList<MyItem> listMyItem = new ArrayList();

MyItem cursor3D; 

int indexHold=-1; 

// consts for state - must be unique numbers 
final int stateEditSouth     = 0; 
final int stateEditTop       = 1;
final int stateEditWest      = 2;
final int STATE_SPLASHSCREEN = 3; 
final int stateWaitForLoad   = 6; 
final int stateWaitForSave   = 7; 
final int stateHelp          = 8;
int state = STATE_SPLASHSCREEN; // current 

String[] stateText = { 
  "View from South (default View) - change with 1,2,3", 
  "View from Top", 
  "View from West", 
  "", 
  "", 
  "", 
  "", 
  ""
};

// values for camera distance/zoom (from scene) in edit modes
int camRadiusSouth = 1240;
int camRadiusTop   = -1700;
int camRadiusWest  = -700;

// values for cam pos for pan mode
PVector camPosSouth = new PVector (0, 0, 0), 
  camPosTop = new PVector (0, 0, 0), 
  camPosWest = new PVector (0, 0, 0);

// PeasyCam
PeasyCam peasyCamera;

// this changes previous values (zoom and pan)
boolean zoomMode = false; 
boolean panMode   = false;

// this is true when we moved the cursor3D by clicking anywhere in the canvas
boolean showCursor3DData=false; // It's a flag, when true, we show data

// Button 
ArrayList< Button> buttons = new ArrayList(); 

// Load / Save
String fileToLoad = ""; 
String fileToSave = ""; 

// a message flashes briefly 
String stringBigMessageBrief="";
int intBigMessageBriefTimer= 0;
boolean flagBigMessageBrief=false; 

// ***************************************************************************
boolean videoExportIsOn = false;     //*************************************** 
// ***************************************************************************

VideoExport videoExport;

// --------------------------------------------------------------------------------------------------------------

void setup() {
  //
  size(1500, 700, P3D);
  background(111);
  // avoid clipping : https : // forum.processing.org/two/discussion/4128/quick-q-how-close-is-too-close-why-when-do-3d-objects-disappear
  perspective(PI/3.0, (float) width/height, 1, 1000000);
  textSize(12);

  // buttons
  initButtons();

  fileToLoad = "";
  definePoints(); 
  peasyCamera = new PeasyCam(this, 400);
  peasyCamera.setActive(false);

  // hamoid video export
  if (videoExportIsOn) {
    videoExport = new VideoExport(this);
    videoExport.startMovie();
    println( "Use e for  videoExport.endMovie");
  } else {
    println( "videoExport IS OFF  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  }

  buttons.get(0).isSelected = true;
  buttons.get(1).isSelected = false;
  buttons.get(2).isSelected = false; 
  //
} // setup

void draw() {

  println(state); 

  switch (state) {

  case STATE_SPLASHSCREEN:
    background(111); 
    splashScreen();
    break; 

  case stateEditSouth:
    // edit 
    background(111); 
    lights();
    if (peasyCamera.isActive() == false) { 
      camera();
      camera(camPosSouth.x, camPosSouth.y, camRadiusSouth, 
        camPosSouth.x, camPosSouth.y, 0, 
        0, 1, 0);
    }
    showItemsForEdit();//
    showGeneralItemsForEditModes();
    // show other texts
    showFurtherScreenElements();
    keyPressedThroughout(); 
    break; 

  case stateEditTop:
    // edit
    background(111); 
    lights();
    if (peasyCamera.isActive() == false) {
      camera(camPosTop.x, camRadiusTop, camPosTop.z, 
        camPosTop.x, 0, camPosTop.z, 
        0, 0, 1);
    }
    showItemsForEdit();//
    showGeneralItemsForEditModes();
    // show other texts
    showFurtherScreenElements();
    keyPressedThroughout(); 
    break; 

  case stateEditWest:
    //from west 
    background(111); 
    lights();
    if (peasyCamera.isActive() == false) {
      camera(camRadiusWest, camPosWest.y, camPosWest.z, 
        0, camPosWest.y, camPosWest.z, 
        0, 1, 0);
    }
    showItemsForEdit();//
    showGeneralItemsForEditModes();
    // show other texts
    showFurtherScreenElements();
    keyPressedThroughout(); 
    break;

  case stateWaitForLoad:
    // waiting 
    if (!fileToLoad.equals("")) {
      // then load 
      loadItems();
    }
    break;

  case stateWaitForSave:
    // waiting 
    if (!fileToSave.equals("")) {
      // then save 
      saveItems();
    }
    break; 

  case stateHelp:
    help();
    break;

  default: 
    // Error
    println("Error 114: unknown state in draw(): "
      + state 
      + " ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    exit(); 
    return;
    //
  } //switch
  //  
  // hamoid video export
  if (videoExportIsOn) {
    videoExport.saveFrame();
    // saveFrame();
  }
  //
} //draw()
//
