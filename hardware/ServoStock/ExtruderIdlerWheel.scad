use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
$fn=50;
function ExtruderIdlerWheelThickness() = 1.2;
function ExtruderIdlerWheelDiam(3dPrinterTolerance=.4) = 37+3dPrinterTolerance;
function ExtruderIdlerWheelInnerDiam(3dPrinterTolerance=.4) = ExtruderIdlerWheelDiam(3dPrinterTolerance)-1.5+3dPrinterTolerance;

//creates the Idler Wheel for Printing.  When you want to print the idler wheels, call this module!
module IdlerWheel(3dPrinterTolerance=.4){
	difference()
	{
		union()
		{
	//the shaft which holds the encoder magnet:
			cylinder(h=MagnetLength(3dPrinterTolerance), r=(608BallBearingInnerDiam(3dPrinterTolerance)/2)+.1);//needs to fit tightly in the bearing
			
				translate([0,0,MagnetLength(3dPrinterTolerance)-ExtruderIdlerWheelThickness(3dPrinterTolerance)/2])
				{
	//the idler wheel:				
					cylinder(ExtruderIdlerWheelThickness(3dPrinterTolerance),ExtruderIdlerWheelDiam(3dPrinterTolerance)/2,ExtruderIdlerWheelInnerDiam(3dPrinterTolerance)/2);
				}
	//the bearing offset spacer:
				translate([0,0,MagnetLength()+.2-ExtruderIdlerWheelThickness(3dPrinterTolerance)])//small fudge factor added here
				{
					cylinder(h=ExtruderIdlerWheelThickness(),r=(608BallBearingDiam(3dPrinterTolerance)/2+608BallBearingInnerDiam(3dPrinterTolerance)/2)/2);
				}			
		}
		translate([0,0,MagnetLength(3dPrinterTolerance)-.25]){rotate([0,180,0]){MagnetDraft(.4);}}
	}
}
//creates the Idler Wheel footprint for the extruder.
module IdlerWheelKeepaway(3dPrinterTolerance=.4){
		difference()
	{
		union()
		{
			cylinder(h=MagnetLength(3dPrinterTolerance), r=608BallBearingInnerDiam(-3dPrinterTolerance)/2);
			
				translate([0,0,MagnetLength(3dPrinterTolerance)-ExtruderIdlerWheelThickness(3dPrinterTolerance)/2])
				{
					cylinder(h=ExtruderIdlerWheelThickness(3dPrinterTolerance),r=(ExtruderIdlerWheelDiam(3dPrinterTolerance)/2)+.5);
				}
				translate([0,0,MagnetLength()-ExtruderIdlerWheelThickness(3dPrinterTolerance)])
				{
					cylinder(h=ExtruderIdlerWheelThickness(),r=(608BallBearingDiam(3dPrinterTolerance)/2+608BallBearingInnerDiam(3dPrinterTolerance)/2)/2);
				}			
		}
		translate([0,0,MagnetLength(3dPrinterTolerance)-.25]){rotate([0,180,0]){MagnetDraft(.4);}}
		
	}
}


translate([0,0,MagnetLength()+ExtruderIdlerWheelThickness()/2]){rotate([0,180,0]){IdlerWheel(.4);}}
//IdlerWheelKeepaway(.4);