
// ----------------------------------------------------------------------
// Tools date and time

String dateTimeStamp() {
  // short version 
  return getDate() + ", " + getTime();
}

String getDate() {
  return leadingZeros(year()) 
    + "/"+leadingZeros(month()) 
    + "/"+leadingZeros(day());
}

String getTime() {
  return leadingZeros(hour()) 
    + ":"+leadingZeros(minute()) 
    + ":"+leadingZeros(second());
}

String leadingZeros(int a) {
  String Buffer; 
  Buffer=nf(a, 2); 
  return(Buffer);
}
//
