

class Button {

  String txt = "";
  PVector pos = new PVector(0, 0); 
  float w=91, h=22;
  int id=0; 
  boolean isSelected=false; 

  // -----------------------------------------------------

  // constr
  Button(String txt_, 
    float x_, float y_, 
    int id_) {
    // 
    txt = txt_;
    pos = new PVector(x_, y_);
    id=id_;
  } // constr

  // -----------------------------------------------------

  void displayButton() {

    // box 
    if (isSelected) {
      fill(229);
      stroke(0, 255, 0);
    } else { 
      fill(199);
      stroke(0);
    }
    rect (pos.x, pos.y, 
      w, h);

    // text 
    fill(0);
    text(txt, 
      pos.x+9, pos.y+15);
  }

  boolean mouseNear() {
    return 
      mouseX>pos.x&&
      mouseX<pos.x+w&&
      mouseY>pos.y&&
      mouseY<pos.y+h;
  }
  //
}//class
//
