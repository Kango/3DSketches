


// 3D sketch 

// You can see the sketch as a stage where you can place different Main Items on. 
// In this case the  Main Item is a Moebius Strip. 
// To change the  Main Item, see initMainItem() and showMainItem() in their two tabs.
// Other elements are pure decoration, like clouds, trees, CSG etc. 

//You can also switch Video Export on and off. See the variable videoExportIsOn. 

// https://youtu.be/xNfS3uOd6P8

import com.hamoid.*;

CameraClass cam; 

Scene scene;

final int GENERAL_Y_HEIGHT = 500; 

ArrayList<Leaf> leaves = new ArrayList();

PShape moebius1;

// ***************************************************************************
boolean videoExportIsOn = false;// ******************************************** 
// ***************************************************************************

VideoExport videoExport;

// -----------------------------------------------------

void setup() {
  size (1400, 800, P3D);
  sphereDetail(21);  
  initCSG(); 

  // ***************************************************************************
  initMainItem();
  // ***************************************************************************

  cam = new CameraClass ();
  scene=new Scene();

  // hamoid video export
  if (videoExportIsOn) {
    videoExport = new VideoExport(this);
    println( "Start with s // Use e for  videoExport.endMovie");
    videoExport.startMovie();
  } else {
    println( "videoExport IS OFF  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
  }
} // func 

void draw() {
  // clear & prepare canvas 
  scene.prepareCanvas();

  // camera values 
  // cam.camMouse();  // different kinds of cameras 
  // cam.camMouseAuto();
  cam.camMouseAutoWithChangingRadius();
  // apply the values of the class to the real camera
  cam.set();

  // Rasen
  scene.floor1(); 

  // ***************************************************************************
  // show Main Item   
  showMainItem(); 
  // ***************************************************************************

  // make the scene  
  scene.display();
  scene.showCSG(); 

  // text upper left corner
  fill(0, 255, 0); 
  cam.HUD_text("Auto camera; " + videoExportIsOnToString());

  // hamoid video export
  if (videoExportIsOn) {
    videoExport.saveFrame();
  }
  //
} // func 
//
