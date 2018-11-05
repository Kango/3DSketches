

class OneShape {

  // Used for ArrayList<OneShape> listShapes. 

  // One shape has a different number of points. The points are stored as indices for the list listPoints.

  ArrayList<Integer> indices = new ArrayList(); 

  // no constructor

  void showOneShape(boolean highlightFlag) {

    beginShape(); 

    noFill();
    stroke(0);

    if (showFill) {
      if (!highlightFlag) {
        fill( 166, 121);
        stroke(199);
      } else {
        fill( 255, 0, 0, 66);
      }
    }

    // lines for current edges 
    for (int i = 0; i < indices.size(); i++) {
      if (indices.get(i)<listPoints.size())
        vertex( listPoints.get(indices.get(i)).pvOfClassOnePoint.x, 
          listPoints.get(indices.get(i)).pvOfClassOnePoint.y, 
          listPoints.get(indices.get(i)).pvOfClassOnePoint.z  );
    }//for

    endShape(CLOSE);
  }

  String asString() {

    // for export

    // empty?
    if (indices.size()<=0)
      return ""; // abort 

    String result = "  {"; 
    for (int i = 0; i < indices.size(); i++) {
      result +=  indices.get(i) + ", ";
    }

    result=stringWithoutComma(result);
    return result+"},\n";
  }

  String stringWithoutComma(String result) {

    result=result.trim(); 
    if (result.length()>0) {
      if (result.charAt(result.length()-1) == '\n' ) {
        result = result.substring (0, result.length()-1);
        result=result.trim(); 
        if (result.charAt(result.length()-1) == ',' )
          result = result.substring (0, result.length()-1);
      } else {
        result=result.trim(); 
        if (result.charAt(result.length()-1) == ',' )
          result = result.substring (0, result.length()-1);
      }
    }
    return result;
  }//method
  //
} // class
// 