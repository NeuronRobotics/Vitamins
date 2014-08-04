function LimitSwitchBoxHeight()=10.3;
function LimitSwitchBoxThickness()= 6.3;
function LimitSwitchBoxLength()=19.8;

function LimitSwitchHoleDiam()=2.4;
function LimitSwitchHoleTopInset()=2.4; 
function LimitSwitchHoleSideInset()=5.25; 

function LimitSwitchWidth(3dPrinterTolerance=1)= 4+3dPrinterTolerance;
function LimitSwitchLength()=16;
function LimitSwitchCurveDiam(3dPrinterTolerance=2)=2.7+3dPrinterTolerance;

module LimitSwitch()
{
	difference()
	{
		cube([ LimitSwitchBoxLength(),LimitSwitchBoxHeight(), LimitSwitchBoxThickness()]);
		translate([LimitSwitchHoleSideInset(),LimitSwitchHoleTopInset(),-1])
		{
			cylinder(r=LimitSwitchHoleDiam()/2, h=LimitSwitchBoxThickness()+2, $fn=10);	
		}	
		translate([LimitSwitchBoxLength()-LimitSwitchHoleSideInset(),LimitSwitchHoleTopInset(),-1])
		{
			cylinder(r=LimitSwitchHoleDiam()/2, h=LimitSwitchBoxThickness()+2, $fn=10);	
		}	
	}
}

LimitSwitch();