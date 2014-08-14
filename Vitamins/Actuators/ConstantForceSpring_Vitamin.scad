//part 9293K19 from http://www.mcmaster.com/#constant-force-springs/=t8izj1

function mm(inches)=inches*25.4;

function ConstantForceSpringOuterDiameter()=mm(1.53);
function ConstantForceSpringInnerDiameter()=mm(1.36);
function ConstantForceSpringWidth()= mm(0.625);
function ConstantForceSpringScrewHoleDiameter()=mm(0.196);



















//depreciated but useful for constant force springs ending in hooks rather than holes for screws

function ConstantForceSpringHookDiameter(3dPrinterTolerance=.3)=3.6+3dPrinterTolerance;
function ConstantForceSpringHookLength(3dPrinterTolerance=.3)=6+3dPrinterTolerance;
function ConstantForceSpringHookWidth(3dPrinterTolerance=.3)=7+3dPrinterTolerance;
function ConstantForceSpringHookThickness(3dPrinterTolerance=.3)=0.9+3dPrinterTolerance;





module ConstantForceSpringHook(3dPrinterTolerance=.3)
{
	difference()
	{
		union()
		{
			cylinder(r=ConstantForceSpringHookDiameter(3dPrinterTolerance)/2, h=ConstantForceSpringHookWidth(3dPrinterTolerance), $fn=15);
			translate([-ConstantForceSpringHookDiameter(3dPrinterTolerance)/2,0,0])
			{
				cube([ConstantForceSpringHookDiameter(3dPrinterTolerance),ConstantForceSpringHookLength(3dPrinterTolerance),ConstantForceSpringHookWidth(3dPrinterTolerance)]);
			}
		translate([-ConstantForceSpringHookDiameter(3dPrinterTolerance)/2,0,0])
			{
				%cube([ConstantForceSpringHookThickness(3dPrinterTolerance),ConstantForceSpringHookLength(3dPrinterTolerance)*3,ConstantForceSpringHookWidth(3dPrinterTolerance)]);
			}
		}
		translate([0,0,-1])
		{
			cylinder(r=ConstantForceSpringHookDiameter(3dPrinterTolerance)/2-ConstantForceSpringHookThickness(3dPrinterTolerance), h=ConstantForceSpringHookWidth(3dPrinterTolerance)+2, $fn=15);
		}
		translate([ConstantForceSpringHookThickness()-ConstantForceSpringHookDiameter(3dPrinterTolerance)/2,0,-1])
		{
			cube([ConstantForceSpringHookDiameter(3dPrinterTolerance)-ConstantForceSpringHookThickness(3dPrinterTolerance)*2,ConstantForceSpringHookLength(3dPrinterTolerance)+1,ConstantForceSpringHookWidth(3dPrinterTolerance)+2]);
		}
	}
}

//ConstantForceSpringHook();