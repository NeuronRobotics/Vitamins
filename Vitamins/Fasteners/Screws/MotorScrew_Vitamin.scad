//this is the small servo motor screw.
$fn=100;

function MSheaddiam()=5.3;
function MSheadheight()=2;
function MSthreaddiam()=2.7;
function MSthreadheight()=9.25;

module MotorScrew(3dPrinterTolerance){
	union(){
		cylinder(r=MSthreaddiam()/2-3dPrinterTolerance/2, h=MSthreadheight());	//the threads
		translate([0,0,MSthreadheight()]){
			cylinder(r=MSheaddiam()/2, h=MSheadheight());	//the head
		}
	}
}

MotorScrew(.4);