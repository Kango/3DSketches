
// tools 

int angleFrom( char s1 ) {
  // Wikipedia uses another notation for the 23 angles of the snake so we have to convert each angle
  if (s1=='0') return 180; 
  if (s1=='1') return 270;
  if (s1=='2') return 0;
  if (s1=='3') return 90;
  // error
  return 0;
} 
