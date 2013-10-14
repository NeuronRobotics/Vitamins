use <Parameters.scad>
use <../Vitamins/Structural/SteelRod/8mm_Rod_Vitamin.scad>
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>
use <../Vitamins/Fasteners/Bolts/M8x50_Vitamin.scad>
use <../Vitamins/Fasteners/Bolts/M8x30_Vitamin.scad>
use <../Vitamins/Fasteners/Bolts/M8_Nut_Vitamin.scad>
use <../Vitamins/Fasteners/ScrewsAsBolts/High_Low_Screw_As_Bolt_Vitamin.scad>
use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>


use <Clips.scad>
use <Pulley.scad>
use <IdlerBearingClip.scad>
use <IdlerBearingPlug.scad>




//note to self, this is how this part is oriented in rostock mini, but to me it makes more sense to flip the bolt round the other way so that the clips are facing inward (so they'd face out on the bottom and in on the top), I think this would make accessing the belt a lot easier, but maybe there's a reason it's like this so I'm leaving it as-is for now.

//if anyone ever wants to change it back just swap the cylinder from 90 to -90, remove the plasticwidth() from its translate, change the bolt round to -90, and make its translate just -boltheadheight()/2-BallBearingHeight()-Plasticwidth() for the first term.

function getPulleyOffset()=6.79;
//This makes the structual bearing mount, in its entirety
module StructuralBearingMount(Style=1)
{
	difference()
	{
		union()
		{
			Clips(false);

			//This adds the cylindrical peice, which itself maintains friction against the inside of the bearing allowing the outside to spin
			union()
			{
				translate([0,0,BearingBracketHeight()/2])
				{
					rotate([0,90,0])
					{
						union()
						{
							cylinder(	h=StandardServoOutcrop()+PulleyBaseHeight()- getPulleyOffset(), 
										r1=BearingBracketHeight()/2, 
										r2=608BallBearingAvgDiam()/2, 
										$fn=50);
							if(Style==3)
							{
								translate([0,0,StandardServoOutcrop()+PulleyBaseHeight()- getPulleyOffset()])
								{
									cylinder(	h=(608BallBearingHeight()/3), 
												r=608BallBearingInnerDiam()/2, 
												$fn=30);
								}
							}else{
								
							}
						}
					}
				}
				translate([	0,
				           	-(608BallBearingDiam()/2+608BallBearingInnerDiam()/2)/2,
				           	0]){
					cube([	StandardServoOutcrop()+PulleyBaseHeight()-BearingClipSideWidth()*2 - getPulleyOffset(),
							(608BallBearingDiam()/2+608BallBearingInnerDiam()/2), 
							BearingBracketHeight()/2]);
				}
			}			
		}	
		//this cuts the bolthole out of the mount
		if(Style==1)
		{
			translate([608BallBearingHeight()+PlasticWidth()+ StandardServoOutcrop()- getPulleyOffset(),0,BearingBracketHeight()/2])
			{
				rotate([0,90,0])
				{
					#M8x50Bolt();
				}
			}
		}else{
			if(Style==2)
			{
				translate([608BallBearingHeight()+PlasticWidth()+ StandardServoOutcrop()- getPulleyOffset(),0,BearingBracketHeight()/2])
				{
					rotate([0,90,0])
					{
						union()
						{
						#M8x30Bolt();
						translate([0,0,-M8x30BoltLength()])
						{
							M8NutSlot();
						}
						}
					}
				}
			}
			if(Style==3){
				translate([608BallBearingHeight()+PlasticWidth()+StandardServoOutcrop()+IdlerBearingPlugPlasticWidth()- getPulleyOffset(),0,BearingBracketHeight()/2])
				{
					rotate([0,90,0])
					{
					#IdlerBearingPlugBolt();
					}				
				}
			}
		}			
	}
}


//Style 1 is a 50mm bolt, style 2 is a 30mm bolt with a hole for the nut, and style 3 removes the bolt entirely and uses a HiLo screw instead.

StructuralBearingMount(3);

//to see depth of screw hole

//difference()
//{
//	StructuralBearingMount(3);
//	translate([-20,0,-20])
//	{
//		cube([100,100,100]);
//	}
//}


//to see how it lines up with the bearing/bearing plug (in the case of style 3)

//translate([StandardServoOutcrop()+PulleyBaseHeight(),0,BearingBracketHeight()/2])
//rotate([0,90,0])
//%608BallBearing();

//translate([StandardServoOutcrop()+PulleyBaseHeight()+608BallBearingHeight()+IdlerBearingPlugPlasticWidth(),0,BearingBracketHeight()/2])
//rotate([0,-90,0])
///IdlerBearingPlug();
