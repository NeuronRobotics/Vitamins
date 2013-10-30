use <CameraMount.scad>
use <TiltRingHolder.scad>
use <PanRingHolder.scad>
difference(){
	intersection(){
		union(){
			translate([-20,30,-1]){
				union(){
					panRingHolder();
					rotate([0,0,22])
						tiltRing();
					rotate([0,0,5])
						translate([getPanRingRadius()+5,0,0])
							rotate([0,0,90])
								cameraTiltBar();
				}
			}
		}

		translate([-80,-100,-10]){
			cube([200,200,10]);
		}
	}
}
