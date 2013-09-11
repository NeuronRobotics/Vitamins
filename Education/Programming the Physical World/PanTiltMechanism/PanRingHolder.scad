use <CameraMount.scad>
use <TiltRingHolder.scad>
use <../../../hardware/Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../../../hardware/Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>
use <../../../hardware/Vitamins/Sensors/Camera/QuickCam_STX.scad>

function getPanRingRadius(3dPrinterTolerance=.4) = getRingRadius(3dPrinterTolerance)+getCamerabarWidth();

module panRingHolder(3dPrinterTolerance=.4){
	difference(){
		intersection(){
			cylinder(	h=getCamerabarThickness(),				//
						r=getPanRingRadius(3dPrinterTolerance), 	// 
						center=false);
			translate([0,0,getCamerabarThickness()/2]){
				difference(){
					sphere(getPanRingRadius(3dPrinterTolerance));
					sphere(getRingRadius(3dPrinterTolerance)+2);
				}
			}
		}
		translate([0,-getPanRingRadius(3dPrinterTolerance),-.5])
			cube([getPanRingRadius(3dPrinterTolerance)*2,getPanRingRadius(3dPrinterTolerance)*2,getCamerabarThickness()+1]);
	}
	//#tiltRing(.3);
}

panRingHolder();