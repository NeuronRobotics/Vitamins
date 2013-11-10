$fn=50;
use <../Vitamins/Electronics/Hot_Ends/PrintrBotJHeadHotEnd_Vitamin.scad>;
use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>;
use <../Vitamins/Actuators/StandardServo/Servo_Connector_Vitamin.scad>;
use <../Vitamins/Fasteners/Screws/High_Low_Screw_Vitamin.scad>;
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/Encoder_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
use <../Vitamins/Tools/Standard_Extruder_Spacing_Vitamin.scad>;
use <../Vitamins/Tools/Filament_Vitamin.scad>;
use <ExtruderIdlerWheel.scad>;
use <Extruder_Encoder_Keepaway.scad>;

//core dimensions of the part depend on the screw, servo, and servo connector.  Width is based on the standard platform fastener distance.  Parameterize when possible.

function ExtruderLength(3dPrinterTolerance=.4) = StandardServoLength(3dPrinterTolerance)+HiLoScrewLength(3dPrinterTolerance)/2+2*ConnectorLength(3dPrinterTolerance);
echo("Extruder Length is", ExtruderLength(.4));
function ExtruderHeight(3dPrinterTolerance=.4) = HiLoScrewLength(3dPrinterTolerance)/2;
echo("Extruder Height is",ExtruderHeight(.4));
function ExtruderWidth(3dPrinterTolerance=.4) = StandardExtruderSpacing()+9*FilamentDiam(.4);
echo("Extruder Width is", ExtruderWidth(.4));

function HEscrewvector(3dPrinterTolerance=.4) = [ExtruderLength(.4)/2-CounterboreRad(.4)-1.5,-HotEndDiam()/2-HiLoScrewDiameter(.4)/4,-HiLoScrewHeadHeight(.4)];
function IdlerVector(3dPrinterTolerance=.4) = [ExtruderIdlerWheelDiam()/2.5,-ExtruderIdlerWheelDiam()/2-FilamentDiam()/4,ExtruderHeight(3dPrinterTolerance)/2-ExtruderIdlerWheelThickness(3dPrinterTolerance)-.5];
function CounterboreRad(3dPrinterTolerance=.4) = HiLoScrewHeadDiameter(3dPrinterTolerance)/2+.5;

//counterbore screw module:
module CounterboreScrew(3dPrinterTolerance=.4){
	union(){
		cylinder(h=HiLoScrewLength()/4, r=CounterboreRad(.4));
		rotate([0,180,0]){HiLoScrew();}
	}
}	

//Creating the basic extruder block
module ExtruderBlock(3dPrinterTolerance=.4)
{
	difference(){
		translate([-ExtruderLength()/2,-ExtruderWidth()/1.8,0]){cube([ExtruderLength(.4),ExtruderWidth(.4),ExtruderHeight(.4)]);}
//weight reduction: 
		translate([-ExtruderHeight()-ExtruderIdlerWheelDiam(),-ExtruderIdlerWheelDiam()-FilamentDiam()*2,-1]){cylinder(h=ExtruderHeight(.4)+2,r=ExtruderIdlerWheelDiam(.4));}
		translate([-ExtruderLength()/2-1,-ExtruderWidth()/2,-ExtruderHeight()/2+4]){cube([ExtruderHeight()+2,ExtruderWidth(),ExtruderHeight()+4]);}
		translate([-ExtruderLength()/2-HiLoScrewLength()/1.5,ExtruderWidth()/2-ExtruderHeight()+2,-2]){cube([ExtruderLength(),ExtruderWidth()/4,ExtruderHeight()+4]);}
		//translate([CounterboreRad(.4)*2,ExtruderWidth()-ExtruderIdlerWheelDiam()+1,-1]){cylinder(h=ExtruderHeight()+2,r=ExtruderWidth()/2.5-2);}
//Counterbored screw holes:
		translate([ExtruderLength()/2-ExtruderIdlerWheelDiam(.4)/5,ExtruderWidth()/2-HiLoScrewHeadDiameter(.4)*2,-.1]){CounterboreScrew(.4);}
		translate([ExtruderLength(.4)/2-ExtruderIdlerWheelDiam(.4)/5,-ExtruderWidth()/2+HiLoScrewHeadDiameter(.4)/3,-.1]){CounterboreScrew(.4);}
		translate([-ExtruderLength()/1.5+ExtruderIdlerWheelDiam(.4),ExtruderWidth()/2-HiLoScrewHeadDiameter(.4)*2,-.1]){CounterboreScrew(.4);}
		translate([-ExtruderLength()/2+ExtruderIdlerWheelDiam(),-ExtruderWidth()/2+StandardServoThickness()/1.5,-.1]){CounterboreScrew(.4);}
//The 608 Bearing.  commented out cube is for cross-section examination
		translate([ExtruderIdlerWheelDiam()/2.5,-ExtruderIdlerWheelDiam()/2,MagnetLength()-ExtruderIdlerWheelThickness()*3+1]){cylinder(h=608BallBearingHeight(3dPrinterTolerance)+ExtruderIdlerWheelThickness(),r=(608BallBearingDiam()+.04)/2);}
		translate([ExtruderIdlerWheelDiam()/2.5,-ExtruderIdlerWheelDiam()/2,ExtruderHeight()/2-ExtruderIdlerWheelThickness()*2.5]){608BallBearing();}
		//translate([0,-ExtruderWidth()/2-608BallBearingDiam(3dPrinterTolerance)/5,-ExtruderHeight()]){cube([100,20,100]);}
//the hot end and its securing screws:
		translate([ExtruderWidth()/2,0,ExtruderHeight()]){HotEnd(true,.4);}
		#translate(HEscrewvector(.4)){CounterboreScrew(.4);}
		#mirror ([0,1,0]){translate(HEscrewvector()){CounterboreScrew(.4);}}

//the filament channel:
		rotate([0,90,0]){translate([-ExtruderHeight(),0,-ExtruderLength()/2-2]){Filament();}}
		rotate([0,90,0]){translate([-ExtruderHeight(),0,-ExtruderLength()/2-2]){cylinder(FilamentHeight()/4,FilamentDiam()*4,FilamentDiam()/2);}}
//Tool Plate connector Screws:
		translate([ExtruderLength()/2+HiLoScrewLength()/2,-ExtruderWidth()/2+HotEndDiam()/2,ExtruderHeight()]){rotate([0,90,0]){HiLoScrew();}}
		mirror([0,0,1]){translate([ExtruderLength()/2+HiLoScrewLength()/2,StandardExtruderSpacing()/2,-ExtruderHeight()]){rotate([0,90,0]){HiLoScrew();}}}
//The Idler Wheel Recess:
		translate(IdlerVector(.4)){IdlerWheelKeepaway(.4);}
//The Idler Wheel (use for adjusting the filament and servo locations):
		translate(IdlerVector(.4)){IdlerWheel(.4);}
//The thru hole for the idler wheel:
		translate([ExtruderIdlerWheelDiam()/2.5,-ExtruderIdlerWheelDiam()/2,-1]){cylinder(h=MagnetLength(3dPrinterTolerance)*2, r=608BallBearingInnerDiam(-3dPrinterTolerance)/2);}
//The hole for the servo connector:
		translate([-ExtruderIdlerWheelDiam(3dPrinterTolerance)/4-1,-StandardServoThickness()/2-1,ConnectorLength()/2]){rotate([0,90,90]){ServoConnector(.4);}}
	}
}


//Removing feature elements from block. The boolean creates either a servo side or an encoder side.

module Extruder(servo=true, 3dPrinterTolerance=.4)
{
	if(servo==true){
		difference(){
			ExtruderBlock(.4);
			rotate([0,0,-9]){translate([ExtruderIdlerWheelDiam()/2.5-.5,StandardServoNubDiam()*1.35-FilamentDiam(),StandardServoHeightAbvWings()*2-ExtruderIdlerWheelThickness()-.25]){rotate([0,0,-90]){StandardServoMotor(true,2,true,.4);}}}
		}
	}else{
		difference(){
			ExtruderBlock(.4);
//The Encoder
			translate([ExtruderIdlerWheelDiam()/2.5,-ExtruderIdlerWheelDiam()/2,-.001]){rotate([0,180,0]){Encoder(false);}}
//The Support Housing
			translate([ExtruderIdlerWheelDiam()/2.5-HiLoScrewDiameter(.4)/2,-GripLength(.4)/2+HiLoScrewDiameter(.4)/2,-.001]){rotate([180,0,90]){EncoderHousing(false);}}
//Extra space for the servo nub
			translate([ExtruderIdlerWheelDiam()/2.5,StandardServoNubDiam()/2+FilamentDiam()/2.5,StandardServoNubHeight()]){rotate([0,180,-90]){StandardServoMotor(false,2,true,.4);}}
		}
	}
}

//ExtruderBlock(.4);

translate([ExtruderLength(.4)/2,0,0]){mirror([1,0,0]){Extruder(true,.4);}}

translate([ExtruderLength(.4)/2,ExtruderWidth(.4),0]){Extruder(false,.4);}
				
			

