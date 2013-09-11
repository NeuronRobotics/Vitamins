use <../../../hardware/Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../../../hardware/Vitamins/Sensors/Camera/QuickCam_STX.scad>
use <../../../hardware/Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>


function getCamerabarThickness()=25;
function getCamerabarWidth()=8;

module getBar(3dPrinterTolerance=.4){

	union(){
		intersection(){
				cylinder(	h=getCamerabarThickness(),				//
							r=getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth(), 	// 
							center=false);
				translate([0,0,getCamerabarThickness()/2])
					sphere(getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth());
			}
	}
}

module coreCameraBar(3dPrinterTolerance=.4){
	union(){

		difference(){
			getBar(3dPrinterTolerance);
			
			translate([0,-getQuickCamRadius(3dPrinterTolerance),getCamerabarThickness()/2]){
				rotate([-90,0,0]){
					QuickCam();
				}
			}
			translate([-(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness()),0,-1]){
				rotate([0,0,0]){
					cube([	(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2,
							(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2,
							(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2]);
				}
			}
			
			translate([	-(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness()),
						-(((getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2)+ (getQuickCamRadius(3dPrinterTolerance)+(getCamerabarThickness()/2))),
						-1]){
				rotate([0,0,0]){
					cube([	(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2,
							(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2,
							(getQuickCamRadius(3dPrinterTolerance)+getCamerabarThickness())*2]);
				}
			}
		}
		//Bearing brick
		translate([getQuickCamRadius(3dPrinterTolerance),
		           0,
		           getCamerabarThickness()/2]){
			rotate([0,90,0]){
				cylinder(	h=getCamerabarWidth(),				//
							r=608BallBearingDiam(3dPrinterTolerance)/2, 	// 
							center=false);
			}
		}
		//Servo Brick
		translate([-(getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth()),
		           0,
		           getCamerabarThickness()/2]){
					rotate([0,90,0]){
						cylinder(	h=getCamerabarWidth(),				//
									r=608BallBearingDiam(3dPrinterTolerance)/2, 	// 
									center=false);
					}
		}
		// Bearing rod
		placeBearingPart(3dPrinterTolerance){
				cylinder(	608BallBearingHeight(3dPrinterTolerance),
							608BallBearingInnerDiam(3dPrinterTolerance)/2,
							608BallBearingInnerDiam(3dPrinterTolerance)/2,
							false
							);
			
		}
	}
}

module placeBearingPart(3dPrinterTolerance=.4){
	translate([	getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth(),
					0,
					getCamerabarThickness()/2]){
						rotate([0,90,0]){
							for (i = [0 : $children-1]){
								 child(i);
							 }
						}
		}
}

module cameraTiltServo(3dPrinterTolerance=.4, screwAlignment=0){
	translate([	-(getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth()),
						0,
						getCamerabarThickness()/2]){
				rotate([0,90,0]){
					rotate([0,0,screwAlignment]){
						StandardServoMotor(true, 1, true, .4);
					}
				}
			}
}

module cameraTiltBar(3dPrinterTolerance=.4){
	difference(){
		coreCameraBar(3dPrinterTolerance);
		cameraTiltServo(3dPrinterTolerance,45);
	}
	
}

cameraTiltBar();