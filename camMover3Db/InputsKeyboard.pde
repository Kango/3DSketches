
void keyPressed() {
  switch(key) {

  case '0':
    state=stateShowMovie;
    break; 

  case '9':
    state=stateShowMovieWithBeziers;
    break; 

  case '1':
    state=stateEditSouth;
    break;

  case '2':
    state=stateEditTop;
    break;

  case '3':
    state=stateEditWest;
    break;

  case 's':
    // save (init)
    fileToSave=""; 
    selectOutput("Select a file to write to:", "fileSelectedSave");
    state=stateWaitForSave;
    break;

  case 'l':
    //load (init)
    fileToLoad=""; 
    selectInput("Select a file to process:", "fileSelectedLoad");
    state=stateWaitForLoad;  
    break; 

  case 'h':
    state=stateHelp; 
    break; 

  case ESC:
    state=stateEditSouth;
    key=0;
    break; 
    //
  }//switch
}//func 
// 
