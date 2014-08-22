function DrillPressSpringHookDiameter(3dPrinterTolerance=.3)=3.6+3dPrinterTolerance;
function DrillPressSpringHookLength(3dPrinterTolerance=.3)=6+3dPrinterTolerance;
function DrillPressSpringWidth(3dPrinterTolerance=.3)=7+3dPrinterTolerance;
function DrillPressSpringThickness(3dPrinterTolerance=.3)=0.9+3dPrinterTolerance;





module DrillPressSpringHook(3dPrinterTolerance=.3)
{
	difference()
	{
		union()
		{
			cylinder(r=DrillPressSpringHookDiameter(3dPrinterTolerance)/2, h=DrillPressSpringWidth(3dPrinterTolerance), $fn=15);
			translate([-DrillPressSpringHookDiameter(3dPrinterTolerance)/2,0,0])
			{
				cube([DrillPressSpringHookDiameter(3dPrinterTolerance),DrillPressSpringHookLength(3dPrinterTolerance),DrillPressSpringWidth(3dPrinterTolerance)]);
			}
		translate([-DrillPressSpringHookDiameter(3dPrinterTolerance)/2,0,0])
			{
				%cube([DrillPressSpringThickness(3dPrinterTolerance),DrillPressSpringHookLength(3dPrinterTolerance)*3,DrillPressSpringWidth(3dPrinterTolerance)]);
			}
		}
		translate([0,0,-1])
		{
			cylinder(r=DrillPressSpringHookDiameter(3dPrinterTolerance)/2-DrillPressSpringThickness(3dPrinterTolerance), h=DrillPressSpringWidth(3dPrinterTolerance)+2, $fn=15);
		}
		translate([DrillPressSpringThickness()-DrillPressSpringHookDiameter(3dPrinterTolerance)/2,0,-1])
		{
			cube([DrillPressSpringHookDiameter(3dPrinterTolerance)-DrillPressSpringThickness(3dPrinterTolerance)*2,DrillPressSpringHookLength(3dPrinterTolerance)+1,DrillPressSpringWidth(3dPrinterTolerance)+2]);
		}
	}
}

DrillPressSpringHook();