//creates an extruder-specific encoder holder.  print two of these to effectively secure the encoder.

$fn=50;
use <../Vitamins/Sensors/Encoders/Encoder_Vitamin.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;
use <../Vitamins/Fasteners/Screws/High_Low_Screw_Vitamin.scad>;
use <Extruder.scad>;
use <ExtruderIdlerWheel.scad>;

function GripWidth(3dPrinterTolerance=.4)= 3+3dPrinterTolerance;
function GripLength(3dPrinterTolerance=.4)= EncoderHeight(3dPrinterTolerance)+(HiLoScrewDiameter(3dPrinterTolerance));
function GripHeight(3dPrinterTolerance=.4)= EncoderThickness(3dPrinterTolerance)*2;
function GripSpacing(3dPrinterTolerance=.4)= EncoderWidth(3dPrinterTolerance)-GripWidth(3dPrinterTolerance);

module ScrewRing(print=true,3dPrinterTolerance=.4)
{
	if (print==true)
	{
		difference()
		{
			cylinder(h=EncoderThickness(3dPrinterTolerance)*2, r=HiLoScrewDiameter(3dPrinterTolerance));
			translate([0,0,HiLoScrewLength(3dPrinterTolerance)/1.65]){HiLoScrew();}
		}
	}else{
		union()
		{
			cylinder(h=EncoderThickness(3dPrinterTolerance)*2, r=HiLoScrewDiameter(3dPrinterTolerance));
			translate([0,0,HiLoScrewLength(3dPrinterTolerance)/1.65]){HiLoScrew();}
		}
	}
}
//ScrewRing(true,.4);

module EncoderGrip(print=true,3dPrinterTolerance=.4)
{
	if (print==true)
	{
		difference()
		{
			union()
			{
				cube([GripLength(.4),GripWidth(.4),GripHeight(.4)]);
				translate([GripLength(.4)+HiLoScrewDiameter(3dPrinterTolerance)/2,GripWidth(.4)/2,0])
				{
					ScrewRing(true,.4);
				}
				translate([-HiLoScrewDiameter(3dPrinterTolerance)/2,GripWidth(.4)/2,0])
				{
					ScrewRing(true,.4);
				}
			}
			translate([HiLoScrewDiameter(.4)/2-.5,-EncoderHeight(3dPrinterTolerance)/2,-.5])
			{
				rotate ([0,0,0])
				{
					cube([EncoderHeight(3dPrinterTolerance)+1,EncoderWidth(3dPrinterTolerance), EncoderThickness(3dPrinterTolerance)+.5]);
				}
			}
		}				
	}else{
	difference()
		{
			union()
			{
				cube([GripLength(.4),GripWidth(.4),GripHeight(.4)]);
				translate([GripLength(.4)+HiLoScrewDiameter(3dPrinterTolerance)/2,GripWidth(.4)/2,0])
				{
					ScrewRing(false,.4);
				}
				translate([-HiLoScrewDiameter(3dPrinterTolerance)/2,GripWidth(.4)/2,0])
				{
					ScrewRing(false,.4);
				}
			}
			translate([HiLoScrewDiameter(.4)/2-.5,-EncoderHeight(3dPrinterTolerance)/2,-.5])
			{
				rotate ([0,0,0])
				{
					cube([EncoderHeight(3dPrinterTolerance)+1,EncoderWidth(3dPrinterTolerance), EncoderThickness(3dPrinterTolerance)+.5]);
				}
			}
		}	
	}
}
//EncoderGrip(true,.4);			
module EncoderHousing(print=true)
{
	if (print==true)
	{
		translate([-GripLength(.4)/2,GripSpacing(.4)/2,0])
		{
			EncoderGrip(true,.4);
		}

		translate([-GripLength(.4)/2,-GripSpacing(.4)/2,0])
		{
		EncoderGrip(true,.4);	
		}	
	}else{
		translate([-GripLength(.4)/2,GripSpacing(.4)/2,0])
		{
			EncoderGrip(false,.4);
		}

		translate([-GripLength(.4)/2,-GripSpacing(.4)/2,0])
		{
		EncoderGrip(false,.4);	
		}
	}
}
//TO PRINT:

translate([0,0,GripHeight(.4)]){mirror([0,0,1]){EncoderHousing(true);}}

//FOR EXTRUDER:
//EncoderHousing(false);


