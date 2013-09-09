$fn=50;

function HotEndDiam() = 16;
function HotEndRecessDiam() = 7;
function HotEndRecessHeight() = 2;
function HotEndRecessDepth() = 1.95;
function HotEndRecessOffset() = 2.6;
function HotEndLength() = 58;

module HotEnd(ScrewChannel=false,3dPrinterTolerance=.4){
	if(ScrewChannel==false){	
		cylinder(HotEndLength(),HotEndDiam()/2+3dPrinterTolerance,HotEndDiam()/2+3dPrinterTolerance);
	}else{
		difference(){
			cylinder(HotEndLength(),HotEndDiam()/2+3dPrinterTolerance,HotEndDiam()/2+3dPrinterTolerance);
			translate([0,0,HotEndLength()-HotEndRecessOffset()]){
				difference(){
					cylinder(HotEndRecessHeight(),HotEndDiam()/2+1+3dPrinterTolerance,HotEndDiam()/2+1+3dPrinterTolerance);
					cylinder(HotEndRecessHeight(),(HotEndDiam()-HotEndRecessDepth())/2+.4+3dPrinterTolerance,(HotEndDiam()-HotEndRecessDepth())/2+.4+3dPrinterTolerance);
				}
			}
		}
	}
}

HotEnd(true,.4);		