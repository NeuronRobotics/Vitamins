function LM8UULinearBearingDiam(3dPrinterTolerance=.4) = 15+3dPrinterTolerance*2;
function LM8UULinearBearingInnerDiam(3dPrinterTolerance=.4) = 8.3+3dPrinterTolerance*2;
function LM8UULinearBearingHeight(3dPrinterTolerance=.4) = 24+3dPrinterTolerance;
function LM8UULinearBearingRidgeOffset(3dPrinterTolerance=.4)= 4.6+3dPrinterTolerance/2;

module LM8UUBearing(3dPrinterTolerance=.4)
{
cylinder(LM8UULinearBearingHeight(3dPrinterTolerance), LM8UULinearBearingDiam(3dPrinterTolerance)/2, LM8UULinearBearingDiam(3dPrinterTolerance)/2);
}


LM8UUBearing();