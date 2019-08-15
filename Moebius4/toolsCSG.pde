

//https://stackoverflow.com/questions/56999816/is-it-possible-to-use-jcsg-library-with-processing
//https://discourse.processing.org/t/csg-constructive-solid-geometry/12693


// the PShape reference which will contain the converted 
PShape csgResult;

void initCSG() {

  // JCSG sample code:
  // we use cube and sphere as base geometries
  CSG cube = new Cube(2).toCSG();
  CSG sphere = new Sphere(1.25).toCSG();

  // perform difference 
  CSG cubeMinusSphere = cube.difference(sphere);  

  // Convert CSG to PShape -> Note: CSG units are small so we scale them up so the shapes are visible in Processing
  csgResult = CSGToPShape(cubeMinusSphere, 45);

  println("use mouse to  rotate");
}

//-----------------------------------------------------------------------------

// re-usable function to convert a CSG mesh to a Processing PShape
PShape CSGToPShape(CSG mesh, float scale) {
  // allocate a PShape group
  PShape csgResult = createShape(GROUP);
  // for each CSG polygon (Note: these can have 3,4 or more vertices)
  for (Polygon p : mesh.getPolygons()) {
    // make a child PShape
    PShape polyShape = createShape();
    // begin setting vertices to it
    polyShape.beginShape();
    // for each vertex in the polygon
    for (Vertex v : p.vertices) {
      // add each (scaled) polygon vertex 
      polyShape.vertex((float)v.pos.getX() * scale, (float)v.pos.getY() * scale, (float)v.pos.getZ() * scale);
    }
    // finish this polygon
    polyShape.endShape();
    //append the child PShape to the parent
    csgResult.addChild(polyShape);
  }
  return csgResult;
}
//
