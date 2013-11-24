use <ExtruderIdlerWheel.scad>;
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
use <../Vitamins/Tools/Filament_Vitamin.scad>;
use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>;

$fn=50;

function wheelheight()= FilamentDiam()*2;

module MKIIwheel(3dPrinterTolerance=.4){
union()
{
	translate([0,0,-MagnetLength(.4)]){
		bearingshaft(.4);
	}
	cylinder(h=wheelheight(),r=(608BallBearingDiam(3dPrinterTolerance)/2+608BallBearingInnerDiam(3dPrinterTolerance)/2)/2);
}
}

MKIIwheel(.4);