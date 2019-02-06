
//

void keyPressed() {
  //
  switch(key) {
    // configs

  case ESC:
    // key=0;
    break; 

  case '0':
    // reset 
    for (int i = 0; i<24; i++) {
      snake.snakeParts.get(i).angle=180;
    }//for
    break; 

  case '1':
    config1(); 
    break; 

  case '2':
    config2();
    break; 

  case '3':
    config3();
    break; 

  case '4':
    config4();
    break; 

  case '5':
    config5();
    break; 

    // -------------------------------------------------------
    // directly chaninging snake parts

  case '+':
    snake.active++;
    if (snake.active>=snake.snakeParts.size())
      snake.active=snake.snakeParts.size()-1;
    break; 

  case '-':
    snake.active--;
    if (snake.active<=0)
      snake.active=0;
    break; 

  case ' ':
    // space bar
    snake.turnActive(); // rotate
    break;

    // ------------------------------------------------------------
    // states

  case 'a':
    state=1; 
    timer=millis(); 
    break; 

  case 'b':
    state=2; 
    timer=millis(); 
    break; 

  case 'n':
    state=0; // Normal 
    break; 

  case 'e':
    // export
    println ( "int[] list4 = { ");
    for (int i = 0; i<24; i++) {
      print( snake.snakeParts.get(i).angle + "," );
    } //for
    println("   };");
    break;
    //
  }//switch
  //
}//func 
//
