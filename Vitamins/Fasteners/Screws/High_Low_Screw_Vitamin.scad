function HiLoScrewDiameter(3dPrinterTolerance=.4)= 3.6+3dPrinterTolerance;  
function HiLoScrewLength(3dPrinterTolerance=.4)= 22+3dPrinterTolerance;
function HiLoScrewHeadDiameter(3dPrinterTolerance=.4)= 6.7+3dPrinterTolerance;
function HiLoScrewHeadHeight(3dPrinterTolerance=.4)= 2.5+3dPrinterTolerance;

//err on the side of smaller tolerances for screws

module HiLoScrew(3dPrinterTolerance=.4)
{
	union()
	{
		translate([0,0,-HiLoScrewLength(3dPrinterTolerance)])
		{
			cylinder(HiLoScrewLength(3dPrinterTolerance), HiLoScrewDiameter(3dPrinterTolerance)/2, HiLoScrewDiameter(3dPrinterTolerance)/2);
		}
		cylinder(HiLoScrewHeadHeight(3dPrinterTolerance), HiLoScrewHeadDiameter(3dPrinterTolerance)/2,HiLoScrewHeadDiameter(3dPrinterTolerance)/2);
	}
}

HiLoScrew();