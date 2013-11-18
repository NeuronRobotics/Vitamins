function 608BallBearingDiam(3dPrinterTolerance=.4) = 22+3dPrinterTolerance;
function 608BallBearingHeight(3dPrinterTolerance=.4) = 7+3dPrinterTolerance;
function 608BallBearingInnerDiam(3dPrinterTolerance=.4)= 8-3dPrinterTolerance;

function 608BallBearingAvgDiam(3dPrinterTolerance=.4)= (608BallBearingDiam(3dPrinterTolerance)+608BallBearingInnerDiam(3dPrinterTolerance))/2;


module 608BallBearing(3dPrinterTolerance=.4)
{
	union()
	{
		cylinder(608BallBearingHeight(3dPrinterTolerance), 608BallBearingDiam(3dPrinterTolerance)/2, 608BallBearingDiam(3dPrinterTolerance)/2, 0);
		//cylinder(608BallBearingHeight(3dPrinterTolerance), 608BallBearingInnerDiam(3dPrinterTolerance)/2, 608BallBearingInnerDiam(3dPrinterTolerance)/2);
	}
}

608BallBearing();