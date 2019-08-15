

class CameraClass {

  // capsules the normal camera() command and its vectors 

  PVector camPos;     // its vectors 
  PVector camLookAt;
  PVector camUp;

  PVector camPosInitial;     // its vectors - the default (unchanged) 
  PVector camLookAtInitial;
  PVector camUpInitial; 

  // for follow
  PVector camWhereItShouldBe = new PVector(0, 0, 0);
  PVector camAdd = new PVector(0, -60, 0);
  float easing = .019; // .07; // how fast it changes

  float camCurrentAngle=0;// -90;   // for cam rotation around itself (around Y-axis)
  float camRadius;             // same situation 

  float RadiusCam=670.0;  // dist camera from the scene (radius of the cam around the player) 
  float add=-0.47;
  
  boolean firstTime=true; 

  int pseudomouseX=0;

  // constructor without parameters
  CameraClass() {
    // constr
    // set vectors 
    camPos    = new PVector(width/2.0, height/2.0, 990);
    camLookAt = new PVector(width/2.0, height/2.0, -600);
    camUp     = new PVector( 0, 1, 0 );
    // save the initial values
    camPosInitial    = camPos.get();
    camLookAtInitial = camLookAt.get();
    camUpInitial     = camUp.get();
  }  // constr

  // ----------------------------------------

  void set() {
    // apply vectors to actual camera
    camera (camPos.x, camPos.y, camPos.z, 
      camLookAt.x, camLookAt.y, camLookAt.z, 
      camUp.x, camUp.y, camUp.z);
  }

  // ---

  void setLookAt (float x1, float y1, float z1) {
    camLookAt = new PVector(x1, y1, z1);
  }

  // ---

  void lookAtPVectorFollowOnlyLookAt(PVector followMe) {
    // Two versions of this. Without easing. 
    // Follows a player (e.g.),
    // change only look at.
    camLookAt = followMe.get();
  }

  void lookAtPVectorFollowOnlyLookAtWithEasing(PVector followMe) {
    // Version  with easing.
    // Follows a player (e.g.),
    // change only look at.
    float easing = 0.0398; 
    camLookAt.x += (followMe.x-camLookAt.x) * easing;   // followMe.get();
    //camLookAt.y += (followMe.y-camLookAt.y) * easing;
    camLookAt.y  =  followMe.y; // other principle 
    camLookAt.z += (followMe.z-camLookAt.z) * easing;
  }

  // ---

  void lookAtPVectorFollow (PVector followMe, float heightAbovePlayer) {

    // second version of doing it 
    // camera is trying to get to player position, but with easing. 

    // follows a ball / player (e.g.),
    // complete following (lookAt and camPos).

    // manage Look At 
    camLookAt =  followMe.get();

    // manage position of the camera
    float easing = 0.0198; 
    // x
    camPos.x    += (followMe.x-camPos.x) * easing;

    // y
    // camPos.y    += (followMe.y-camPos.y) * easing -20;
    camPos.y    = followMe.y - heightAbovePlayer; // other principle for y ! 

    // z
    camPos.z    += (followMe.z-camPos.z) * easing;
  }

  // ---

  void camMouse() {
    float RadiusCam=670.0;  // dist camera from the scene (radius of the cam around the player) 

    cam.setLookAt( 0, 430, 0 );  

    float angle2=map(mouseX, 0, width, -1, 2*TWO_PI);

    camPos.x = 0 + RadiusCam*cos(angle2);
    camPos.y = map(mouseY, 0, height, 0, GENERAL_Y_HEIGHT-1); 
    camPos.z = 0 + RadiusCam*sin(angle2);
  }

  void camMouseAuto() {
    cam.setLookAt( 0, 230, 0 );  

    float angle2=map(pseudomouseX, 0, width, -1, 2*TWO_PI);

    camPos.x = 0 + RadiusCam*cos(angle2);
    camPos.y = map(height/2-311, 0, height, 0, GENERAL_Y_HEIGHT-1); 
    camPos.z = 0 + RadiusCam*sin(angle2);

    pseudomouseX++;
    if (pseudomouseX>=width) {   // videoExport
      endSketch();
    }
  }//

  void camMouseAutoWithChangingRadius() {
    cam.setLookAt( 0, 230, 0 );  

    float angle2=map(pseudomouseX, 0, width, -1, 2*TWO_PI);

    camPos.x = 0 + RadiusCam*cos(angle2);
    camPos.y = map(height/2-311, 0, height, 0, GENERAL_Y_HEIGHT-1); 
    camPos.z = 0 + RadiusCam*sin(angle2);

    pseudomouseX++;
    if (pseudomouseX>=width) {   // videoExport
      endSketch();
    }

    RadiusCam+=add;
    if (RadiusCam<1) {
      RadiusCam=1;
      add=abs(add);
    }
  }//

  // ---

  void printData() {
    println ( "Cam at " + camPos 
      + " looking at " + camLookAt 
      + " (angle = "
      +camCurrentAngle
      +").");
  }

  void HUD_text (String a1) {
    // HUD text upper left corner 
    // this must be called at the very end of draw()

    // this is a 2D HUD 
    camera();
    hint(DISABLE_DEPTH_TEST);
    noLights();
    // ------------------
    textSize(16);
    text (a1, 20, 20);
    // ------------------
    // reset all parameters to defaults
    textAlign(LEFT, BASELINE);
    rectMode(CORNER);
    textSize(32);
    hint(ENABLE_DEPTH_TEST); // no HUD anymore
    lights();
  } // method
  //
} // class

// =============================================================
