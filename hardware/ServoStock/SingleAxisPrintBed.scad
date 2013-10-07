use <Parameters.scad>
use <BearingCap.scad>	
use <Clips.scad>	
use <StructuralBearingMount2.scad>
use <Pulley.scad>
use <Slider.scad>
use <IdlerBearingPlug.scad>
use <IdlerBearingClip.scad>

use <StructuralFeet.scad>

//rotating the module, as it would be rotated for printing
translate([0,0, MotorBracketHeight()])
{
	rotate([0,180,90])
	{
		StructuralFeet();
	}
}
translate([0,50,0])
	StructuralBearingMount(3);

translate([60,0,0])
	servo_pulley(true,true);

translate([-55,0,0])
	rotate([0,0,90])
		Slider(false, 1);

translate([0,-65,0]){
	IdlerBearingPlug();
	IdlerBearingClip();
}