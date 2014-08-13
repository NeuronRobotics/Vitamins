//the wood screw used in the wormtown extruder.

$fn=50;

screwlength=41;
threadlength=35;
shanklength=3.3;
headlength=screwlength-threadlength-shanklength;
echo ("headlength is", headlength);
threaddiam=4.45;
threadrad=threaddiam/2;
shankdiam=2.5;
shankrad=shankdiam/2;
headdiam=8.47;
headrad=headdiam/2;


module woodscrew(3dprintertolerance=.4){
	union(){
		cylinder(h=screwlength,r=threadrad);
		translate([0,0,threadlength+shanklength]){
			cylinder(headlength,d1=shankdiam,d2=headdiam);
			}
		translate([0,0,screwlength]){
			cylinder(h=1,d=headdiam);
		}
	}
}


woodscrew(.4);
	
