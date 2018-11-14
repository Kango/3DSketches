
String dateTimeStampShort() {
  // short version 
  return getDate() + "_" + getTime();
}

String dateTimeStampLong() {
  // long version 
  return getDateLong()
    + "_" 
    + getTimeLong();
}

//-----------------------------------------------------

String getTime() {
  return leadingZeros(hour()) 
    + leadingZeros(minute()) 
    + leadingZeros(second());
}

String getTimeLong() {
  return leadingZeros(hour()) 
    +":"+ leadingZeros(minute()) 
    +":"+ leadingZeros(second());
}

String getDate() {
  return leadingZeros(year()) 
    + leadingZeros(month()) 
    + leadingZeros(day());
}

String getDateLong() {
  return leadingZeros(year()) 
    +"/"+ leadingZeros(month()) 
    +"/"+ leadingZeros(day());
}

//-----

String leadingZeros(int a) {
  String Buffer;
  Buffer=nf(a, 2);
  return(Buffer);
}
