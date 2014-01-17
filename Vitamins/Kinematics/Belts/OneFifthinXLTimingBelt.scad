function 2XLBeltBaseHeight(3dPrinterTolerance=.4)= 1.3 + 3dPrinterTolerance;
function 2XLBeltGripHeight(3dPrinterTolerance=.4)= 2.5 + .5 + 3dPrinterTolerance;
function 2XLBeltToothWidth(3dPrinterTolerance=.4)= 2.2 + 3dPrinterTolerance;
function 2XLBeltSpaceWidth(3dPrinterTolerance=0)= 2.6 + 3dPrinterTolerance;
function 2XLBeltWidth(3dPrinterTolerance=.4)= 6.4 + 3dPrinterTolerance;
function 2XLBeltPitch()= 5.08;
function 2XLBeltSlotWidth(3dPrinterTolerance=.4)=2XLBeltWidth(3dPrinterTolerance)*1.2;


function 2XLBeltAvgHeight(3dPrinterTolerance=.4)=(2XLBeltBaseHeight()+2XLBeltGripHeight()*2)/3;


module 2XLTimingBelt(3dPrinterTolerance=.4, Length=70,) {
	cube([Length,2XLBeltWidth(3dPrinterTolerance),2XLBeltBaseHeight(3dPrinterTolerance)]) ;
	for (inc = [0:(2XLBeltToothWidth(3dPrinterTolerance)
+2XLBeltSpaceWidth(0)-3dPrinterTolerance):Length-2XLBeltToothWidth(3dPrinterTolerance)]) translate([inc,0,2XLBeltBaseHeight(3dPrinterTolerance)-.5]) #cube([2XLBeltToothWidth(3dPrinterTolerance)
,2XLBeltWidth(3dPrinterTolerance),(2XLBeltGripHeight(3dPrinterTolerance)-2XLBeltBaseHeight(3dPrinterTolerance))]) ;
}

color("blue")
2XLTimingBelt(0);

translate([0,10,0])
color("red")
2XLTimingBelt(.4, 100);

module 2XLTimingBeltSlot(3dPrinterTolerance=.4, Length=70)
union()
{
	translate([0,2XLBeltSlotWidth(3dPrinterTolerance)-.1,0])
	{
		cube([Length,2XLBeltSlotWidth(3dPrinterTolerance),2XLBeltGripHeight()]);
	}
	 
	cube([Length,2XLBeltSlotWidth(3dPrinterTolerance),2XLBeltBaseHeight(3dPrinterTolerance)]) ;
	for (inc = [	0:	
	            	(2XLBeltToothWidth(3dPrinterTolerance)+2XLBeltSpaceWidth(0)-3dPrinterTolerance):
	            	Length-2XLBeltToothWidth(3dPrinterTolerance)]){
		translate([	inc-3dPrinterTolerance*1.4,
		           	0,
		           	2XLBeltBaseHeight(3dPrinterTolerance)-.6]) 
		           		cube([	2XLBeltToothWidth(3dPrinterTolerance*2),
		           		      	2XLBeltSlotWidth(3dPrinterTolerance),
		           		      	(2XLBeltGripHeight(3dPrinterTolerance*2)-2XLBeltBaseHeight(3dPrinterTolerance))]) ;
	}

}

translate([0,-25,0])
2XLTimingBeltSlot();