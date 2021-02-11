
// defining example points

void definePoints() {

  // defining example points - not necessary 

  PVector[] pvList = { 
    new PVector(15, 80, -110), 
    new PVector(10, 10, -120), 
    new PVector(90, 90, 0), 
    new PVector(85, 20, 0)   
  }; 

  listMyItem.add(new MyItem(pvList[0], color(255, 0, 0)));   // red
  listMyItem.add(new MyItem(pvList[1], color(0, 255, 0)));   // green
  listMyItem.add(new MyItem(pvList[2], color(0, 0, 255)));   // blue

  cursor3D = new MyItem(pvList[3], color(255, 255, 0));  // yellow
  cursor3D.myItemName="Cursor 3D";
  cursor3D.id=10000;
}//func 
//
