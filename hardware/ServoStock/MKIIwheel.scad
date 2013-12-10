use <ExtruderIdlerWheel.scad>;
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
use <../Vitamins/Tools/Filament_Vitamin.scad>;
use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>;

$fn=50;

function wheelheight()= FilamentDiam()*2;
function offsetheight()= .75;
function offsetdiam() = 9;
function MKIIwheelheight() = wheelheight()+offsetheight()+MagnetLength(.4);

module MKIIwheel(){
	union()
	{
		translate([0,0,-MagnetLength(.4)-offsetheight()]){
			bearingshaft(.4);
		}
		translate([0,0,-offsetheight()]){
			cylinder(h=offsetheight(),r=offsetdiam()/2);
		}
		cylinder(h=wheelheight(),r=(608BallBearingDiam(.4)/2+608BallBearingInnerDiam(.4)/2)/2);

	//the 608 bearing
		translate([0,0,-MKIIwheelheight()+608BallBearingHeight(.4)/2]){
			608BallBearing(.4);
		}
	}
}


translate([0,0,wheelheight()])
{
	rotate([0,180,0])
	{
		//MKIIwheel(.4);
	}
}

module MKIIwheelprint(){
	translate([-offsetdiam()*2,offsetdiam(),wheelheight()]){
		rotate([0,180,0]){	
			union(){
				translate([0,0,-MagnetLength(.4)-offsetheight()]){
					bearingshaft(.4);
				}
				translate([0,0,-offsetheight()]){
					cylinder(h=offsetheight(),r=offsetdiam()/2);
				}
				cylinder(h=wheelheight(),r=(608BallBearingDiam()/2+608BallBearingInnerDiam()/2)/2);
			}
		}
	}
}
MKIIwheelprint();