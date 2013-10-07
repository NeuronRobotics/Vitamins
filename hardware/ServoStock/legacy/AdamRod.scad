use <../Vitamins/Structural/RodEnds/RodEnd_Vitamin.scad>
use <../Vitamins/Fasteners/ScrewsAsBolts/High_Low_Screw_As_Bolt_Vitamin.scad>



module BoltSlot(RodLength=100)
{
	RodChannelLength=RodLength-(HiLoBoltLength()-RodEndRodLength())*2-HiLoBoltHeadHeight();
	translate([HiLoBoltLength()-RodEndRodLength(),0,0])
	{
		union()
		{
			rotate([0,90,0])
			{	
				union()
				{
					#HiLoBolt(.2,(HiLoBoltLength()-RodEndRodLength())/2);
					cylinder(h=RodChannelLength/5, r=HiLoBoltHeadDiameter()/2, $fn=30);
				}
			}
			translate([0,-HiLoBoltHeadDiameter()/2,-HiLoBoltHeadDiameter()/4])
			{
				cube([HiLoBoltHeadHeight()+RodChannelLength,HiLoBoltHeadDiameter(),RodEndRodDiam()*1.5]);
			}
		}	
	}	
}


module Rod(RodLength=100)
{
	difference()
	{
		rotate([36,0,0])
		{
			rotate([0,90,0])
			{
				cylinder(h=RodLength,r=RodEndRodDiam()*1.7/2, $fn=5);
			}
		}
		BoltSlot(RodLength);	
		translate([RodLength,0,0])
		{
			mirror([1,0,0])
			{
				BoltSlot(RodLength);	
			}
		}		
	}
}

//just put desired length in the parenthesis (so for a length of 150 just do Rod(150);)
Rod(150);

