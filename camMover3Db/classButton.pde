
class Button {

  String txt="Pan";
  PVector pos = new PVector( width-62, 32); 

  // no constr 

  void display() {
    text(txt, 
      pos.x, pos.y);
  }

  boolean mouseNear() {
    return 
      dist(mouseX, mouseY, pos.x, pos.y) < 33;
  }
  //
}//class
//
