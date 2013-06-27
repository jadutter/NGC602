---------------------------------------------------------------------------------------
	The Input
---------------------------------------------------------------------------------------
I recieved JPEG images, and a spreadsheet of numbers representing the data taken for NGC-602. I'll discuss what I did with the images when I explain what I did in Inkscape. 
The data was formated fairly simply in an excel spreadsheet, and I needed to be able to use that data in OpenSCAD. On a hunch, I tried converting the excel file's sheets into Comma Separated Values. Once I had this, I was able to add brackets, and the other proper proper syntax by which I could copy and paste the values directly into the OpenSCAD file. 

---------------------------------------------------------------------------------------
	OpenSCAD
---------------------------------------------------------------------------------------
Once I had the data, in OpenSCAD, I formated what originally represented a sheet in the excel file as a matrix in the OpenSCAD file. I added commenting above each matrix to help with remembering what each column represented. 
From there I could then begin constructing the models. I made a module for the base, a generic plate, and an individual model for each plate. I also constructed various models for manipulating and representing the models (i.e. assembly). I put all my constants at the beginning, followed by the matrices, then the modules, and lastly at the very end of the code I specified what I wanted the program to render at a given moment. With the changes to scaling made so often, I eventually made a function that would input the spreadsheet value and output a value to be used by the object being rendered. Likewise, I added a variable called "fn" that allowed me to change the shapes of the objects used without having to search for it within the code itself. I had to make many arbitrary scaling and translational values to be sure that the objects fit onto the plate, and because I had issues with importing from Inkscape. 
I made a module called "bits" because I started off with simply making squares to represent the data, and the array reminded me of a low-res bitmap. 
I also created a module called "drawing" where I would import the different layers from Inkscape. For whatever reason, they were not imported at a 1:1 ratio this time. Rather than spend my time reasoning why, I spent my time fixing it with scaling and translation. I'd make a 10x10 square at the origin in Inkscape, a 10x10 in OpenSCAD, import the Inkscape file, and play with the scaling and translation until the cube from Inkscape overlaid the cube from OpenSCAD. I kept the arbitrary values that allowed me to maintain the 1:1 scale and used them on the drawings, while I deleted the cubes. Once I had this, I extruded the outlines of the features, and extruded the textured versions of the features on top. 
I did not have to write the code for the braille myself; I fortunately found a file someone had made for creating braille models, and utilized their file in my own. I imported their file at the start of my code. 
I created a variable called "type" for most of the modules so that I could have it switch between rendering the artistic version and the data version by simply adding a one or zero when I specified which object to render. 
When I wanted an object made, I'd specify which one at the end of the code, and export the STL file it made. 

---------------------------------------------------------------------------------------
	Inkscape
---------------------------------------------------------------------------------------
I imported the JPEGs and took them to be cropped such that their corners were all the same. I put each JPEG in it's own layer and added the title whatever- "source". I used Inkscapes ability to automatically trace an image to get the start of making outlines of these shapes. I then imported the image of the suggested textures for reference, and in hopes creating the textures directly from the image. Unfortunately, I was only able to use them as reference. 
To make the textured versions, I created an array of a given shape (triangle, circle, horizontal line), and did the intersection between it and the outline of a given feature. The original triangles that were closer in size to that of the sketch proved to be too small for the printer to print, and had to be later changed. 

---------------------------------------------------------------------------------------
	ReplicatorG
---------------------------------------------------------------------------------------
Once the STL files were made, I imported them into ReplicatorG where I could then generate the Gcode for the printers. I had to be careful though as I needed two specifiy which printer I would print from, and the lab currently has two of each, the Replicator and the Replicator 2x. If I specified the wrong printer, the object would be printed at a different scale than the others. 
