//this is the small servo motor screw.
$fn=100;

headdiam=5.3;
headheight=2;
threaddiam=2.7;
threadheight=9.25;

module MotorScrew(3dPrinterTolerance){
	union(){
		cylinder(r=threaddiam/2-3dPrinterTolerance/2, h=threadheight);	//the threads
		translate([0,0,threadheight]){
			cylinder(r=headdiam/2, h=headheight);	//the head
		}
	}
}

MotorScrew(.4);