use <Parameters.scad>
use <../Vitamins/Structural/RodEnds/RodEnd_Vitamin2.scad>
use <../Vitamins/Fasteners/ScrewsAsBolts/Motor_Screw_As_Bolt_Vitamin.scad>

function RodEndClipLength()=RodEndBallSwivelFlangeHeight()*1.2;
function RodEndClipWidth()=MotorScrewBoltLength()*.9;
function RodEndClipHeight()=RodEndTopWidth();

module RodEndClip()
{
	rotate([0,180,90])
	{
		difference()
		{
			union()
			{
				translate([0,-RodEndClipHeight()/8,0])
				{
					cube([RodEndClipLength(), RodEndClipWidth(),  RodEndClipHeight()], center=true);
				}
				translate([RodEndRodInset()*.8,-RodEndTopWidth()/8,0])
				{
					rotate([90,0,0])
					{
						cylinder(h=RodEndClipWidth(), r=MotorScrewBoltHeadDiameter()/2, center=true, $fn=30);
					}					
				}
			}
			translate([RodEndRodInset()*.8,0,0])
			{
				union()
				{
				#RodEnd();
				RodEndSlot();
				}
			}
		}
	}
}

//RodEndClip();

module RodEndClips()
{
	translate([-RodEndSpacing()/2,-RodEndClipLength()/2,RodEndClipHeight()/2])
	{
		union()
		{
			RodEndClip();
			
			translate([RodEndSpacing(),0,0])
			{
				mirror([1,0,0])
				{
					RodEndClip();	
				}				
			}	
		}
	}
}

RodEndClips();