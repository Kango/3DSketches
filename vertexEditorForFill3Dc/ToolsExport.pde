
// export as entire processing sketch 

void export() {

  // export 

  flagExported = false; 

  println("\n// -------------------------------"); 
  println("\n// " +  dateTimeStamp() ); 

  // step 1: show list of points as array ----

  println("\n// list of 3D points as PVectors\nPVector[] listPVector = {");

  String as1="";
  for (OnePoint onePoint : listPoints) {
    as1+=
      "   new PVector("
      +onePoint.pvOfClassOnePoint.x
      +", "
      +onePoint.pvOfClassOnePoint.y
      +", "
      +onePoint.pvOfClassOnePoint.z
      + "),\n";
  }//for  

  as1=stringWithoutCommaAtEnd(as1); 

  println(as1 + "\n}; \n");

  // step 2: show list of shapes as array ----

  println("// list of shapes with their indices\nint[][] shapes =  {");

  // all Shapes
  as1="";
  for (OneShape os : listShapes) {
    as1 += os.asString();
  }

  as1=stringWithoutCommaAtEnd(as1);

  println("  "+as1 + "\n};"); 

  println("\nfloat angleShape;"); 

  // step 3: setup and draw ----

  println("\nvoid setup() {"); 
  println("  size(880, 880, P3D);"); 
  println("  background(111);"); 
  println("} //func"); 
  println(""); 

  println("void draw() { "); 
  println("  background(111); "); 
  println("  lights(); "); 
  println("  drawShape1(); "); 
  println("} //func "); 
  println(""); 
  println("// -------------------------------------------\n"); 

  // step 4: function to use data  ----

  println("void drawShape1() {"); 

  println("  translate(width/2, 0);");
  println("  rotateY(angleShape);");
  println("  angleShape += 0.05; ");

  println("  stroke(0); " ); 
  println("  fill( 255, 0, 0); " ); 

  println("  // for each shape\n  for (int i=0; i < shapes.length; i++) {" ); 
  println("    beginShape();" ); 
  println("    // for each index in this shape\n    for (int i2=0; i2 < shapes[i].length; i2++) {" ); 
  println("      vertex( listPVector[ shapes[i][i2] ].x, " ); 
  println("              listPVector[ shapes[i][i2] ].y, " );
  println("              listPVector[ shapes[i][i2] ].z );" );
  println("    }//for" );
  println("    endShape(CLOSE); " );
  println("  }//for\n" );

  println("} //func"); 
  println("// -------------------------------");
} // func 
//