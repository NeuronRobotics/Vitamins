use <../../../hardware/Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../../../hardware/Vitamins/Sensors/Camera/QuickCam_STX.scad>
use <../../../hardware/Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>

//QuickCam();

//StandardServoMotor(true, 1, false, .4);

function getCamerabarThickness()=20;
function getCamerabarWidth()=10;

module coreCameraBar(3dPrinterTolerance=.4){
	union(){
		difference(){
			cylinder(	getCamerabarThickness(),				//
						getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth(), 	// 
				 		getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth(), 	// 
				 		false);
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
		translate([getQuickCamRadius(3dPrinterTolerance),0,0]){
			cube([	getCamerabarWidth(),
					getCamerabarThickness()/2,
					getCamerabarThickness()]);
		}
		//Servo Brick
		translate([-(getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth()),-getCamerabarThickness()/2,0]){
			cube([	getCamerabarWidth(),
					getCamerabarThickness(),
					getCamerabarThickness()]);
		}
		// Bearing rod
		translate([	getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth(),
					0,
					getCamerabarThickness()/2]){
			rotate([0,90,0]){
				cylinder(	608BallBearingHeight(3dPrinterTolerance)*2,
							608BallBearingInnerDiam(3dPrinterTolerance)/2,
							608BallBearingInnerDiam(3dPrinterTolerance)/2,
							false
							);
			}
		}
	}
}

module cameraTiltBar(3dPrinterTolerance=.4){
	difference(){
		coreCameraBar(3dPrinterTolerance);
		translate([	-(getQuickCamRadius(3dPrinterTolerance)+getCamerabarWidth()),
					0,
					getCamerabarThickness()/2]){
			rotate([0,90,0]){
				rotate([0,0,45]){
					StandardServoMotor(true, 1, true, .4);
				}
			}
		}
	}
	
}

cameraTiltBar();