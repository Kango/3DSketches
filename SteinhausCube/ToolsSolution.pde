
// tab for show solution (loading a pre-calculated solution and display it)
// called by drawForStateShowSolution() and related 

void loadSolutionFile() {

  // load cube

  mainCube.clear();
  simulationCube.clear();
  String name1 = alFiles.get(alFiles_i).getName();
  if (name1.length()>4) {
    if (name1.substring(name1.length()-4).equals(".txt")) { 
      mainCube.load(name1);
      alFileName=name1;
    } else {
      alFileName="could not read";
    }
  }
}//func

ArrayList<File> getFiles() {

  // returns a file list 

  ArrayList<File> alResult=new ArrayList(); 

  // https://docs.oracle.com/javase/7/docs/api/java/io/File.html 
  // https://stackoverflow.com/questions/1158777/rename-a-file-using-java

  File f = dataFile(sketchPath("")); 

  File fileName1 = new File(sketchPath("")+fileNameSolutionGlobal1);  
  alResult.add(fileName1);

  for (File fileName : f.listFiles()) {
    if (fileName.getName().indexOf(".txt")>2) {
      alResult.add(fileName);
    }//if
  } // for 

  println ("Found " + alResult.size() + " files.");

  return alResult;
}//func 

String ejectStatus() {

  // returns a String that represents the eject-status of all 6 pieces in the solution view 

  String result=""; 

  for (boolean b : explodeViewAllowed) {
    if (b)
      result+="y ";
    else
      result+="n ";
  }//for

  return result;
}//func
//
