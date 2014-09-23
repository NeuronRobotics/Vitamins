//this is the small servo motor screw.
$fn=100;
union(){
	cylinder(r=1.28, h=9.25);
	translate([0,0,9.25]){
		cylinder(r=5.3/2, h=2);
	}
}
