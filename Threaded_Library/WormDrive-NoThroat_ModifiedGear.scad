use <Thread_Library.scad>
use <MCAD/involute_gears.scad>

function WormDriveNumberTeeth()=25;
function WormDrivePitchRadius()=40;
function WormDriveGearThickness()=15;


function WormDriveGearRadius()=15;
function WormDrivePitch()=2*3.1415*WormDrivePitchRadius()/WormDriveNumberTeeth();

function WormDriveGearAngle()=-360*$t;
function WormDriveGearOffset()=4;


module CanvasPulleyGear()
{
	scale([0.5,0.5,0.5])
	rotate([0,0,WormDriveGearOffset()-WormDriveGearAngle()/WormDriveNumberTeeth()])	
	gear ( 
		number_of_teeth=WormDriveNumberTeeth(),
		circular_pitch=360*WormDrivePitchRadius()/WormDriveNumberTeeth(),
		pressure_angle=20,
		clearance = 0,
		gear_thickness=WormDriveGearThickness(),
		rim_thickness=WormDriveGearThickness(),
		rim_width=5,
		hub_thickness=WormDriveGearThickness(),
		hub_diameter=10,
		bore_diameter=5,
		circles=0,
		backlash=0.1,
		twist=-WormDrivePitchRadius()/WormDriveGearRadius(),
		involute_facets=0,
		flat=false);
}

CanvasPulleyGear();