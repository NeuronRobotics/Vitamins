use <CameraMount.scad>
use <TiltRingHolder.scad>
use <PanRingHolder.scad>
difference(){
	union(){
		panRingHolder();
		rotate([0,0,22])
			tiltRing();
		translate([getPanRingRadius()+5,0,0])
			rotate([0,0,90])
				cameraTiltBar();
	}
	translate([-100,-100,-5]){
		cube([200,200,5]);
	}
}