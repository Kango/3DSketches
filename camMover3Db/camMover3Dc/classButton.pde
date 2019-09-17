
class Button {

  String txt = "";
  PVector pos = new PVector(0, 0); 

  // -----------------------------------------------------

  // constr
  Button(String txt_, 
    float x_, float y_) {
    // 
    txt = txt_;
    pos = new PVector(x_, y_);
  } // constr

  // -----------------------------------------------------

  void display(boolean isSelected) {

    // box 
    if (isSelected) {
      fill(229);
      stroke(0, 255, 0);
    } else { 
      fill(199);
      stroke(0);
    }
    rect (pos.x-9, pos.y-15, 
      41, 22);

    // text 
    fill(0);
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
