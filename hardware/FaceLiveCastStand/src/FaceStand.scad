
function getMaterialThickness() = 5.4;

module slot(){
	translate([-.5,0,-.5])
		cube([24,getMaterialThickness(),getMaterialThickness()+1]);
}

module placeMountingPlate(){
	translate(	[175,175,0]){
		rotate([0,0,135]){
				for (i = [0 : $children-1]){
						child(i);
				 }
			}
		}
}

module stand(){
	difference(){
		union(){
			cube([294,294,getMaterialThickness()]);
		}
		translate([75,0,0]){
			rotate([0,0,90])
					slot();
		}
		translate([150,0,0]){
			rotate([0,0,90])
					slot();
		}
		translate([225,0,0]){
			rotate([0,0,90])
					slot();
		}
		placeMountingPlate(){
			rotate([0,0,90])
					slot();
			translate([-200,-200,-.5])
				cube([400,200,getMaterialThickness()+1]);
			translate([-100,-1,-.5])
				cube([50,50,getMaterialThickness()+1]);
			translate([50,-1,-.5])
				cube([300,300,getMaterialThickness()+1]);
		}
		translate([160,50,-.5])
				cube([200,60,getMaterialThickness()+1]);
	}
}

module support(){
	
	difference(){
		cube([24*2,24*4,getMaterialThickness()]);
		translate([0,24*2-getMaterialThickness()/2,0])
			slot();
	}
}

module faceStandSheet(){
	union(){
		stand();
		translate([275,55,0])
			rotate([0,0,90])
				support();
		
		translate([275,175,0])
					rotate([0,0,90])
						support();
		
		translate([90,175,0])
					rotate([0,0,135])
						support();
		translate([190,275,0])
					rotate([0,0,135])
						translate([0,40,0])
							support();
	}

}
projection(cut=false){ 
	faceStandSheet();
}