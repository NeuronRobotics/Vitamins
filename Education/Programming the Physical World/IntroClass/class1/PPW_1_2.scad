

//This is my first varialbe
myFirstVariable = 2; 
//This is my second, definced as 2 times the first
mySecondVariable = myFirstVariable * 2;

echo(myFirstVariable);

echo(mySecondVariable);


translate([0,0,0]){
	rotate([90,0,0]){
		cube([myFirstVariable,mySecondVariable,1]);
	}
}

translate([0,mySecondVariable,0]){
	rotate([90,0,0]){
		cube([myFirstVariable,mySecondVariable,1]);
	}
}

translate([0,0,0]){
	rotate([0,0,0]){
		cube([myFirstVariable,mySecondVariable,1]);
	}
}

