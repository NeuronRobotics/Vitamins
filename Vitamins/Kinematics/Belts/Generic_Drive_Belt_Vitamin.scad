

function GenericDriveBeltWidth(3dPrinterTolerance=.4)= 6.1 + 3dPrinterTolerance; //normally 6.1
function GenericDriveBeltBaseHeight(3dPrinterTolerance=.4)= .8 + 3dPrinterTolerance;
function GenericDriveBeltGripHeight(3dPrinterTolerance=.4)= 1.3 + 3dPrinterTolerance;
function GenericDriveBeltAvgHeight(3dPrinterTolerance=.4)=(GenericDriveBeltBaseHeight()+GenericDriveBeltGripHeight()*2)/3;