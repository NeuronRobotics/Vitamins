use <CameraMount.scad>
use <TiltRingHolder.scad>
use <PanRingHolder.scad>


panRingHolder();

translate([getPanRingRadius()*2+5,0,0])
	tiltRing();

cameraTiltBar();