$fn=50;

function ConnectorLength() = 14;
function ConnectorWidth() = 8.4; 
function ConnectorHeight() = 3.5;

//Note: each pin is approximately 2.25mm wide.  this is a 3 pin connector.

module ServoConnector(3dPrinterTolerance=.4){
	translate(-[(ConnectorLength()+3dPrinterTolerance)/2,(ConnectorWidth()+3dPrinterTolerance)/2,(ConnectorHeight()+3dPrinterTolerance)/2]){
		cube([ConnectorLength()+3dPrinterTolerance,ConnectorWidth()+3dPrinterTolerance,ConnectorHeight()+3dPrinterTolerance]);
	}
}

ServoConnector(.4);
