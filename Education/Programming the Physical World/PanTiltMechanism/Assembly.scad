use <CameraMount.scad>
use <TiltRingHolder.scad>
use <PanRingHolder.scad>
difference(){
	difference(){
		union(){
			translate([0,0,-3.2]){
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
		}
		translate([-100,-100,-10]){
			cube([200,200,10]);
		}
	}
}