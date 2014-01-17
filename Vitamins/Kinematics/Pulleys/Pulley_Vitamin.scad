use <../../Actuators/StandardServo/StandardServo_Vitamin.scad>
use <../../Structural/SealedBearings/SealedBearing608_Vitamin.scad>
use <../../Sensors/Encoders/EncoderMagnet_Vitamin.scad>


layer_height = 0.3;
$fn = 60;

/////////////////////////
////Pulley Properties////
/////////////////////////
shaftDiameter = 608BallBearingInnerDiam(); 
flanges = 2; // the rims that keep the belt from going anywhere
flangeHeight = 2;
numTeeth = 18; // usually 16 // this value together with the pitch determines the pulley diameter
toothType = 1; // 1 = slightly rounded, 2 = oval sharp, 3 = square. For square, set the toothWith a little low.
splineToPulleyHeight = 4;	//Clearance for servo spline from x-y plane

//////////HEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEYHEY
function PulleyBaseHeight() = splineToPulleyHeight;
function PulleyDiam() = (numTeeth*pitch/PI/2-beltThickness)*2;
function PulleyInnerDiam() = (numTeeth*pitch/PI/2-beltThickness-notchDepth)*2;
function PulleyOuterDiam() = (numTeeth*pitch/PI/2-beltThickness+2)*2;

echo(PulleyOuterDiam());

function PulleyHubHeight()= 608BallBearingHeight()*.7;

//this is the height of the workable area of the pulley
function WorkingPulleyHeight()= PulleyBaseHeight()+toothHeight+flangeHeight;

//don't change this name, but change all the other names to something less dumb
function PulleyHeight()=PulleyBaseHeight()+toothHeight+flangeHeight+PulleyHubHeight();


function PulleyTotalHeight()=PulleyHeight()+608BallBearingHeight();


//translate([10,10,0])
///#cube([5, 5, PulleyTotalHeight()]);


bearingStopRadius = shaftDiameter/1.4;


////////////////////////
/////Belt Proerties/////
////////////////////////
pitch = 5.2; // distance between the teeth
beltWidth = 6; // the width/height of the belt. The (vertical) size of the pulley is adapted to this.
beltThickness = 0.65; // thickness of the part excluding the notch depth!
notchDepth = 1.8; // make it slightly bigger than actual, there's an outward curvature in the inner solid part of the pulley
toothWidth = 2.5; // Teeth of the PULLEY, that is.
toothHeight = beltWidth+flangeHeight*2;

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
///////////////////////////////////////////////
/////////     MODULE SERVO HEAD    ////////////
///////////////////////////////////////////////
module servo_head() {
   cylinder(r = head_diameter / 2, h = head_heigth + 1);
   cylinder(r = head_diameter / 2 - tooth_height + 0.03 + clear, h = head_heigth);
   for (i = [0 : 1 :tooth_count]) {
		rotate([0, 0, i * (360 / tooth_count)]) {
      	translate([0, head_diameter / 2 - tooth_height + clear, 0]) {
         	linear_extrude(height = head_heigth) {
   				polygon([[-tooth_length / 2, 0], [-tooth_width / 2, tooth_height], [tooth_width / 2, tooth_height], [tooth_length / 2,0]]);
   			}
         }
      }
   }
}
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
			cylinder(r = shaftDiameter/2, h = 608BallBearingHeight()+PulleyHeight(), center = false);
			//Bearing Stop
			//translate([0,0,splineToPulleyHeight])
			//	cylinder(r = bearingStopRadius, h = bearingDistance-splineToPulleyHeight, center = false);
			//Stress relief
			translate([0,0,splineToPulleyHeight+toothHeight+flangeHeight])
				cylinder(h = PulleyHubHeight(), r1 = bearingStopRadius+3, r2 = bearingStopRadius, center = false);

		}
		
			translate([0, 0, PulleyTotalHeight()-MagnetLength()+1])
				EncoderMagnet(MagnetType,.4);
		
	}
}





module servo_pulley(MagnetType=true, MotorType=true){

	if(MotorType==true){
	difference(){
		pulley(MagnetType);		
		translate([0,0,-1])
			StandardServoMotor(true,1,true,.4);
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
			StandardServoMotor(false,3,true,.4);
			}
		
	}
}

//true creates a round magnet hole, false creates a square magnet hole.
servo_pulley(true,true);