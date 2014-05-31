

module StraightSupport(height=1,cut=true){
	translate([0,0,-height])
	linear_extrude(height = height, center = false, convexity = 10)
		projection(cut = cut){
			union(){
				for (i = [0 : $children-1])
					child(i);
			 }
	}
}


	translate([0,0,10]){
		#cube([10,10,5]);
		StraightSupport(10){
			cube([10,10,5]);
		}
	}
