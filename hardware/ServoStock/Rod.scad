//use <Parameters.scad>
use <../Vitamins/Structural/RodEnds/RodEnd_Vitamin.scad>
use <../Vitamins/Fasteners/ScrewsAsBolts/High_Low_Screw_As_Bolt_Vitamin.scad>


//the rod in yellow will clip onto the rod end using a HiLo screw, however I am not confident about how well it will work in real life, so I've also made a rod (in green) that can simply be inserted into the rod ends and will require another vitamin (glue or epoxy or something) to secure the rod end inside the rod

//THE BEST ROD, HOWEVER APPEARS TO BE THE RED ONE, WHICH USES HILO SCREWS WHICH CAN ACTUALLY THREAD INTO THE ROD ENDS, CREATING A SNUG FIT WITH NO NEW VITAMINS AND NO OVERHANGS

module RodEndSite()
{
	union()
	{
		difference()
		{
			translate([0,-RodEndRodDiam()*1.5/2,-RodEndRodLength()*.7/2])
			{
				cube([RodEndRodLength()*1.5,RodEndRodDiam()*1.5,RodEndRodLength()*.7]);
			}
			translate([RodEndRodDiam()*.8,0,-RodEndRodLength()*.7/2+RodEndRodLength()/5])
			{
				union()
				{
					difference()
					{
						cylinder(h=RodEndRodLength()*1.25,r=RodEndRodDiam()/2, $fn=50);
						translate([0,0,-1])
						{
	//Keep or remove this cylinder as you see fit (it creates a large overhang)
							cylinder(h=RodEndRodLength()*1.5,r=RodEndRodHoleDiam()/2, $fn=50);
						}
					}
					translate([RodEndRodDiam()/3,-RodEndRodDiam()/6,-RodEndRodLength()])
					{
						cube([RodEndRodDiam()*1.5, RodEndRodDiam()/3, RodEndRodLength()*2]);
					}
				}
			}
			translate([RodEndRodLength()*1.15,-RodEndRodDiam()/2-HiLoBoltHeadHeight(),0])
			{
				rotate([0,-90,90])
				{
					HiLoBolt(.4, RodEndRodDiam()/2);
				}
			}
		}
	}
}

//RodEndSite();

module BaseRod(RodLength=100)
{
	translate([RodEndRodDiam()*.7,0,-RodLength+RodEndRodLength()*1.1])
	{
		rotate([0,0,135])
		{
		linear_extrude(RodLength-RodEndRodLength()*1.4)
		polygon(points=[[-2,-2],[RodEndRodDiam(),0],[0,RodEndRodDiam()]], paths=[[0,1,2]]);
		}
	}

}

module Rod(RodLength=100)
{
	rotate([0,-90,0])
	{
		union()
		{
			RodEndSite();
			BaseRod(RodLength);
			mirror([0,0,1])
			{
				translate([0,0,RodLength-RodEndRodLength()*.8])
				{
					RodEndSite();
				}
			}
		}
	}
}

//Also I'm not sure if it's clear but you can determine the length of the rod just by putting a number inside the parentheses. When this is further along and the rod length is defined you should just be able to insert the rod length variable.

//One more note, I think the rod ends are slightly kludged so DOUBLE CHECK if everything lines up right, otherwise the rod might be a few millimeters longer or shorter than expected

//Rod();

module AlternateRod(RodLength=100)
{
	rotate([36,0,0])
	{
		rotate([0,90,0])
		{
			cylinder(h=RodLength,r=RodEndRodHoleDiam()*1.3/2, $fn=5);
		}
	}
}

//translate([0,20,0])
//color("green")
//AlternateRod();



////ACTUALLY BETTER IDEA, ALL CREDIT TO ADAM FOR BEING BRILLIANT



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


module DeltaFreeArm(RodLength=200)
{
	translate([0,0,RodEndRodDiam()*.7]){
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
}

translate([0,0,0])
	color("Red")
		DeltaFreeArm();

