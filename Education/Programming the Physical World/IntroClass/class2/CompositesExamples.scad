
//these are examples for the composites

module myCuttingTool(distance=5,trenchThickness=5){
	translate([distance,distance,distance]){
		sphere(50);
	}
	#cylinder(100,10,10,true);
	difference(){
		cylinder(trenchThickness,55,55,true);
		cylinder(trenchThickness,45,45,true);
	}
}


module myExample(){

	difference(){
		sphere(50);
		myCuttingTool(distance=55,trenchThickness=5);
	}
}

myExample();