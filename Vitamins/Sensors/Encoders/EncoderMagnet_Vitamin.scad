$fn=100;

function MagnetDiam(3dPrinterTolerance=.4) = 3.5+3dPrinterTolerance;
function MagnetLength(3dPrinterTolerance=.4) = 6.35+3dPrinterTolerance;

module EncoderMagnet(Cylinder=true,3dPrinterTolerance=.4){

	if(Cylinder==true){
		cylinder(MagnetLength(3dPrinterTolerance),MagnetDiam(3dPrinterTolerance)/2,MagnetDiam(3dPrinterTolerance)/2);
	}else{
	translate([-(MagnetDiam(3dPrinterTolerance))/2,-(MagnetDiam(3dPrinterTolerance))/2,0]){
		cube([MagnetDiam(3dPrinterTolerance),MagnetDiam(3dPrinterTolerance),MagnetLength(3dPrinterTolerance)]);
		}
	}
}

module MagnetDraft(3dPrinterTolerance=.4){
	union(){
		EncoderMagnet(true,.4);
		translate([0,0,MagnetLength(3dPrinterTolerance)/2])
			cylinder(MagnetLength(3dPrinterTolerance)/2,MagnetDiam(3dPrinterTolerance)/2,MagnetDiam(3dPrinterTolerance)/2+MagnetDiam(3dPrinterTolerance)/6);
	}
}
	
MagnetDraft(.4);