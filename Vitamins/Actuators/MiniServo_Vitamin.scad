// When calling this module, use toleranceMotor(boolean,boolean,boolean, number); 
// The first boolean determines the bolt direction(true is up, false is down) and 
// the second determines where the module is centered (true centers at the hub, 
// false centers at the motor mount).
// the third boolean determines whether to use the large cylindrical hub or the 
// small metal nub. 
// The Fourth number indicated the tolerance of the motor (default is .4 mm)

//THIS IS FOR IF YOU USE OTHER KINDS OF MOTORS, MOTOROUTCROP IS THE DISTANCE FROM THE MOUNTING PLATE TO THE BUISNESS END OF YOUR MOTOR, IF YOU EVER NEED TO SWITCH TO ANOTHER JUST CHANGE THIS VALUE TO THE ACTUAL VALUE
use <../Fasteners/Screws/High_Low_Screw_Vitamin.scad>

function MiniServoHeightAbvWings(tolerance=.6)=(MiniServoHeight()-(MiniServoWingsHeight()+MiniServoWingsDist()+tolerance*2));
echo ("MiniServoHeightAboveWings is",(MiniServoHeightAbvWings(.6)));


function MiniServoOutcrop()= MiniServoCylinderHeight()+MiniServoHeightAbvWings();

function MiniServoWingLength()= (MiniServoLength()-MiniServoBaseLength())/2;

//servo horn
function MiniServoHornHeight()=3.3;
function MiniServoHornMaxWidth()=9.5;


//for use when the motor is incorporated into parts
	//this is distance, the short way, from the edge of the motor to the center of the hub
function MiniServoCenterDist()=(MiniServoCylinderDiam()/2) + ((MiniServoLength()-MiniServoBaseLength())/2-MiniServoTolerance()*2); 

//basic motor shape
function MiniServoHeight()=20.2;
function MiniServoBaseLength()=22;
function MiniServoThickness()=11.2;

//wings for mounting
function MiniServoWingsHeight()=1;
function MiniServoLength()=30;
function MiniServoWingsDist()=14.3;
function MiniServoBoltHeadHeight()=1;

//cylinders on top of motor
function MiniServoCylinderHeight()=(24.7-20.3);
function MiniServoCylinderDiam()=11; 
function MiniServoSmallCylinderDiam()=5.8;
function MiniServoSmallCylinderDist()=11.45;

//nub on top of motor
function MiniServoNubHeight()=(27-24.7);
function MiniServoNubDiam(3dPrinterTolerance=.4)= 4;

//all bolts
function MiniServoBoltHeight()=8; //reflects the actual protrusion of the bolt above the wing
function MiniServoBoltDiam()=1.7;//2.5, but when using screws to fasten into plastic, the threads must run through the plastic

//horn bolts
function MiniServoHornBoltHeight()=9;
function MiniServoHornBoltDiam(3dPrinterTolerance=.5)=1.7+3dPrinterTolerance();

//body bolts

function MiniServoBoltSideDist()=1.8;
function MiniServoBoltEdgeDist()=4;

//cylinder bolts
function MiniServoCylBoltDist()=7.62;

//hub for wires
function MiniServoHubHeight()=2.54;
function MiniServoHubWidth()=7.7;
function MiniServoHubLength()=14;
function MiniServoHubDist()=0;

//tolerance for servo
function MiniServoTolerance()=.3;
function MiniServoBoltHoleDistance() = (MiniServoBaseLength() + MiniServoBoltSideDist()*2);
// restraining screw
function MiniServoRestrainingScrewSideDist()=MiniServoBoltSideDist()+MiniServoBoltEdgeDist();
function MiniServoRestrainingScrewDistance() = (MiniServoBaseLength() + MiniServoRestrainingScrewSideDist()*2);

//When calling this module, use MiniServoMotor(boolean,boolean); The first boolean determines the bolt direction(true is up, false is down) and the second determines where the module is centered (true centers at the hub, false centers at the motor mount)

//defining a bolt
module MiniServoBolt(ServoTolerance=MiniServoTolerance())
{
	cylinder(h=MiniServoBoltHeight()+ServoTolerance, r=(MiniServoBoltDiam()+ServoTolerance)/2, $fn=100);
}

module MiniServoHornBolt(ServoTolerance=MiniServoTolerance(), boltLen = 10 )
{	
	union(){
		translate([0,0, boltLen]){
			cylinder(	h= boltLen*2+ServoTolerance, 
						r=(MiniServoBoltDiam()+ServoTolerance)*1.3, 
						$fn=100);
		}
		cylinder(h= boltLen+ServoTolerance, r=(MiniServoBoltDiam()+ServoTolerance)/2, $fn=100);
	}
}

module bodyBolts(boltPlacementZ,ServoTolerance=MiniServoTolerance())
{
	for (i = [0:1])
	{
		//Use the for loop like binary flags
		translate([(0), (i*MiniServoBoltHoleDistance()), boltPlacementZ])
		{
			//Center the first pin on the hole
			translate([MiniServoThickness()/2,-MiniServoBoltSideDist(),0])
			{
				MiniServoBolt(ServoTolerance);
			}
		}
		//Use the for loop like binary flags
		translate([(0), (i*MiniServoRestrainingScrewDistance() ), boltPlacementZ])
		{
			//Center the first pin on the hole
			translate([MiniServoThickness()/2,-MiniServoRestrainingScrewSideDist(),0])
			{
				translate([0,0,-MiniServoWingsHeight()-.2])
				HiLoScrew();
			}
		}
	}
}
	



module MiniServoBlock(boltsUp=true, Cylinder=1, ServoTolerance=MiniServoTolerance(), boltLen =10){
	n=90;
	union()
	{
//basic motor shape
		translate([-ServoTolerance, -ServoTolerance, -ServoTolerance])
		{
			cube([MiniServoThickness()+ServoTolerance*2, MiniServoBaseLength()+ServoTolerance*2, MiniServoHeight()+ServoTolerance*2]);
		}

//wings for mounting
		translate([-ServoTolerance, (-ServoTolerance+((MiniServoBaseLength()-MiniServoLength())/2)), MiniServoWingsDist()-ServoTolerance])
		{
			cube([MiniServoThickness()+ServoTolerance*2, MiniServoLength()+ServoTolerance*2, MiniServoWingsHeight()+ServoTolerance*2+MiniServoBoltHeadHeight()]);
		}

//cylinders at top of motor
translate([MiniServoCylinderDiam()/2,MiniServoCylinderDiam()/2,MiniServoHeight()])
		{
			cylinder(h=MiniServoCylinderHeight()+ServoTolerance*2, r=MiniServoCylinderDiam()/2+ServoTolerance, $fn=40);
		}
translate([MiniServoCylinderDiam()/2,MiniServoSmallCylinderDist(),MiniServoHeight()])
		{
			cylinder(h=MiniServoCylinderHeight()+ServoTolerance*2, r=MiniServoSmallCylinderDiam()/2+ServoTolerance, $fn=40);
		}


//determines if you should make the servo horn or a nub
if(Cylinder==1){
//servo nub
		//motor nub

translate([MiniServoCylinderDiam()/2,MiniServoCylinderDiam()/2,MiniServoHeight()+MiniServoCylinderHeight()])
		{
			cylinder(h=MiniServoNubHeight()+ServoTolerance*2, r=MiniServoNubDiam()/2+ServoTolerance, $fn=10);
		}
}else{
	if(Cylinder==2){
	union()
	{
		translate([MiniServoCylinderDiam()/2,MiniServoCylinderDiam()/2,MiniServoHeight()])
		{
			cylinder(MiniServoNubHeight()+ServoTolerance*2, MiniServoNubDiam()/2+ServoTolerance, MiniServoNubDiam()/2+ServoTolerance, 0);

		}

		translate([MiniServoThickness()/2+MiniServoTolerance(),MiniServoCylinderDiam()/2,MiniServoHeight()+MiniServoNubHeight()+ServoTolerance*6])
		{
			Servo_horn();
		}
	
}
}	
}

		if(boltsUp==true){
			bodyBolts(MiniServoWingsDist()+MiniServoWingsHeight(),ServoTolerance);
		}else{
			bodyBolts(MiniServoWingsDist()-MiniServoBoltHeight(),ServoTolerance);
		}
		
//hub for wires
		translate([(MiniServoThickness()-(MiniServoHubWidth()+ServoTolerance))/2,(MiniServoBaseLength()+ServoTolerance),MiniServoHubDist()])
		{
			cube([MiniServoHubWidth()+ServoTolerance,MiniServoHubLength()+ServoTolerance,MiniServoHubHeight()+ServoTolerance]);
		}
	}
}



//making the motor
module MiniServoMotor(	boltsUp=true, 
							Cylinder=1, 
							hornCentered=false, 
							ServoTolerance=MiniServoTolerance(), 
							hornBoltLength = 10 )
{
	//echo("Horn bolt length ",hornBoltLength);
	if(hornCentered==true){
		if(Cylinder==1){
			translate([-MiniServoThickness()/2,-MiniServoCylinderDist(),-(MiniServoHeight()+MiniServoCylinderHeight())-ServoTolerance*2])
			{
				MiniServoBlock(boltsUp,Cylinder,ServoTolerance,hornBoltLength);
			}
		}else{
			if(Cylinder==2){
			translate([-MiniServoThickness()/2,-MiniServoCylinderDist(),-(MiniServoHeight()+MiniServoNubHeight())-ServoTolerance*2])
			{
				MiniServoBlock(boltsUp,Cylinder,ServoTolerance,hornBoltLength);
			}
			}else{
				translate([-MiniServoThickness()/2,-MiniServoCylinderDist(),-(MiniServoHeight()+MiniServoNubHeight())-ServoTolerance*2-horn_height+.5])
				{
					MiniServoBlock(boltsUp,Cylinder,ServoTolerance,hornBoltLength);
				}
			}
			}
	}else{
		if(boltsUp == true){
			translate([ServoTolerance,(MiniServoLength()-MiniServoBaseLength())/2+ServoTolerance,(-MiniServoHeight()+(MiniServoHeight()-MiniServoWingsDist())-MiniServoWingsHeight()-ServoTolerance*4)])
			{	
				MiniServoBlock(boltsUp,Cylinder,ServoTolerance,hornBoltLength);
			}
		}else{
			translate([ServoTolerance,(MiniServoLength()-MiniServoBaseLength())/2+ServoTolerance,(-MiniServoHeight()+(MiniServoHeight()-MiniServoWingsDist())-MiniServoWingsHeight()-ServoTolerance*4)])
			{	
				MiniServoBlock(boltsUp,Cylinder,ServoTolerance,hornBoltLength);
			}
		}
	}

}

module Servo_horn()
{
	union()
	{
		cylinder(r=5.6/2, h=MiniServoHornHeight());
		translate([0, -5.6/2, MiniServoHornHeight()-.9])
		{
			cube([17.75, 5.6, .9]);
		}
		translate([13.3, -9.5/2, MiniServoHornHeight()-.9])
		{
			cube([4.4, MiniServoHornMaxWidth(), .9]);
		}
		for (i = [0:4])
		{
			translate([5.25+i*2.4, 0, MiniServoHornHeight()-.9])
			cylinder(r=MiniServoHornBoltDiam()/2, h=5.7, $fn=10);
		}
		for (i = [0:1])
		{
			translate([5.25+4*2.4, -2.9+(2.9*2*i), MiniServoHornHeight()-.9])
			cylinder(r=MiniServoHornBoltDiam()/2, h=5.7, $fn=10);
		}
	}	
}
	
MiniServoMotor(true, 2, false, .2);






