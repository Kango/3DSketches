
// tab for states of the program

void stateNormal() {

  // snake 
  snake.display();

  // HUD 
  camera.beginHUD();
  noLights();
  fill(255);
  textFont(fontSmall);
  textMode(MODEL);
  text("Use +/- to change active element (green) \n"
    +"Use Space Bar to rotate active element \n"
    +"Use 0 to reset \nUse 1..5 for configurations\n"
    +"Use e for export (with exported data you can implement new configurations)\nUse a/b for animations (n normal state) ", 
    22, height-105);
  camera.endHUD();
}

void stateANIMATION_TRANSITION_TO_SPHERE() {
  // animation tries to achieve the sphere (from the snake)  

  // snake display
  snake.display();

  int[] list1 = {
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
  // 
  if (millis()-timer>800) {
    if (snake.snakeParts.get(i).angle != list1[i]) {
      int[] a1={ 0, 90, 180, 270 };
      snake.snakeParts.get(i).angle = a1[ int (random(4)) ];
      timer=millis(); // reset timer
    }
    i++;
    if (i>=24)
      i=0;

    // if snake is completed (identical with list1 values)
    if (snake.snakeComplete(list1)) {
      state=0;
    }
  }
  //
}

void stateANIMATION_RANDOM_MOVES() {
  // random game 
  // snake display 
  snake.display();
  if (millis()-timer>800) {
    int[] a1={ 0, 90, 180, 270 };
    snake.snakeParts.get(i).angle = a1[ int (random(4)) ];
    timer=millis();
  }
  i++;
  if (i>=24)
    i=0;
}//func
//
