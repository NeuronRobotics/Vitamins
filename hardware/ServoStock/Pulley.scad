use <../Vitamins/Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../Vitamins/Structural/SealedBearings/SealedBearing608_Vitamin.scad>
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>
use <../Vitamins/Kinematics/Belts/OneFifthinXLTimingBelt.scad>

use <Parameters.scad>

///THIS, LIKE EVERYTHING ELSE, REALLY NEEDS TO GET TIDIED UP, BUT I DON'T FEEL LIKE DEALING WITH THAT JUST NOW (ALL THE DIMENSIONS ETC SHOULD BE PERFECT)


layer_height = 0.3;
$fn = 60;

/////////////////////////
////Pulley Properties////
/////////////////////////
shaftDiameter = 608BallBearingInnerDiam(); 
flanges = 2; // the rims that keep the belt from going anywhere
flangeHeight = 2;
numTeeth = 20; // usually 16 // this value together with the pitch determines the pulley diameter
toothType = 3; // 1 = slightly rounded, 2 = oval sharp, 3 = square. For square, set the toothWith a little low.
splineToPulleyHeight = 4;	//Clearance for servo spline from x-y plane

//////////HEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEY
function PulleyBaseHeight() = splineToPulleyHeight;
function PulleyDiam() = (numTeeth*pitch/PI/2-beltThickness)*2;
function PulleyInnerDiam() = (numTeeth*pitch/PI/2-beltThickness-notchDepth)*2;
function PulleyOuterDiam() = (numTeeth*pitch/PI/2-beltThickness+2)*2;


//label all of these and maybe include a commented out cylinder demonstrating each so that other people can understand the code better

echo(PulleyInnerDiam());

function PulleyHubHeight()= 608BallBearingHeight()*.7;

//this is the height of the workable area of the pulley
function WorkingPulleyHeight()= PulleyBaseHeight()+toothHeight+flangeHeight;

//don't change this name, but change all the other names to something less dumb
function PulleyHeight()=PulleyBaseHeight()+toothHeight+flangeHeight+PulleyHubHeight();


function PulleyTotalHeight()=PulleyHeight()+608BallBearingHeight();

function PulleyBeltOffset()=splineToPulleyHeight+beltWidth/2;
//translate([10,10,0])
//#cube([5, 5, PulleyBeltOffset()]);


bearingStopRadius = shaftDiameter/1.4;

function StressReliefOffsetHeight()= splineToPulleyHeight+toothHeight+flangeHeight;


////////////////////////
/////Belt Properties/////
////////////////////////
pitch = 5.35; // distance between the teeth
//NOTE THAT PULLEY PITCH IS NOT THE SAME AS BELT  PITCH!!! IF YOU GET A DIFFERENT PITCH BELT YOU'LL JUST HAVE TO MANUALLY CHANGE THE PITCH FOR THE PULLEY
beltWidth = 2XLBeltWidth(); // the width/height of the belt. The (vertical) size of the pulley is adapted to this.
beltThickness = 2XLBeltBaseHeight(); // thickness of the part excluding the notch depth!
notchDepth = 2XLBeltGripHeight(1); // make it slightly bigger than actual, there's an outward curvature in the inner solid part of the pulley
toothWidth = 2XLBeltSpaceWidth()-3dPrinterTolerance(); // Teeth of the PULLEY, that is.
toothHeight = beltWidth+flangeHeight*1.5;

////////////////////////
////Magnet Proerties////
////////////////////////
		//Type 1 square, Type 2 Circle
magnetDistance = 27;		//Distance from tip of magnet to beginning of servo spline
bearingDistance = 21;  
shaftLength = magnetDistance-splineToPulleyHeight;






//  Clear between head cutout and servo head (PLA: 0.3, ABS 0.2)
SERVO_HEAD_CLEAR = 0.3; // [0.2,0.3,0.4,0.5]
/**
 *  Head / Tooth parameters
 *  Futaba 3F Standard Spline
 *  http://www.servocity.com/html/futaba_servo_splines.html
 *
 *  First array (head related) :
 *  0. Head external diameter
 *  1. Head heigth
 *  2. Head thickness
 *  3. Head screw diameter
 *
 *  Second array (tooth related) :
 *  0. Tooth count
 *  1. Tooth height
 *  2. Tooth length
 *  3. Tooth width
 */
SPLINE = [
    [5.92, 4, 1.1, 2.5],
    [25, 0.3, 0.7, 0.1]
];
/**
 *  Tooth
 *
 *    |<-w->|
 *    |_____|___
 *    /     \  ^h
 *  _/       \_v
 *   |<--l-->|
 *
 *  - tooth length (l)
 *  - tooth width (w)
 *  - tooth height (h)
 *  - height
 */
	clear = SERVO_HEAD_CLEAR;
   head = SPLINE[0];
   tooth = SPLINE[1];
   head_diameter = head[0];
   head_heigth = head[1];
   tooth_count = tooth[0];
   tooth_height = tooth[1];
   tooth_length = tooth[2];
   tooth_width = tooth[3];

//THIS IS A MORE ACCURATE MODEL OF THE LITTLE METAL SERVO NUB

///////////////////////////////////////////////
/////////     MODULE SERVO HEAD    ////////////
///////////////////////////////////////////////
//module servo_head() {
//   cylinder(r = head_diameter / 2, h = head_heigth + 1);
//  cylinder(r = head_diameter / 2 - tooth_height + 0.03 + clear, h = head_heigth);
//   for (i = [0 : 1 :tooth_count]) {
//		rotate([0, 0, i * (360 / tooth_count)]) {
//      	translate([0, head_diameter / 2 - tooth_height + clear, 0]) {
//         	linear_extrude(height = head_heigth) {
//   				polygon([[-tooth_length / 2, 0], [-tooth_width / 2, tooth_height], [tooth_width / 2, tooth_height], [tooth_length / 2,0]]);
//   			}
//         }
//      }
//   }
//}





///////////////////////////////////////////////
///////////       MODULE TEETH     ////////////
///////////////////////////////////////////////
	module teeth(pitch,numTeeth,toothWidth,notchDepth,toothHeight)
	{
		// teeth are apart by the 'pitch' distance
		// this determines the outer radius of the teeth
		circumference = numTeeth*pitch;
//heyheyheyheyhey
		outerRadius = circumference/PI/2-beltThickness;
		innerRadius = circumference/PI/2-notchDepth-beltThickness;
		echo("Teeth diameter is: ", outerRadius*2);
		echo("Pulley inside of teeth radius is: ", innerRadius*2);
		
		for(i = [0:numTeeth-1])
		{
			rotate([0,0,i*360/numTeeth]) translate([innerRadius,0,0]) 
				tooth(toothWidth,notchDepth, toothHeight+1,toothType);
		}
	}
///////////////////////////////////////////////
///////////       MODULE TOOTH     ////////////
///////////////////////////////////////////////
	module tooth(toothWidth,notchDepth, toothHeight,toothType)
	{
		if(toothType == 1)
		{
			union()
			{
				translate([notchDepth*0.25,0,0]) 
					cube(size = [notchDepth,toothWidth,toothHeight],center = true);
		  		translate([notchDepth*0.75,0,0]) scale([notchDepth/4, toothWidth/2, 1]) 
					cylinder(h = toothHeight, r = 1, center=true);
			}
		}
		if(toothType == 2)
			scale([notchDepth, toothWidth/2, 1]) cylinder(h = toothHeight, r = 1, center=true);

		if(toothType == 3)
		{
			union()
			{
				translate([notchDepth*0.5-1,0,0]) cube(size = [notchDepth+2,toothWidth,toothHeight],center = true);
		  		//scale([notchDepth/4, toothWidth/2, 1]) cylinder(h = toothHeight, r = 1, center=true);
			}
		}
	}
///////////////////////////////////////////////
///////////       MODULE PULLEY     ///////////
///////////////////////////////////////////////

//MagnetType=true creates a round magnet hole, false creates a square magnet hole.
module pulley(MagnetType=true){
	circumference = numTeeth*pitch;
	outerRadius = circumference/PI/2-beltThickness;
	innerRadius = circumference/PI/2-notchDepth-beltThickness;
	union(){
		//solid part of gear
		translate([0,0,head_heigth+splineToPulleyHeight])
			cylinder(h = toothHeight, r = innerRadius, center =true);

		//teeth part of gear
			translate([0,0,head_heigth+splineToPulleyHeight])
				teeth(pitch,numTeeth,toothWidth,notchDepth,toothHeight);

		//top flange
		translate([0,0,head_heigth+splineToPulleyHeight+toothHeight/2])
			cylinder(h = flangeHeight, r1=outerRadius,r2=outerRadius+2);
		translate([0,0,head_heigth+splineToPulleyHeight+toothHeight/4])
			cylinder(h = flangeHeight+1, r2=outerRadius,r1=innerRadius);
		translate([0,0,head_heigth+splineToPulleyHeight+toothHeight/2+flangeHeight/2])
			cylinder(h = flangeHeight, r=outerRadius+2);

		//bottom flange
		translate([0,0,0])
			cylinder(h = splineToPulleyHeight, r=outerRadius+2);

		shaft(MagnetType);
		}
}
///////////////////////////////////////////////
///////////       MODULE SHAFT     ////////////
///////////////////////////////////////////////
module shaft(MagnetType=true){
	difference(){
		union(){
			//Main Shaft
			cylinder(	r1 = (shaftDiameter/2)-.2, // taper the bottom in a bit so the bearing seats all the way down
						r2 = shaftDiameter/2, 
						h = 608BallBearingHeight()+PulleyHeight()+3.1, 
						center = false);
			//Bearing Stop
			//translate([0,0,splineToPulleyHeight])
			//	cylinder(r = bearingStopRadius, h = bearingDistance-splineToPulleyHeight, center = false);
			//Stress relief
			translate([0,0,StressReliefOffsetHeight()])
				cylinder(h = PulleyHubHeight(), r1 = bearingStopRadius+3, r2 = bearingStopRadius, center = false);

		}
		
		translate([0, 0, PulleyTotalHeight()-MagnetLength()+4.1])
			MagnetDraft();
		
	}
}





module servo_pulley(MagnetType=true, MotorType=true){

	if(MotorType==true){
		difference(){
			pulley(MagnetType);		
			translate([0,0,-1])
				StandardServoMotor(	boltsUp=true,
									Cylinder=1,
									hornCentered=true,
									ServoTolerance=.4,
									hornBoltLength = 17.5);
		}
	}else{
		difference(){
			union(){
				pulley(MagnetType);
				translate([0,0,-horn_height()+1])
				{
					cylinder(h=horn_height(), r=PulleyOuterDiam()/2);
				}
				}						
				StandardServoMotor(	boltsUp=false,
									Cylinder=3,
									hornCentered=true,
									ServoTolerance=.4,
									hornBoltLength = 80);
			}
		
	}
}
servo_pulley(true,true);

//true creates a round magnet hole, false creates a square magnet hole

//to test belt fit (prints only belt part)
//difference()
//{
	//servo_pulley(true,true);
	//translate([0,0,-15.5])
	//{
	//	cube([40,40,40], center=true);
	//}
	//translate([0,0,30.5])
	//{
	//	cube([40,40,40], center=true);
	//}
//}
