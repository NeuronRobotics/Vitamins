myWord =5;

mySecondVariable = myWord*2;
myFudgeVarable = 2;

echo(myWord);

echo(mySecondVariable);



translate([0,0,0]){
	rotate([90,0,0]){
		cube([myWord,mySecondVariable,1]);
	}
}

translate([0,mySecondVariable,0]){
	rotate([90,0,0]){
		cube([myWord,mySecondVariable,1]);
	}
}

translate([0,0,0]){
	rotate([0,0,0]){
		
		cube([myWord,mySecondVariable,1]);
	}
}


translate([0,0,mySecondVariable]){
	rotate([45,0,0]){
		translate([0,-myFudgeVarable,0]){
			cube([myWord,mySecondVariable,1]);						}
		
	}
}

translate([0,mySecondVariable,mySecondVariable]){
	rotate([-45,0,0]){
		translate([0,-(mySecondVariable+myFudgeVarable),0]){
			cube([myWord,mySecondVariable,1]);						}
		
	}
}

