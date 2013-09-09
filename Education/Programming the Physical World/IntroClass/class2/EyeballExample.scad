
module eye(size=100,eyeOrentationX=0,eyeOrentationY=0){
	cynandarSize = (size/2);
	innerCynandarSize =  (cynandarSize*.50);
	rotate([0,eyeOrentationY,eyeOrentationX]){
		difference(){
			sphere(size);
			translate([size*.95,0,0]){
				rotate([0,90,0]){
					difference(){
						cylinder(size/10,cynandarSize,cynandarSize,true);
						cylinder(size/10,innerCynandarSize,innerCynandarSize,true);
					}
				}
			}	
		}
	}
}

module eyeLid(size=100,upper=true,angle=0){
	echo(angle);
	
	rotate([0,angle,0]){
		difference(){
			difference(){
				sphere(size*1.1);
				sphere(size);
			}
			if(upper != true){
				translate([-size*1.1,-size*1.1,0]){
					cube(size*2.5,size*2.5,size*2.5);
				}
			}
			if(upper == true){
				translate([-size*1.1,-size*1.1,-size*2.5]){
					cube(size*2.5,size*2.5,size*2.5);
				}
			}		

		}
	}
}

module cartoonEye(size=100,
upperEyeLidAngle=20,lowerEyeLidAngle=10, 
eyeOrentationX=30,eyeOrentationY=0)
{
	eye(size,eyeOrentationX,eyeOrentationY);	
	eyeLid(size=size,upper=true,angle=(((upperEyeLidAngle+5)*-1) + eyeOrentationY));
	eyeLid(size=size,upper=false,angle=((lowerEyeLidAngle+5) + eyeOrentationY));
}

cartoonEye();
