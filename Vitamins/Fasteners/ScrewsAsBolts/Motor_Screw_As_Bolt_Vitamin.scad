//This is modelling a motor screw being used as a bolt, and it's got a thicker bit so that it can slide through one side of the grip and then grab onto the other

function MotorScrewBoltOuterDiameter(3dPrinterTolerance=.4) = 2.65 + 3dPrinterTolerance*2;
function MotorScrewBoltDiameter(3dPrinterTolerance=.4)= 1.9 + 3dPrinterTolerance*2;
function MotorScrewBoltLength(3dPrinterTolerance=.4)= 16.4 + 3dPrinterTolerance;
function MotorScrewBoltHeadDiameter(3dPrinterTolerance=.4)= 6.7 + 3dPrinterTolerance*2;
function MotorScrewBoltHeadHeight(3dPrinterTolerance=.4)= 1.7 + 3dPrinterTolerance;

//err on the side of larger tolerances for bolts

module MotorScrewBolt(3dPrinterTolerance=.4, PlasticWidth=4.2)
{
	union()
	{
		translate([0,0,-MotorScrewBoltLength(3dPrinterTolerance)])
		{
			union()
			{
				cylinder(h=MotorScrewBoltLength(3dPrinterTolerance),r=MotorScrewBoltDiameter(3dPrinterTolerance)/2, $fn=100);
				translate([0,0,MotorScrewBoltLength(3dPrinterTolerance)-(PlasticWidth+2)])
				{
					cylinder(h=PlasticWidth+2, r=MotorScrewBoltOuterDiameter(3dPrinterTolerance)/2, $fn=100);
				}
			}
		}
		cylinder(MotorScrewBoltHeadHeight(3dPrinterTolerance), MotorScrewBoltHeadDiameter(3dPrinterTolerance)/2,MotorScrewBoltHeadDiameter(3dPrinterTolerance)/2);
	}
}



MotorScrewBolt(.4,4.2);