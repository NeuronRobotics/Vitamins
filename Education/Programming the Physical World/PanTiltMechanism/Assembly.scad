use <CameraMount.scad>
use <TiltRingHolder.scad>
use <PanRingHolder.scad>


panRingHolder();
rotate([0,0,22])
	tiltRing();
translate([getPanRingRadius()+5,0,0])
	rotate([0,0,90])
		cameraTiltBar();