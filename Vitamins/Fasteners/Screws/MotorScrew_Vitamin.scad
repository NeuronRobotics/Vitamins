//this is the small servo motor screw.
$fn=100;

module MotorScrew(3dPrinterTolerance){
	union(){
		cylinder(r=1.28+3dPrinterTolerance/2, h=9.25);	//the threads
		translate([0,0,9.25]){
			cylinder(r=5.3/2, h=2);	//the head
		}
	}
}

MotorScrew(.4);