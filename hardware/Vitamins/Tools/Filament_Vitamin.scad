function FilamentDiam(3dPrinterTolerance=.4)=1.75+3dPrinterTolerance;
function FilamentHeight()=100;
module Filament()
{
	$fn=50;
	cylinder(h=FilamentHeight(), r=FilamentDiam(.4)/2);
}

translate([5,0,0]){
Filament();
}


//teardrop shape for better accuracy when printing long tubes:

module teardrop(radius, length, angle) {
        rotate([0, angle, 0]) union() {
                linear_extrude(height = length, center = true, convexity = radius, twist = 0)
                	circle(r = radius, center = true, $fn = 30);
                linear_extrude(height = length, center = true, convexity = radius, twist = 0)
                	projection(cut = false) rotate([0, -angle, 0]) translate([0, 0, radius * sin(45) * 1.5]) cylinder(h = radius * sin(45), r1 = radius * sin(45), r2 = 0, center = true, $fn = 30);
        }
}

module FilamentTeardrop(){
	translate([0,0,FilamentHeight()/2]){
		rotate([0,90,90]){
			teardrop(FilamentDiam(.7)/2,FilamentHeight(),90);
		}
	}
}

FilamentTeardrop();
