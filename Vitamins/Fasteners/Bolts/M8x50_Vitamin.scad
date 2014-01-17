function M8x50BoltDiameter(3dPrinterTolerance=.4)= 8+3dPrinterTolerance;
function M8x50BoltLength(3dPrinterTolerance=.4)= 55.5+3dPrinterTolerance;
function M8x50BoltHeadDiameter(3dPrinterTolerance=.4)= 15+3dPrinterTolerance;
function M8x50BoltHeadHeight(3dPrinterTolerance=.4)= 6+3dPrinterTolerance;

//err on the side of larger tolerances for bolts

module M8x50Bolt(3dPrinterTolerance=.4)
{
	union()
	{
		translate([0,0,-M8x50BoltLength(3dPrinterTolerance)])
		{
			cylinder(h=M8x50BoltLength(3dPrinterTolerance),r=M8x50BoltDiameter(3dPrinterTolerance)/2, $fn=30);
		}
		cylinder(h=M8x50BoltHeadHeight(3dPrinterTolerance),r=M8x50BoltHeadDiameter(3dPrinterTolerance)/2, $fn=6);
	}
}

M8x50Bolt();
