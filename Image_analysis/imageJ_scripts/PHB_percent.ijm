// "PHB percent area"
//
// This macro batch processes all the files in a folder and any
// subfolders in that folder. 
// Adapted from the default ImageJ "BatchProcessFolders" macro (https://imagej.nih.gov/ij/macros/)

   requires("1.33s"); 
   dir = getDirectory("Choose a Directory ");
   setBatchMode(true);
   count = 0;
   countFiles(dir);
   n = 0;
   processFiles(dir);
   //print(count+" files processed");
   
   function countFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              countFiles(""+dir+list[i]);
          else
              count++;
      }
  }

   function processFiles(dir) {
      list = getFileList(dir);
      for (i=0; i<list.length; i++) {
          if (endsWith(list[i], "/"))
              processFiles(""+dir+list[i]);
          else {
             showProgress(n++, count);
             path = dir+list[i];
             processFile(path);
          }
      }
  }

  function processFile(path) {
       if (endsWith(path, ".czi")) {
       	   print(path);
       	   split_path = split(path, "\\");
       	   split_size = split_path.length;
       	   title = split_path[split_size - 1];
       	   run("Bio-Formats Importer", "open=["+path+"] split_channels");
	   // Select lipid channel for cell outline finding
           selectWindow(title+" - C=2");
		   setOption("ScaleConversions", true);
 		   run("8-bit");
           run("Auto Local Threshold", "method=Bernsen radius=15 parameter_1=0 parameter_2=0 white");
           run("Despeckle");
           run("Dilate");
           run("Dilate");
	   // Select PHB channel to evaluate overlap with cell outline
           selectWindow(title+" - C=1");
           setOption("ScaleConversions", true);
           run("8-bit");
           run("Auto Local Threshold", "method=Bernsen radius=15 parameter_1=0 parameter_2=0 white");
           run("Despeckle");
           selectWindow(title+" - C=2");
           run("Analyze Particles...", "size=0.50-15.00 circularity=0.20-1.00 display clear overlay add");
           selectWindow(title+" - C=1");
           roiManager("multi-measure measure_all");
           saveAs("Results", path+"_results.csv");
	   // Save composite image
           run("Merge Channels...", "c1=["+title+" - C=2] c3=["+title+" - C=1] create keep");
           saveAs("PNG", path+"_composite.png");
           close();
           run("Clear Results");
           run("Close");
      }
  }
