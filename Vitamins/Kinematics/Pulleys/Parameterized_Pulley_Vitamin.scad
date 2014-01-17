layer_height = 0.3;
$fn = 60;
eta1 = 0.1;
PLA_OFFSET = 0;
ABS_OFFSET = 0;
/////////////////////////
////Pulley Properties////
/////////////////////////
shaftDiameter = 8-PLA_OFFSET; 
flanges = 2; // the rims that keep the belt from going anywhere
flangeHeight = 2;
numTeeth = 16; // this value together with the pitch determines the pulley diameter
toothType = 1; // 1 = slightly rounded, 2 = oval sharp, 3 = square. For square, set the toothWith a little low.
splineToPulleyHeight = 4;	//Clearance for servo spline from x-y plane
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
magnetType = 2; 			//Type 1 square, Type 2 Circle
magnetSize = 3.2;
magnetHeight = 2;
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
module pulley(){
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

		shaft();
		}
}
///////////////////////////////////////////////
///////////       MODULE SHAFT     ////////////
///////////////////////////////////////////////
module shaft(){
	difference(){
		union(){
			//Main Shaft
			translate([0,0,splineToPulleyHeight])
				cylinder(r = shaftDiameter/2, h = shaftLength, center = false);
			//Bearing Stop
			//translate([0,0,splineToPulleyHeight])
			//	cylinder(r = bearingStopRadius, h = bearingDistance-splineToPulleyHeight, center = false);
			//Stress relief
			translate([0,0,splineToPulleyHeight+toothHeight+flangeHeight])
				cylinder(h = magnetDistance-bearingDistance-1, r1 = bearingStopRadius+3, r2 = bearingStopRadius, center = false);

		}
		if(magnetType == 1){
			//Magnet Cutout
			translate([-magnetSize/2, -magnetSize/2, magnetDistance-magnetHeight+eta1])
				cube([magnetSize,magnetSize,magnetHeight]);
		}
		if(magnetType ==2){
			//Magnet Cutout
			translate([0, 0, magnetDistance-magnetHeight+eta1])
				cylinder(r = magnetSize/2, h = magnetHeight, center = false);
		}
	}
}






//-------------------------------------------
//-- Futaba 3003 4-arm horn
//-------------------------------------------

//-- Futaba 3003 4-arm horn parameters
a4h_end_diam = 5;
a4h_center_diam = 10;
a4h_arm_length = 15;
a4h_drill_distance = 13.3;

horn_drill_diam = 2;
horn_drill_distance = 8;
horn_height = 4;

module horn4(h=5)
{
  union() {
    //-- Center part (is a square)
    cube([a4h_center_diam+0.2,a4h_center_diam+0.2,h],center=true);

    //-- Place the 4 arms in every side of the cube
    for ( i = [0 : 3] ) {
      rotate( [0,0,i*90])
      translate([0, a4h_center_diam/2, 0])
      horn4_arm(h);
    }
  }
}
module horn4_arm(h=5)
{
  translate([0,a4h_arm_length-a4h_end_diam/2,0])
  //-- The arm consist of the perimeter of a cylinder and a cube
  hull() {
    cylinder(r=a4h_end_diam/2, h=h, center=true, $fn=20);
    translate([0,1-a4h_arm_length+a4h_end_diam/2,0])
      cube([a4h_center_diam,2,h],center=true);
  }
}
module Servo_wheel_4_arm_horn()
{
      //-- Inner drill
      //translate([0,0,-eta1])
		//		cylinder(center=false, h=horn_height + 10, r=3.5);

      //-- substract the 4-arm servo horn
      translate([0,0,-eta1])
        horn4(h= horn_height);

      //-- Horn drills
      //horn_drills(d=8, n=4, h=horn_height);
}
//--------------------------------------------------------------
//-- Generic module for the horn's drills
//-- Parameters:
//--  d = drill's radial distance (from the horn's center)
//--  n = number of drills
//--  h = wheel height222222
//--------------------------------------------------------------
module horn_drills(d,n,h)
{
  union() {
    for ( i = [0 : n-1] ) {
        rotate([0,0,i*360/n])
        translate([0,horn_drill_distance,0])
        cylinder(r=horn_drill_diam/2, h=h+10,center=true, $fn=60);  
      }
  }
}




module servo_pulley(){

	//translate([0,0,0.3*8-eta1])
	//	cylinder( r = 14.5, h = layer_height);
	difference(){
		pulley();
		//translate([0,0,-eta1])
		//	servo_head();
		//translate([0,0,-eta1])
		//	cylinder(r = 3.2, h = 5);
		translate([0,0,1])
			Servo_wheel_4_arm_horn();
	}
}
servo_pulley();