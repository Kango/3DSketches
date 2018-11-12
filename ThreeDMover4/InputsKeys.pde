

void keyPressed_ForContinuousKeyinput() {

  // keyPressed for registering a key throughout  

  float translateStep = 4.0; 

  switch(key) {

  case 'w':
    currentItem.y-=translateStep;
    break; 

  case 'a':
    currentItem.x-=translateStep;
    break; 

  case 's':
    currentItem.y+=translateStep;
    break;

  case 'd':
    currentItem.x+=translateStep;
    break;

    // --

    // depth / z 
  case 'p':
    currentItem.z-=translateStep;
    break; 

  case 'l':
    currentItem.z+=translateStep;
    break;
    //
  }//switch
  //
}//func

// ----------------------------

void keyPressed() {

  // keyPressed for registering a single key only 

  switch(key) {
  case ' ':
    currentItem.type++;
    if (currentItem.type>2)
      currentItem.type=0;
    key=0;
    break;

  case RETURN:
  case ENTER:
    Item3D newBox = new Item3D (
      currentItem.x, 
      currentItem.y, 
      currentItem.z, 
      0, 
      currentItem.type, 
      currentItem.colBox ); 
    items.add(newBox); 
    currentItem.x-=currentItem.sizeBox*2;
    break;

    // ---
    //colors

  case 'r':
    currentItem.colBox=color(255, 0, 0);
    break;

  case 'g':
    currentItem.colBox=color(0, 255, 0);
    break;

  case 'b':
    currentItem.colBox=color(0, 0, 255);
    break;

    // --

  case 'x':
    showHelpText = !showHelpText; 
    break;

  case 'e':
    // println stored items
    println ( "{ \n    // x y z Type R G B " );
    for (Item3D itemCurrent : items ) {
      println ( "    {" + itemCurrent.toString() + "},") ;
    }//for
    println ( "}" );
    break;
  }//switch
  //
} //func
//
