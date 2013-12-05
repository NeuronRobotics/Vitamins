$fn=50;
use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>;
use <../Vitamins/Actuators/StandardServo/Servo_Connector_Vitamin.scad>;
use<../Vitamins/Fasteners/Screws/High_Low_Screw_Vitamin.scad>;
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/Encoder_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
use <../Vitamins/Tools/Standard_Extruder_Spacing_Vitamin.scad>;
use <../Vitamins/Tools/Filament_Vitamin.scad>;
use <../Vitamins/Electronics/Hot_Ends/PrintrBotJHeadHotEnd_Vitamin.scad>;
use <MKIIwheel.scad>;
use <Extruder_Encoder_Keepaway.scad>;

//ALIGNMENT TESTING:
ExtruderTop(.4);
//ExtruderBottom(.4);

//PRINTING:
//ExtruderBottom(.4);
translate([ExtruderX(.4)/2,0,ExtruderZ(.4)]){
	rotate([0,90,0]){
		//ExtruderTop(.4);
	}
}


//core dimensions depend on the servo and filament.  
function ExtruderX(3dPrinterTolerance=.4) = StandardServoHeightAbvWings(.6)+FilamentDiam()+StandardServoNubHeight()+HiLoScrewDiameter(.4)*2+3dPrinterTolerance;
echo("ExtruderX is",(ExtruderX(.4)));
function ExtruderY(3dPrinterTolerance=.4) = StandardServoLength()+HiLoScrewHeadHeight(.4)+3dPrinterTolerance;
echo("ExtruderY is",(ExtruderY(.4)));
function ExtruderZ(3dPrinterTolerance=.4) = StandardServoThickness()+FilamentDiam()+3dPrinterTolerance;
echo("ExtruderZ is",(ExtruderZ(.4)));
//###########################################################
//defining some standard vectors:

function SVHS() = [(ExtruderX(.4)+StandardExtruderSpacing())/2,ExFilZ(),-HiLoScrewLength()*4]; //Screw Vector Hinge Side

function SVFS() = [(ExtruderX(.4)-StandardExtruderSpacing())/2,ExFilZ(),-HiLoScrewLength()*4]; //Screw Vector Feed Side

function WheelVector() = [ExtruderX(.4)-StandardServoNubHeight()*2-FilamentDiam()/2,StandardServoWingsHeight()+StandardServoCylinderDist()+1.1,ExtruderZ(.4)+FilamentDiam()+.2];

function HingeTopVector() = [ExtruderX(.4)/2,HiLoScrewDiameter(.4)/2+1,ExtruderZ(.4)+HiLoScrewDiameter(.4)/2+1];

function HingeBottomVector() =[.9,HiLoScrewDiameter(.4)/2+1,ExtruderZ(.4)+HiLoScrewDiameter(.4)/2+1];

function PinTopVector() = [ExtruderX(.4)/2,ExtruderY(.4)-HiLoScrewHeadHeight(.4)*2+1,ExtruderZ(.4)+HiLoScrewDiameter(.4)/2+1];

function PinBottomVector() = [.9,ExtruderY(.4)-HiLoScrewHeadHeight(.4)*2+1,ExtruderZ(.4)+HiLoScrewDiameter(.4)/2+1];

function StandardServoVector() = [StandardServoNubHeight()+StandardServoHeightAbvWings()+FilamentDiam()/2,0,StandardServoThickness()/2+FilamentDiam()+.2];

function ExFilZ() = StandardServoThickness()/2+StandardServoNubDiam()+.4;//the height of the filament
function FilamentVector() = [ExtruderX(.4)/2,FilamentHeight()/2,ExFilZ()];

//###########################################################
//Thru-hole screw module:
module ThruholeScrew(3dPrinterTolerance=.4){
	rotate([0,0,0]){
		cylinder(h=HiLoScrewLength()*4,r=HiLoScrewDiameter(.4)/2);	
	}
}

//###########################################################
//alignment of the screws:
module ScrewPattern(3dPrinterTolerance=.4){
		translate(SVHS()){ThruholeScrew(.4);}
		translate(SVFS()){ThruholeScrew(.4);}
}
	
//###########################################################
//Hot End and its connecting screws:
module HEscrews(){
	union(){
		HotEnd(false,.4);
		translate([HotEndLength()-HotEndRecessOffset()+HiLoScrewDiameter(.4)/2,HotEndRecessDiam()+HiLoScrewDiameter(.4)/2,HiLoScrewLength()/2-.5]){
			HiLoScrew(.4);
		}
		mirror([0,1,0]){translate([HotEndLength()-HotEndRecessOffset()+HiLoScrewDiameter(.4)/2,HotEndRecessDiam()+HiLoScrewDiameter(.4)/2,HiLoScrewLength()/2-.5]){
			HiLoScrew(.4);
		}
		}
	}
}

//###########################################################
//hot end and carriage connector module:
module CarriageConnector(){
	difference(){
		translate([StandardExtruderSpacing()/2+ExtruderX(.4)-5,ExtruderY(.4),0]){
			rotate([0,0,90]){
				cube([HiLoScrewLength(.4)/2,StandardExtruderSpacing()+ExtruderX(.4)-10,ExtruderZ(.4)+4]);
			}
		}
		rotate([90,0,0]){
			ScrewPattern(.4);
		}
		translate([ExtruderX(.4)/2,HotEndLength()*2+HiLoScrewHeadHeight(.4)/2,ExFilZ()]){
			rotate([0,0,-90]){
				HEscrews();
			}
		}
	}
}

//###########################################################
//hinge module. Also serves as a pin:
module ExtruderHinge(){
	difference(){
		union(){
			translate([-HiLoScrewHeadDiameter(.4)/4+1,0,0]){
				cylinder(h=ExtruderX(.4)/2-.9,r=HiLoScrewDiameter(.4)/2+1);
			}
			translate([-1,-HiLoScrewDiameter(.4)/2-1,0]){
				cube([HiLoScrewDiameter(.4)/2+2,HiLoScrewDiameter(.4)+2,ExtruderX(.4)/2-.9]);
			}
		}
		translate([-1,0,HiLoScrewLength(.4)/2+1]){HiLoScrew(.4);}
	}
}

//###########################################################
//Fillet dimensions:
pad = 0.1;
tHk = HiLoScrewDiameter(.4)+2;
fPer = HiLoScrewDiameter(.4)/2;
fRad = HiLoScrewDiameter(.4)*2;

//###########################################################
//Fillet:
module HingeFillet(){
	difference(){
		translate([-pad,-pad,-pad]){
			cube([fRad,fRad,ExtruderX(.4)/2+1]);
		}
		translate([fRad-.25,fRad-.25,-(pad*2)]){
			cylinder(h=ExtruderX(.4)/2+2,r=HiLoScrewDiameter(.4)/1.5+pad);
		}
	}
}

//###########################################################	
//channel for bearing:
module BearingChannel(3dPrinterTolerance=.4){
	union(){
		translate([0,-608BallBearingDiam()/2-1,0]){
			cube([608BallBearingDiam(.4),608BallBearingDiam(.4)+2,StandardServoThickness()]);
		}
		cylinder(h=StandardServoThickness(), r=608BallBearingDiam(3dPrinterTolerance)/2+1);
	}
}

//###########################################################
//The extruder bottom.  This includes the servo,screws, hot end, and filament subtractions:
module ExtruderBottom(3dPrinterTolerance=.4){
	difference(){
			union(){
				cube([ExtruderX(.4),ExtruderY(.4),ExtruderZ(.4)]);
				translate(HingeBottomVector()){
					rotate([0,90,0]){
						ExtruderHinge(.4);
					}	
				}
				translate(PinBottomVector()){
					rotate([0,90,0]){
						ExtruderHinge(.4);
					}
				}
				CarriageConnector();
			}
		translate([0,StandardServoWingsHeight()+StandardServoCylinderDist()+1.1,0]){
			translate(StandardServoVector()){
				rotate([0,90,0]){StandardServoMotor(true,2,true,.4);}}	//Servo
			translate([StandardServoHeightAbvWings()/2+FilamentDiam()*2,0,608BallBearingDiam()-2]){								rotate([0,-90,180]){BearingChannel();}}//The opening for the top half/idler wheel to fit
			translate(FilamentVector()){rotate([90,0,0]){Filament();}}//The Filament
		}
	}
}

//###########################################################
//The extruder top.  This is the mount for the Idler Wheel, bearing, and encoder:
module ExtruderTop(3dPrinterTolerance=.4){
difference(){
	union(){
		translate([ExtruderX(.4)/2+608BallBearingHeight(.4)/2-offsetheight(),0,ExtruderZ(.4)]){								cube([ExtruderX(.4)/2-3,ExtruderY(.4)-HiLoScrewHeadHeight(.4)/2,ExtruderZ(.4)]);
		}
		translate(HingeTopVector()){
			rotate([0,90,0]){
				ExtruderHinge();
			}
		}
		translate(PinTopVector()){
			rotate([0,90,0]){
				ExtruderHinge();
			}
		}
	}
	union(){
		translate(WheelVector()){
			rotate([180,90,0]){
				MKIIwheel(.4);
			}
		}
		translate(WheelVector()){
			translate([offsetheight(),0,0]){
				rotate([180,90,0,]){
					608BearingKeepaway(.4);
				}
			}
		}
		translate(WheelVector()){
			translate([MKIIwheelheight(),0,0]){
				rotate([180,90,0]){
					cylinder(h=MagnetLength(),r=608BallBearingInnerDiam(.4)/2);
				}
			}
		}
	}
	translate(HingeTopVector()){
		translate([HiLoScrewLength(.4),0,1]){
			rotate([0,-90,0]){
				ThruholeScrew(.4);
			}
		}
	}
	translate(PinTopVector()){
		translate([HiLoScrewLength(.4),0,1]){
			rotate([0,-90,0]){
				ThruholeScrew(.4);
			}
		}
	}
	translate(WheelVector()){
		translate([ExtruderX(.4)/2-2.3,0,0]){
			rotate([180,-90,0]){
				rotate(a=-90,v=[0,0,1]){
					Encoder(true);
				}
			}
		}
	}
	translate(HingeTopVector()){
		translate([0,-fRad,-fRad]){
			rotate([90,0,90]){
				#HingeFillet();
			}
		}
	}
}
} 

