
// Input keyboard 

// constants Num Block on the Keyboard 
//final int keyCodePgUp   = 33;
//final int keyCodePgDn   = 34;

//final int keyCodePos1   = 36;
//final int keyCodeEnd    = 35;

// ---------------------------------------------------------------------

void keyPressedThroughout() {

  // keys like wasd and cursor and ok and lp are registered throughout, meaning you can hold key down and it registers on and on (other than in keyPressed())

  if (!keyPressed)
    return; // leave

  // we check if keys are there that move the cursor3D
  if (cursor3D.keyInput())
    return; // if so, we leave
}//func 

// ---------------------------------------------------------------------

void keyPressed() {

  switch(state) {
    //
  case STATE_SPLASHSCREEN:
    state=stateHelp; 
    key=0; // kill ESC 
    break; 

  case stateHelp:
    // state help
    keyPressedForStateHelp();
    break;

  case stateWaitForSave:
  case stateWaitForLoad:
    // ignore 
    break; 

  case stateEditSouth:
  case stateEditTop:
  case stateEditWest:
    keyPressedForAllOtherStates();
    break;

  default:
    // Error 
    println("Error 9914: unknown state: "
      +state 
      +" ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    exit(); 
    break; 
    //
  }//switch
  //
}//func 

// ---------------------------------------------------------------------

void keyPressedForStateHelp() {

  switch(key) {

  case ESC:
    state=stateEditSouth;
    execute(5);
    key=0;
    break;

  default:
    state=stateEditSouth;
    execute(5);
    break;
  }//switch
}//func 

void keyPressedForAllOtherStates() {

  // eval all keys 
  switch(key) {

    // change edit modes ---- 

  case '1':
    execute(5);
    break;

  case '2':
    execute(6); 
    break;

  case '3':
    execute(7); 
    break;

    // other -------

  case 'e':
    // hamoid video export 
    if (videoExportIsOn) {
      videoExport.endMovie();
      exit();
    }
    break; 

  case ESC:
    panMode=false;
    zoomMode = false;
    key=0;
    break; 

  case 'h':
  case 'H':
    execute(8);
    break; 

  case BACKSPACE: 
    if (listMyItem.size()>0) {
      listMyItem.remove(listMyItem.size()-1);
    }
    break; 

  case ' ':
    // space bar: loop through states
    state++; 
    if (state>stateEditWest) {
      state=0;
    }
    startBigMessageBrief( stateText[state] ); 
    break; 

  case RETURN:
  case ENTER:
    //
    listMyItem.add(new MyItem(cursor3D.pvPos.copy(), color(0, 0, 255)));   //  blue
    break; 
    //
  }//switch
}//func 
// 
