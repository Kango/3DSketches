
// buttons 

void initButtons() {

  // buttons 
  int yStart = 40;
  final int yAdd   = 30; 

  // IDs 5 to 7 ! 
  buttons.add(new Button("South", width-102, yStart + 0 * yAdd, 5 )); 
  buttons.add(new Button("Top", width-102, yStart + 1 * yAdd, 6) ); 
  buttons.add(new Button("West", width-102, yStart + 2 * yAdd, 7));

  // gap
  yStart+=20; 
  buttons.add(new Button("Pan", width-102, yStart + 3 * yAdd, 0 )); 
  buttons.add(new Button("Zoom", width-102, yStart  + 4 * yAdd, 1) ); 
  buttons.add(new Button("Peasy Cam", width-102, yStart + 5 * yAdd, 2));

  // gap
  yStart+=20; 
  buttons.add(new Button("Open", width-102, yStart + 6 * yAdd, 3)); 
  buttons.add(new Button("Save", width-102, yStart + 7 * yAdd, 4));

  // gap
  yStart+=20; 
  buttons.add(new Button("Help", width-102, yStart + 8 * yAdd, 8));
}//func 
//
