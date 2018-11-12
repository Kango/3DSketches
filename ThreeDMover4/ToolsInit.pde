

void initCurrentItem() {

  //  size items (change here AND in the class)
  float sizeBox = 70.0;

  float translatex=-sizeBox;
  float translatey=-sizeBox;
  float translatez=0;

  sizeBox = 0;

  int objectType = 0;

  color colCurrent=color(0, 0, 255);

  currentItem = new Item3D(
    translatex, 
    translatey, 
    translatez, 
    0, 
    objectType, 
    colCurrent
    );
}
//
