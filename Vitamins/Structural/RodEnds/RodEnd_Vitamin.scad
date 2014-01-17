use <../../Fasteners/ScrewsAsBolts/Motor_Screw_As_Bolt_Vitamin.scad>

function RodEndTopWidth(3dPrinterTolerance=.4) = 10+3dPrinterTolerance;
function RodEndLength(3dPrinterTolerance=.4) = 3.5+RodEndTopWidth(3dPrinterTolerance)/2+RodEndTopWidth(3dPrinterTolerance)/2+3dPrinterTolerance;
function RodEndRodDiam(3dPrinterTolerance=.4)=7+3dPrinterTolerance;
function RodEndRodLength(3dPrinterTolerance=.4)=12.2+3dPrinterTolerance;

function RodEndHoleDiam(3dPrinterTolerance=.4) = 3+3dPrinterTolerance;
function RodEndThickness(3dPrinterTolerance=.4) = 3+3dPrinterTolerance;
function RodEndBallSwivelFlangeDiam(3dPrinterTolerance=.4)= 5+3dPrinterTolerance;
function RodEndBallSwivelFlangeHeight(3dPrinterTolerance=.4)= 9+3dPrinterTolerance;

function RodEndRodInset(3dPrinterTolerance=.4)= 3+3dPrinterTolerance;

function RodEndRodHoleDiam(3dPrinterTolerance=.4)= 3.4-3dPrinterTolerance;



module RodEnd(3dPrinterTolerance=.4)
{	
	translate([0,-RodEndThickness(3dPrinterTolerance)/2,0])
	rotate([0,-90,0])
	rotate([0,90,90])
	{
		difference()
		{
			union()
			{
				cylinder(h=RodEndThickness(3dPrinterTolerance), r=RodEndTopWidth(3dPrinterTolerance)/2, $fn=50);
				translate([0,-RodEndTopWidth(3dPrinterTolerance)/2,0])	
				{	
					cube([RodEndLength(3dPrinterTolerance)-RodEndTopWidth(3dPrinterTolerance)/2,RodEndTopWidth(3dPrinterTolerance), RodEndThickness(3dPrinterTolerance)]);
				}
				translate([0,0,(RodEndThickness(3dPrinterTolerance)-RodEndBallSwivelFlangeHeight(3dPrinterTolerance))/2])
				{
					cylinder(h=RodEndBallSwivelFlangeHeight(3dPrinterTolerance), r=RodEndBallSwivelFlangeDiam(3dPrinterTolerance)/2, $fn=50);
				}
				translate([RodEndLength(3dPrinterTolerance)-RodEndTopWidth(3dPrinterTolerance)/2-RodEndRodInset(),0,RodEndThickness(3dPrinterTolerance)/2])
				rotate([0,90,0])
				{
					difference()
					{
						cylinder(h=RodEndRodLength(3dPrinterTolerance)*1.25,r=RodEndRodDiam(3dPrinterTolerance)/2, $fn=50);
						translate([0,0,1])
						{
							cylinder(h=RodEndRodLength(3dPrinterTolerance)*1.25,r=RodEndRodHoleDiam(3dPrinterTolerance)/2, $fn=50);
						}
					}
				
				}			
			}	
		translate([0,0,-RodEndThickness(3dPrinterTolerance)/2-1])
				{
					cylinder(h=RodEndBallSwivelFlangeHeight(3dPrinterTolerance)+2, r=RodEndHoleDiam(3dPrinterTolerance)/2, $fn=50);
				}
		}
	}
}


//RodEnd();


module RodEndSlot(3dPrinterTolerance=.4)
{
 union()
	{
		RodEnd();
		rotate([90,0,0])
		{
			translate([0,0,-RodEndBallSwivelFlangeHeight(3dPrinterTolerance)/2])
			{
				cylinder(RodEndBallSwivelFlangeHeight(3dPrinterTolerance), RodEndBallSwivelFlangeDiam(3dPrinterTolerance)/2, RodEndBallSwivelFlangeDiam(3dPrinterTolerance)/2);
			translate([0,-RodEndTopWidth(3dPrinterTolerance),RodEndLength(3dPrinterTolerance)/4-RodEndTopWidth(3dPrinterTolerance)/8])	
				{	
					cube([RodEndLength(3dPrinterTolerance)-RodEndTopWidth(3dPrinterTolerance)/2,RodEndTopWidth(3dPrinterTolerance)*2, RodEndThickness(3dPrinterTolerance)*1.5]);
				}
			translate([0,0,RodEndBallSwivelFlangeHeight(3dPrinterTolerance)/2-(RodEndThickness(3dPrinterTolerance)*1.5)/2])	
			{
				cylinder(h=RodEndThickness(3dPrinterTolerance)*1.5, r=RodEndTopWidth(3dPrinterTolerance)/1.5);
			}
		translate([0,0,-MotorScrewBoltLength()/8])
		{
			rotate([0,180,0])
			{
				#MotorScrewBolt();
			}
		}
		translate([-RodEndBallSwivelFlangeDiam(3dPrinterTolerance)/2,-RodEndTopWidth(3dPrinterTolerance),.4])
		{
			cube([RodEndBallSwivelFlangeDiam(3dPrinterTolerance), RodEndTopWidth(3dPrinterTolerance), RodEndBallSwivelFlangeHeight(3dPrinterTolerance)-.8]);
		}
		
			}
		}
	}
}

RodEndSlot();



