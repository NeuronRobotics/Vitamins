use <CameraMount.scad>
use <../../../hardware/Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../../../hardware/Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>
use <../../../hardware/Vitamins/Sensors/Camera/QuickCam_STX.scad>

function getRingRadius(3dPrinterTolerance=.4) = getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth()*2;


module clearenceParts(3dPrinterTolerance=.4){
	union(){
		cameraTiltBar();
		cameraTiltServo();
		placeBearingPart(3dPrinterTolerance){
			608BallBearing(3dPrinterTolerance);		
		}
		placeBearingPart(3dPrinterTolerance){
		cylinder(	h=608BallBearingHeight(3dPrinterTolerance)*2,
					r=608BallBearingDiam(3dPrinterTolerance)/2-((getCamerabarWidth()*3)/10),
					center=false
					);	
		}
	}
}

module cameraPanServo(3dPrinterTolerance=.4, screwAlignment=0){
	translate([	0,
	           	-(getRingRadius(3dPrinterTolerance)),
				getCamerabarThickness()/2]){
				rotate([-90,90,0]){
					rotate([0,0,screwAlignment]){
						StandardServoMotor(true, 1, true, .4,8);
					}
				}
			}
}

module placePanBearing(3dPrinterTolerance=.4){
	translate([	0,
	           	getRingRadius(3dPrinterTolerance)-3dPrinterTolerance,
					getCamerabarThickness()/2]){
						rotate([-90,0,0]){
							for (i = [0 : $children-1]){
								 child(i);
							 }
						}
		}
}

module outerRing(3dPrinterTolerance=.4){
	union(){
		// ring section
		intersection(){
			cylinder(	h=getCamerabarThickness(),				//
									r=getRingRadius(3dPrinterTolerance), 	// 
									center=false);
			translate([0,0,getCamerabarThickness()/2]){
				difference(){
					sphere(getRingRadius(3dPrinterTolerance));
					sphere(getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth()+5);
				}
			}
		}
		// servo mount block
		translate([	-(StandardServoBoltHeight()+5+getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth() +5),
		           	-37.5,
		           (getCamerabarThickness()-StandardServoThickness())/2-5]){
			
			cube([	StandardServoBoltHeight()+5,
			      	StandardServoLength(),
			      	StandardServoThickness()+5]);
		}
		placePanBearing(3dPrinterTolerance){
			cylinder(	608BallBearingHeight(3dPrinterTolerance),
						608BallBearingInnerDiam(3dPrinterTolerance)/2,
						608BallBearingInnerDiam(3dPrinterTolerance)/2,
						false
						);
		}
	}
}

module tiltRing(3dPrinterTolerance=.4){
	difference(){
		outerRing(3dPrinterTolerance);
		clearenceParts(3dPrinterTolerance);
		cameraPanServo(screwAlignment=0);
	}
}

tiltRing();