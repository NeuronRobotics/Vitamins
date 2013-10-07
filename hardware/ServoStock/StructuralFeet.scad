use <Parameters.scad>
use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../Vitamins/Fasteners/Screws/High_Low_Screw_Vitamin.scad>
use <../Vitamins/Kinematics/Pulleys/Pulley_Vitamin.scad>
use <../Vitamins/Sensors/Encoders/Encoder_Vitamin.scad>
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>


use <BearingCap.scad>	
use <Clips.scad>	


function EncoderShelfWidth() = PlasticWidth()*3+608BallBearingHeight()+EncoderThickness();
function EncoderShelfDistance() = StandardServoOutcrop()-PlasticWidth()*2+WorkingPulleyHeight()+PulleyHubHeight()/2;
function EncoderShelfLength() = ZrodSpacing()-SideWidth()+SlotWidth();
function EncoderShelfOffset() = -ZrodSpacing()/2+PlasticWidth()+SlotWidth()/2;
function EncoderCutoutLength()= PulleyDiam()+PlasticWidth()*2;
function EncoderMountHeight() = StandardServoCenterDist()+StandardServoTolerance()*4+StandardServoBoltDiam()/2;
function EncoderMountWidth() = EncoderWidth()+PlasticWidth();

$fn=50;

echo(PlasticWidth());

module wing()
{

	//This makes the wings for the bed mount
	translate([	-SideWidth()*2.5-PlasticWidth()-ClipWidth()-3,
	           	-ZrodSpacing()/2-PlasticWidth()/2,
	           	0]
	){
		union()
		{	

			cube([SideWidth()*2.5-1,PlasticWidth(), MotorBracketHeight()]);

		}
	}
	placeClipMountHoleCenter(){
		translate([-36,-ZrodSpacing()/2,0]){
			difference(){
				cylinder(h=MotorBracketHeight(), r=PlasticWidth());
				translate([0,0,-1])
					cylinder(h=MotorBracketHeight()*2, r=HiLoScrewDiameter(.66)/2);
			}
		}
	}
		
}

//This just duplicates the wing into two wings
module wings()
{
	union()
	{
		wing();
		translate([0, ZrodSpacing(), 0])
		{
			wing();
		}
	}
}

module BearingCutout()
{
	rotate([0,90,0])
	{
		union()
		{
			608BallBearing();
			
			translate([0,0,-EncoderShelfDistance()+608BallBearingHeight()/2])
			{
				cylinder(h=EncoderShelfDistance(), r=608BallBearingDiam()/2-PlasticWidth()/2);
			}
			translate([0,0,608BallBearingHeight()/2.5])
			{
				cylinder(h=PlasticWidth()*3, r=608BallBearingDiam()/4);
			}
		}				
	}
}





module EncoderMount()
{
	union()
	{
		//this makes the shelf that the encoder/bearing mount sits on
		difference()
		{
			translate([0,EncoderShelfOffset(),MotorBracketHeight()-PlasticWidth()*3])
			{
				cube([EncoderShelfWidth()+EncoderShelfDistance(),EncoderShelfLength(), PlasticWidth()*3]);
			}
			translate([-1,-EncoderCutoutLength()/2,MotorBracketHeight()-PlasticWidth()*3-1])
			{
				cube([EncoderShelfDistance()+1,EncoderCutoutLength(), PlasticWidth()*3+2]);
			}
		}
		difference()
		{
			//this makes the basic shape of the encoder/bearing mount
			translate([EncoderShelfDistance(),-EncoderShelfLength()/2,MotorBracketHeight()-EncoderMountHeight()-PlasticWidth()]) 
			{
				cube([EncoderShelfWidth(), EncoderShelfLength(), EncoderMountHeight()]);
			}
		}
		translate([EncoderShelfWidth()+EncoderShelfDistance()-PlasticWidth()*3,-EncoderMountWidth()/2,MotorBracketHeight()-EncoderMountHeight()-PlasticWidth()*4.5]) 
		{
			cube([PlasticWidth()*3, EncoderMountWidth(), EncoderHeight()+PlasticWidth()*2.5]);
		}
	}
}



//this is the actual module for the finished foot, it pulls down the clips and adds the wings to make a bed mount, and cuts holes to accomodate the motor
module StructuralFeet(EncoderScrews=false)
{
	difference()
	{
		union()
		{
			difference()
			{
			 	Clips(true);
				translate([-ClipWidth()-1,-StandardServoThickness()/2,PlasticWidth()])
				rotate([0,0,90])
				{
					rotate([90,0,0])
					{
						#StandardServoMotor(true, 1, false, .4);
					}
				}
			}
			wings();
			

//			difference()
//			{
				EncoderMount();
//				translate([EncoderShelfDistance(),0,MotorBracketHeight()-EncoderMountHeight()-PlasticWidth()-1])
//				{
//					rotate([0,0,180])
//					{
//						rotate([180,0,0])
//						{
//							SubtractiveBearingCap();	
//						}
//					}
//				}
//			}
		}
		translate([EncoderShelfDistance()+PulleyHubHeight()/2,0,MotorBracketHeight()-EncoderMountHeight()-PlasticWidth()])
		{
			union()
			{
				BearingCutout();
				translate([0, -608BallBearingDiam()/2, -608BallBearingDiam()+1])
				{
					cube([608BallBearingHeight(), 608BallBearingDiam(), 608BallBearingDiam()]);
				}
			}
			translate([608BallBearingHeight()*1.5,0,0])
			{
				rotate([0,90,0])
				{
					rotate([0,0,90])
					{
						if (EncoderScrews==true)
						{
							union()
							{
								Encoder_Keepaway(false,.8);
								#Encoder(true,.8);		
							}
						}else{
							union()
							{
								Encoder_Keepaway(true, .8);
								#Encoder(false,.8);		
							}	
						}					
					}
				}
			}
		}
	}
}








//rotating the module, as it would be rotated for printing
translate([0,0, MotorBracketHeight()])
{
	rotate([0,180,0])
	{
		StructuralFeet();
	}
}

//check it out the pulley fits and everything

translate([-StandardServoCylinderHeight(),0,EncoderMountHeight()+PlasticWidth()])
rotate([0,-90,0])
{		
	//servo_pulley(true);
}

//check the bearing cap fit. It may look a little funny but having it float up top and simply use the existing screws for the encoder mount does two things: it negates the need for its own screw, and by floating, it ensures that you'll always be able to wiggle it around to make it fit. If the two parts touch and there's a minor misaligment for whatever reason (which is likely), then you may not be able to get the screwholes to line up properly.

translate([-EncoderShelfDistance(),0,29])
{	
//	#BearingCap();		
}


