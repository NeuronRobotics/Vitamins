$fn=50;

function HotEndDiam() = 16;
function HotEndRecessDiam() = 7;
function HotEndRecessLength() = 4.55;
function HotEndRecessDepth() = 2;
function HotEndRecessOffset() = 10;
function HotEndLength() = 50;

module HotEnd(ScrewChannel=false,3dPrinterTolerance=.4){
rotate([0,90,0]){
	if(ScrewChannel==false){	
		cylinder(h=HotEndLength(),r=HotEndDiam()/2+3dPrinterTolerance);
	}else{
		difference(){
			cylinder(h=HotEndLength(),r=HotEndDiam()/2+3dPrinterTolerance);
			translate([0,0,HotEndLength()-HotEndRecessOffset()]){
				difference(){
					cylinder(h=HotEndRecessLength(),r=HotEndDiam()/2+1+3dPrinterTolerance);
					cylinder(h=HotEndRecessLength(),r=(HotEndDiam()-HotEndRecessDepth()*2)/2+.4+3dPrinterTolerance);
				}
			}
		}
	}
}
}

HotEnd(true,.4);		