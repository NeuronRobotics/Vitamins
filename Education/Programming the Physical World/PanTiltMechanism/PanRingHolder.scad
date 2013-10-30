use <CameraMount.scad>
use <TiltRingHolder.scad>
use <../../../hardware/Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../../../hardware/Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>
use <../../../hardware/Vitamins/Sensors/Camera/QuickCam_STX.scad>

function getPanRingRadius(3dPrinterTolerance=.4) = getRingRadius(3dPrinterTolerance)+getCamerabarWidth()+2;

module standLeg(){
	cube([25,100,10]);
}

module mainPanRing(3dPrinterTolerance=.4){
	intersection(){
		translate([0,-getPanRingRadius(3dPrinterTolerance),-.5]){
				cube([getPanRingRadius(3dPrinterTolerance)*2,getPanRingRadius(3dPrinterTolerance)*2,getCamerabarThickness()]);
		}
		translate([0,0,getCamerabarThickness()/2]){
			difference(){
				sphere(getPanRingRadius(3dPrinterTolerance));
				sphere(getRingRadius(3dPrinterTolerance)+4);
			}
		}
	}
	
	
	//Bearing brick
	translate([0,
	           getPanRingRadius(3dPrinterTolerance)-2.4,
	           getCamerabarThickness()/2]){
		rotate([90,90,0]){
			cylinder(	h=getCamerabarWidth()-2.4,				//
						r=getCamerabarThickness()/2, 	// 
						center=false);
		}
	}
	//Bearing brick
	translate([-getCamerabarThickness()/2,
			   -getPanRingRadius(3dPrinterTolerance)+2,
			  0]){
					cube([	getCamerabarThickness(),
							getCamerabarWidth()-3,
							getCamerabarThickness()]);
	}
	//Servo Brick
	translate([0,
	           -(getPanRingRadius(3dPrinterTolerance)-getCamerabarWidth() ),
	           StandardServoThickness()/2]){
		rotate([90,90,0]){
			translate([	-getCamerabarThickness()/2,
			           	(-getCamerabarThickness()/2)-3.5,
						-1.5]){
						union(){
							cube([	StandardServoThickness()+5,
									StandardServoLength(),
									StandardServoBoltHeight()+5]);
							//stand
							translate([0,0,60])
								rotate([0,0,0])
									standLeg();
							
							translate([25,0,60])
								rotate([0,0,90])
									standLeg();
							
							//support struts
							translate([17,0,0])
								rotate([90,0,90])
									cube([70,70,10]);
							
							translate([0,70,-25])
								rotate([90,0,0])
									cube([25,90,6]);
						}
			}
		}
	}
}

module panRingHolder(3dPrinterTolerance=.4){
	
	difference(){
		mainPanRing(3dPrinterTolerance);
		placePanBearing(3dPrinterTolerance){
			608BallBearing(3dPrinterTolerance+.5);		
		}
		#cameraPanServo(3dPrinterTolerance, 0);
	}
}

panRingHolder();
