
// commands from the buttons 

void execute (int cmdID ) {

  switch (cmdID) {

  case 0: 
    // Pan 
    //toggle
    panMode = 
      ! panMode;
    zoomMode = false;
    buttons.get(3).isSelected = panMode;
    buttons.get(4).isSelected = false;
    buttons.get(5).isSelected = false;
    peasyCamera.setActive(false);
    break; 

  case 1:
    // Zoom
    // toggle 
    if (zoomMode) {
      panMode   = false;
      zoomMode = false;
      buttons.get(3).isSelected = false;
      buttons.get(4).isSelected = false;
      buttons.get(5).isSelected = false;
      peasyCamera.setActive(false);
    } else {
      // switch it on 
      panMode   = false;
      zoomMode = true;
      buttons.get(3).isSelected = false;
      buttons.get(4).isSelected = true;
      buttons.get(5).isSelected = false;
      peasyCamera.setActive(false);
    }//else 
    break; 

  case 2: 
    // Peasy cam
    panMode  = false;
    zoomMode = false;
    buttons.get(3).isSelected = false;
    buttons.get(4).isSelected = false;
    buttons.get(5).isSelected = false;
    // toggle 
    if (peasyCamera.isActive()) { 
      peasyCamera.setActive(false);
      buttons.get(5).isSelected = false;
    } else { 
      buttons.get(5).isSelected = true;
      peasyCamera.setActive(true);
      buttons.get(0).isSelected = false;
      buttons.get(1).isSelected = false;
      buttons.get(2).isSelected = false;
    }
    break; 

    // ----------------------------------------------------------

  case 3:
    //load (init) / Open
    panMode    = false;
    zoomMode  = false;  
    fileToLoad = ""; 
    // we tell the load folder and file extension
    selectInput("Select a file to load:", "fileSelectedLoad", dataFile("*.txt"));
    state = stateWaitForLoad;  
    break; 

  case 4: 
    // save (init)
    panMode    = false;
    zoomMode  = false;
    fileToSave = ""; 
    // we tell the save folder and file extension
    selectOutput("Select a file to write to:", "fileSelectedSave", dataFile("*.txt"));
    state = stateWaitForSave;
    break;

    // ----------------------------------------------------------

  case 5:
    //South
    peasyCamera.setActive(false);
    state=stateEditSouth;
    startBigMessageBrief( stateText[state] ); 
    buttons.get(0).isSelected = true;
    buttons.get(1).isSelected = false;
    buttons.get(2).isSelected = false;
    //
    peasyCamera.setActive(false);
    buttons.get(5).isSelected = false;
    break;

  case 6:
    //Top
    peasyCamera.setActive(false);
    state=stateEditTop;
    startBigMessageBrief( stateText[state] );
    buttons.get(0).isSelected = false;
    buttons.get(1).isSelected = true;
    buttons.get(2).isSelected = false;
    //
    peasyCamera.setActive(false);
    buttons.get(5).isSelected = false;
    break;

  case 7: 
    //West
    peasyCamera.setActive(false);
    state=stateEditWest;
    startBigMessageBrief( stateText[state] ); 
    buttons.get(0).isSelected = false;
    buttons.get(1).isSelected = false;
    buttons.get(2).isSelected = true;
    //
    peasyCamera.setActive(false);
    buttons.get(5).isSelected = false;
    break;

    // ----------------------------------------------------------

  case 8:
    // Help
    panMode  = false;
    zoomMode = false;
    buttons.get(3).isSelected = false;
    buttons.get(4).isSelected = false;
    state    = stateHelp;
    break;

    // ----------------------------------------------------------

  default:
    //Error 
    println("Error 4729 in execute() command +++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
    exit();
    break;
  }//switch
}//func
//
