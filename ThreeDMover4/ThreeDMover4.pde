/*
 In this version you have the current box/sphere/folded triangle shape that you can move. 
 With Return you can add it to the list of all objects.
 This version makes use of a class Item3D and of objects that are stored in an ArrayList items. 
 For class and objects see tutorial:
 https : // www.processing.org/tutorials/objects/
 You need to install the library peasy cam: Menu | Import library | Add library.  */

// https : // forum.processing.org/two/discussion/27564/use-arrow-keys-to-pull-object-translate-keypresses-to-changes-in-x-y-and-z-rotation#latest
// with peasy : http://mrfeinberg.com/peasycam/

import peasy.PeasyCam;

PeasyCam cam;

String helpText = 
  "Use PeasyCam. Use wasd (x- and y-movement) and p/l (z-movement); r/g/b for colors, space bar to toggle object, RETURN to enter object to list.\n"
  +"Use x to switch this text on and off. \n"
  +"Peasycam: Use Mousewheel to zoom, double click to reset view. \n"
  +"The box you move has a white outline. An item that has been added to the list is gray and is marked with a gray box.\n"
  +"On adding to the list the placing box moves two units left. \ne to export. \n\n";

// ArrayLists for the class (stored items)
ArrayList<Item3D> items = new ArrayList(); 

// current item you can move and change (color and type)
Item3D currentItem; 

// help text on/off (with key x)
boolean showHelpText = true;

//----------------------------------------------------------------------------

void setup() {

  size(1200, 900, P3D);
  background(0);

  cam = new PeasyCam(this, 400); 

  initCurrentItem();
}//setup

void draw() {
  background(0);
  lights();

  // show stored items
  for (Item3D itemCurrent : items ) {
    itemCurrent.display( false );
  }

  // show current item  
  currentItem.display(true);

  // HUD ----------------------------------------
  cam.beginHUD(); 
  if (showHelpText) {
    fill(255); // white 
    text (helpText + "Current: " + currentItem.toStringXYZ(), 
      19, 19);
  }

  if (keyPressed)
    keyPressed_ForContinuousKeyinput();

  cam.endHUD();
}//draw
//
