$fn=50;
use<../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>;
use <../Vitamins/Actuators/StandardServo/Servo_Connector_Vitamin.scad>;
use<../Vitamins/Fasteners/Screws/High_Low_Screw_Vitamin.scad>;
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/Encoder_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
use <../Vitamins/Tools/Standard_Extruder_Spacing_Vitamin.scad>;
use <../Vitamins/Tools/Filament_Vitamin.scad>;
use <ExtruderIdlerWheel.scad>;
use <Extruder_Encoder_Keepaway.scad>;

//core dimensions depend on the servo and filament.  

function ExtruderX(3dPrinterTolerance=.4) = StandardServoHeightAbvWings(.6)+FilamentDiam()+StandardServoNubHeight()+3dPrinterTolerance;
echo("ExtruderX is",(ExtruderX(.4)));
//function ExtruderY(3dPrinterTolerance=.4) = 

//counterbore screw module:
function CounterboreRad(3dPrinterTolerance=.4) = HiLoScrewHeadDiameter(3dPrinterTolerance)/2+.5;
module CounterboreScrew(3dPrinterTolerance=.4){
	union(){
		cylinder(h=HiLoScrewLength()/4, r=CounterboreRad(.4));
		rotate([0,180,0]){HiLoScrew();}
	}
}	


rotate([0,90,0])#StandardServoMotor(true,2,true,.4);