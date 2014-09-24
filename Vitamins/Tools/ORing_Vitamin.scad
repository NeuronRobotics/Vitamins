//This is a large rubber o-ring, used primarily in the wormtown extruder wheel.
$fn=100;

function ORinnerdiam()=47;
function ORdiam()=5.4;

module ORing(){
	rotate_extrude(convexity = 10)
		translate([ORinnerdiam()/2+ORdiam()/2,0,0])
			circle(r=ORdiam()/2);
}

ORing();