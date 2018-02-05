// This is a quick and dirty macro to construct my submission for the new ImageJ logo.
// The logo is built from circular and rectangular ROIs which can be combined using the ROI Manager in ImageJ.

// Set the base unit. This will be the width (in pixels) of the i character in the logo.
base_unit = 100;

// You can enter fixed values for the canvas here, so long as the final logo will fit!
// The final width of logo will be 2.1 * base_unit and the final height of logo will be 4.3 * base_unit.
// Here we also add 0.5 * base_unit as a padding around the logo:
canvas_width = 2.6 * base_unit;
canvas_height = 4.8 * base_unit;

// Create a new blank RGB image
newImage("Untitled", "RGB white", canvas_width, canvas_height, 1);

// the center of the logo will be in the center of the image
x_origin = canvas_width / 2;
y_origin = canvas_height / 2;

// Begin!
setBatchMode("hide"); 

// -------------------------------------------------
// Build the i character
// -------------------------------------------------

// Create the rounded bottom of the base of the i character
shape_diameter = 1.0 * base_unit;
offset_x = -0.55 * base_unit;
offset_y = 0.55 * base_unit;
shape_x = offset_x + x_origin - shape_diameter / 2; // top left corner
shape_y = offset_y + y_origin - shape_diameter / 2; 
makeOval(shape_x, shape_y, shape_diameter, shape_diameter);
roiManager("Add");

// Create the rectangular top of the base of the i character
my_width = 1.0 * base_unit;
my_height = 1.6 * base_unit;
offset_x = -0.55 * base_unit;
offset_y = -0.25 * base_unit;
shape_x = offset_x + x_origin - (my_width / 2);
shape_y = offset_y + y_origin - (my_height / 2);
makeRectangle(shape_x, shape_y, my_width, my_height);
roiManager("Add");

// Combine the two shapes to make the base of the i character
roiManager("Select", newArray(0, 1));
roiManager("Combine");
roiManager("Add");
roiManager("Select", 2);
roiManager("Rename", "i-base");

// Delete the original shapes from the ROI Manager which we no longer need
roiManager("Deselect");
roiManager("Select", 1);
roiManager("Delete");
roiManager("Select", 0);
roiManager("Delete");

// Add the dot to the i character
shape_diameter = 1.0 * base_unit;
offset_x = -0.55 * base_unit;
offset_y = -1.65 * base_unit;
shape_x = offset_x + x_origin - shape_diameter / 2; // top left corner
shape_y = offset_y + y_origin - shape_diameter / 2; 
makeOval(shape_x, shape_y, shape_diameter, shape_diameter);
roiManager("Add");
roiManager("Select", 1);
roiManager("Rename", "i-top");

// Fill the i character
roiManager("Select", newArray(0, 1));
setForegroundColor(0, 150, 255);
roiManager("Fill");
roiManager("Deselect");

// -------------------------------------------------
// Build the j character
// -------------------------------------------------

// Create the rectangular top of the base of the j character
my_width = 1.0 * base_unit;
my_height = 1.6 * base_unit;
offset_x = 0.55 * base_unit;
offset_y = -0.25 * base_unit;
shape_x = offset_x + x_origin - (my_width / 2);
shape_y = offset_y + y_origin - (my_height / 2);
makeRectangle(shape_x, shape_y, my_width, my_height);
roiManager("Add");
roiManager("Select", 2);
roiManager("Rename", "j-base-rectangle");

// Create the curve of the base of the j character

// The outer curve circle
shape_diameter = 3.2 * base_unit;
offset_x = -0.55 * base_unit;
offset_y = 0.55 * base_unit;
shape_x = offset_x + x_origin - shape_diameter / 2; // top left corner
shape_y = offset_y + y_origin - shape_diameter / 2; 
makeOval(shape_x, shape_y, shape_diameter, shape_diameter);
run("Make Inverse");
roiManager("Add");

// The inner curve circe
shape_diameter = 1.2 * base_unit;
offset_x = -0.55 * base_unit;
offset_y = 0.55 * base_unit;
shape_x = offset_x + x_origin - shape_diameter / 2; // top left corner
shape_y = offset_y + y_origin - shape_diameter / 2; 
makeOval(shape_x, shape_y, shape_diameter, shape_diameter);
roiManager("Add");

// Subtract the inner circle from the out circle
roiManager("Select", newArray(3, 4));
roiManager("Combine");
run("Make Inverse");
roiManager("Add");
roiManager("Select", 5);
roiManager("Rename", "j-base-curve");

// Delete the j-curve circles which we no longer need
roiManager("Select", 4);
roiManager("Delete");
roiManager("Select", 3);
roiManager("Delete");

// Draw a square ROI to crop the j-curve
my_width = 1.6 * base_unit;
my_height = 1.6 * base_unit;
offset_x = 0.25 * base_unit;
offset_y = 1.35 * base_unit;
shape_x = offset_x + x_origin - (my_width / 2);
shape_y = offset_y + y_origin - (my_height / 2);
makeRectangle(shape_x, shape_y, my_width, my_height);
roiManager("Add");

// Keep the intersection of the j-curve with the square ROI
roiManager("Select", newArray(3, 4));
roiManager("AND");
roiManager("Add");
roiManager("Select", 5);
roiManager("Rename", "j-curve");

// Delete the shapes we don't need any more
roiManager("Select", 4);
roiManager("Delete");
roiManager("Select", 3);
roiManager("Delete");

// Add the rounded end of the j-base
shape_diameter = 1.0 * base_unit;
offset_x = -0.55 * base_unit;
offset_y = 1.65 * base_unit;
shape_x = offset_x + x_origin - shape_diameter / 2; // top left corner
shape_y = offset_y + y_origin - shape_diameter / 2; 
makeOval(shape_x, shape_y, shape_diameter, shape_diameter);
roiManager("Add");

roiManager("Select", newArray(2, 3, 4));
roiManager("Combine");
roiManager("Add");
roiManager("Select", 5);
roiManager("Rename", "j-base");

// delete the other shapes we no longer need
roiManager("Select", 4);
roiManager("Delete");
roiManager("Select", 3);
roiManager("Delete");
roiManager("Select", 2);
roiManager("Delete");

// Add the dot to the j character
shape_diameter = 1.0 * base_unit;
offset_x = 0.55 * base_unit;
offset_y = -1.65 * base_unit;
shape_x = offset_x + x_origin - shape_diameter / 2; // top left corner
shape_y = offset_y + y_origin - shape_diameter / 2; 
makeOval(shape_x, shape_y, shape_diameter, shape_diameter);
roiManager("Add");
roiManager("Select", 3);
roiManager("Rename", "j-top");

// fill the j character
roiManager("Select", newArray(2, 3));
setForegroundColor(255, 204, 0);
roiManager("Fill");
roiManager("Deselect");

// finish up
setBatchMode("exit and display");
