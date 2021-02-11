
// functions for mouse II.

void mousePressedLeftButton() {

  // we eval mouse left button.
  // Now, different things can happen here: 
  //       buttons, panning or peasyCam: we leave here, cursor3D pressed (drag/drop cursor), items pressed (drag/drop cursor), clicked outside any shape (move cursor) 

  if (zoomMode) {
    //
    // Zoom 
    checkzoomMode(); 
    //return;
  }

  // check buttons 
  for (Button currentButton : buttons) { 
    if (currentButton.mouseNear()) {
      execute(currentButton.id);
      // currentButton.isSelected = ! currentButton.isSelected; 
      return;
    }//if
  }//for 
  // -----

  // When in Pan Mode, we don't change the boxes (or when peasy cam is on)
  if (panMode || peasyCamera.isActive()) {
    return; // leave
  }

  if (cursor3D.classMousePressed()) {
    return;
  }//if

  // check listMyItem
  for (MyItem myI : listMyItem) {
    if (myI.classMousePressed() ) { 
      return;
    }
  }

  //-----
  // user clicked mouse outside anything
  // change pos of cursor3D depending on view
  clickOutsideAnyShape();
} // func 

void clickOutsideAnyShape() {
  // user clicked mouse outside anything: 
  // change pos of cursor3D depending on view

  // set data flag to true to show cursor data now
  showCursor3DData=true; 

  int i=0; 
  float addX=0;
  float addY=0;

  // change pos of cursor3D depending on view
  switch(state) {

  case stateEditSouth:
    // x/y
    // Standard: (mouseX is x (with cursor3D.screenPos.x) and mouseY is y (with cursor3D.screenPos.y) )
    // use camera here to make screenPos (screenX in the class) work!!!
    camera(camPosSouth.x, camPosSouth.y, camRadiusSouth, 
      camPosSouth.x, camPosSouth.y, 0, 
      0, 1, 0);
    //println("here");
    while (i<3200) {
      if ( (dist(cursor3D.screenPos.x, 0, mouseX, 0) > 100)) {
        addX=100;
      } else {
        addX = 1;
      }
      if ( (dist(cursor3D.screenPos.y, 0, mouseY, 0) > 100)) {
        addY=100;
      } else {
        addY = 1;
      }
      //
      cursor3D.update();
      if (cursor3D.screenPos.x < mouseX) 
        cursor3D.pvPos.x+=addX;
      cursor3D.update();
      if (cursor3D.screenPos.x > mouseX) { 
        cursor3D.pvPos.x-=addX;
      }
      //------
      cursor3D.update();
      if (cursor3D.screenPos.y < mouseY) 
        cursor3D.pvPos.y+=addY;
      cursor3D.update();
      if (cursor3D.screenPos.y > mouseY) { 
        cursor3D.pvPos.y-=addY;
      }
      cursor3D.update();
      // -------
      // Leave? 
      if (dist(cursor3D.screenPos.x, cursor3D.screenPos.y, mouseX, mouseY) < 1) {
        break;
      }//if
      i++;
    }//while
    // println(i);
    break; 

  case stateEditTop:
    // x/z (mouseX is x (with cursor3D.screenPos.x) and mouseY is z (with cursor3D.screenPos.y) )
    // use camera here to make screenPos (screenX in the class) work!!!
    camera(camPosTop.x, camRadiusTop, camPosTop.z, 
      camPosTop.x, 0, camPosTop.z, 
      0, 0, 1);
    //  println("here");
    i=0; 
    addX=0;
    float addZ=0;
    while (i<3200) {
      if ( (dist(cursor3D.screenPos.x, 0, mouseX, 0) > 100)) {
        addX=100;
      } else {
        addX = 1;
      }
      if ( (dist(cursor3D.screenPos.y, 0, mouseY, 0) > 100)) {
        addZ=100;
      } else {
        addZ = 1;
      }
      //
      cursor3D.update();
      if (cursor3D.screenPos.x < mouseX) 
        cursor3D.pvPos.x+=addX;
      cursor3D.update();
      if (cursor3D.screenPos.x > mouseX) { 
        cursor3D.pvPos.x-=addX;
      }
      //------
      cursor3D.update();
      if (cursor3D.screenPos.y < mouseY) 
        cursor3D.pvPos.z+=addZ;
      cursor3D.update();
      if (cursor3D.screenPos.y > mouseY) { 
        cursor3D.pvPos.z-=addZ;
      }
      cursor3D.update();
      // -------
      // Leave? 
      if (dist(cursor3D.screenPos.x, cursor3D.screenPos.y, mouseX, mouseY) < 1) {
        break;
      }//if
      i++;
    }//while
    //    println(i);
    break; 

  case stateEditWest:
    // z/y : 
    // here mouseX changes z (with cursor3D.screenPos.x) and 
    //      mouseY changes y (cursor3D.screenPos.y) (because it's the view from west); 
    // use camera here to make screenPos (screenX in the class) work!!!
    camera(camRadiusWest, camPosWest.y, camPosWest.z, 
      0, camPosWest.y, camPosWest.z, 
      0, 1, 0);
    //println("here");
    i=0; 
    addX=0;
    addZ=0;
    while (i<3200) {
      if ( (dist(cursor3D.screenPos.x, 0, mouseX, 0) > 100)) {
        addZ=100;
      } else {
        addZ = 1;
      }
      if ( (dist(cursor3D.screenPos.y, 0, mouseY, 0) > 100)) {
        addY=100;
      } else {
        addY = 1;
      }
      //
      cursor3D.update();
      if (cursor3D.screenPos.x < mouseX) 
        cursor3D.pvPos.z+=addZ;
      cursor3D.update();
      if (cursor3D.screenPos.x > mouseX) { 
        cursor3D.pvPos.z-=addZ;
      }
      //------
      cursor3D.update();
      if (cursor3D.screenPos.y < mouseY) 
        cursor3D.pvPos.y+=addY;
      cursor3D.update();
      if (cursor3D.screenPos.y > mouseY) { 
        cursor3D.pvPos.y-=addY;
      }
      cursor3D.update();
      // -------
      // Leave? 
      if (dist(cursor3D.screenPos.x, cursor3D.screenPos.y, mouseX, mouseY) < 1) {
        break;
      }//if
      i++;
    }//while
    // println(i);
    break;
  }//switch
  //
}
//
