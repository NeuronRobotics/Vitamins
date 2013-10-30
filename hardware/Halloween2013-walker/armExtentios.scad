

module armStilts(thickness = ((25.4*3)/4)){
	
	linear_extrude(height = thickness, center = true, convexity = 10){
	   //import (file = "0.dxf");
	   import (file = "armStilt_.dxf");
	}
}

#armStilts();