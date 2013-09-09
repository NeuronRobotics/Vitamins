//This is an example of the basic shapes and how to move them around

sphere(50);

move = 30;

translate([move,move,move]){
	sphere(50);
}

translate([-100,-100,-100]){
	cube([50,50,50]);
}

translate([100,100,-100]){
	cylinder(100,50,25,false);
}

