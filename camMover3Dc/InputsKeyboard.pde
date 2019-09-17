
// Input keyboard 

void keyPressed() {

  switch(state) {
    //
  case stateHelp:
    // state help
    keyPressedForStateHelp();
    break;

  default:
    // all other states
    keyPressedForAllOtherStates();
    break;
  }//switch
  //
}//func 

// ---------------------------------------------------------------------

void keyPressedForStateHelp() {

  switch(key) {

  case ESC:
    state=stateEditSouth;
    key=0;
    break;

  default:
    state=stateEditSouth;
    break;
  }//switch
}//func 

void keyPressedForAllOtherStates() {

  switch(key) {

    // camera moves modes ---- 

  case '0':
    state=stateShowMovie;
    break; 

  case '9':
    state=stateShowMovieWithBeziers;
    break; 

  case '8':
    state=stateShowMovieLookingAhead;
    break; 

    // edit modes ---- 

  case '1':
    state=stateEditSouth;
    break;

  case '2':
    state=stateEditTop;
    break;

  case '3':
    state=stateEditWest;
    break;

    // other -------

  case ESC:
    panMode=false;
    holdRight = false;
    key=0;
    break; 

  case 'h':
  case 'H':
    panMode   = false;
    holdRight = false;
    state     = stateHelp; 
    break; 

  case ' ':
    // space bar
    state++; 
    if (state>stateShowMovieLookingAhead) {
      state=0;
    }
    break; 

    // save and load ---

  case 's':
    // save (init)
    panMode    = false;
    holdRight  = false;
    fileToSave = ""; 
    // we tell the save folder and file extension
    selectOutput("Select a file to write to:", "fileSelectedSave", dataFile("*.txt"));
    state = stateWaitForSave;
    break;

  case 'l':
    //load (init)
    panMode    = false;
    holdRight  = false;  
    fileToLoad = ""; 
    // we tell the load folder and file extension
    selectInput("Select a file to load:", "fileSelectedLoad", dataFile("*.txt"));
    state = stateWaitForLoad;  
    break; 

    // video export ---

  case 'v':
    // video recording start (manually)
    videoExport.startMovie();
    videoExportIsOn = true;
    break;

  case 'e':
    // end video recording (manually)
    videoExport.endMovie();
    videoExportIsOn = false;
    break; 

  case RETURN:
  case ENTER:
    // start and stop video recording automatically
    recordMovieAfterEnter=true;  // key has pressed -> true
    // When we are not in any movie state 
    if (state!=stateShowMovieWithBeziers&&
      state!=stateShowMovie&&
      state!=stateShowMovieLookingAhead) {
      //set state 
      state=stateShowMovie;
    }//if
    // reset (recording doesn't start right away but at the beginning of the curve)
    recordMovieAfterEnterHasStarted=false; // we indicate that the recording hasn't started yes -> false 
    videoExportIsOn = false;   // no recording 
    break; 
    //
  }//switch
}//func 
// 
