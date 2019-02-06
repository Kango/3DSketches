
// those configurations have been made by the program itself. Use export function and copy / paste here. 

void config1() {
  int[] list1 = {
    180, 
    180, 
    180, 
    180, 
    180, 
    270, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180, 
    270, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180, 
    180
  };
  for (int i = 0; i<24; i++) {
    snake.snakeParts.get(i).angle = list1[i];
  }//for
}

void config2() {
  int[] list2 = {
    270, 
    180, 
    270, 
    90, 
    90, 
    270, 
    270, 
    90, 
    270, 
    90, 
    90, 
    270, 
    90, 
    270, 
    270, 
    90, 
    90, 
    270, 
    270, 
    90, 
    270, 
    90, 
    90, 
    270
  };
  for (int i = 0; i<24; i++) {
    snake.snakeParts.get(i).angle = list2[i];
  }//for
}

void config3() {
  int[] list3={
    180, 
    180, 
    180, 
    180, 
    180, 
    270, 
    180, 
    180, 
    180, 
    180, 
    90, 
    180, 
    180, 
    180, 
    90, 
    180, 
    180, 
    0, 
    180, 
    180, 
    90, 
    180, 
    180, 
    180
  };
  for (int i=0; i<24; i++) {
    snake.snakeParts.get(i).angle = list3[i];
  }//for
}

/*
 https://de.wikipedia.org/wiki/Rubik%E2%80%99s_Snake
 
 example ThreePeaks 
 10012321211233232123003
 
 example Cat  
 02202201022022022000000
 */

void config4() {
  // Three Peaks
  // Here the String contains the config
  String  ThreePeaks="10012321211233232123003";
  // we read the String
  for (int i=0; i<ThreePeaks.length(); i++) {
    snake.snakeParts.get(i+1).angle = angleFrom( ThreePeaks.charAt(i) );
  }//for
}

void config5() {
  // Cat
  // Here the String contains the config
  String  cat="02202201022022022000000";
  // we read the String
  for (int i=0; i<cat.length(); i++) {
    snake.snakeParts.get(i+1).angle = angleFrom( cat.charAt(i) );
  }//for
}
//
