function BusinessCardThickness(3dPrinterTolerance=.4)= 0.3+3dPrinterTolerance;  
function BusinessCardWidth(3dPrinterTolerance=.4)= 51+3dPrinterTolerance;  
function BusinessCardLength(3dPrinterTolerance=.4)= 89+3dPrinterTolerance;  

module BusinessCard()
{
	cube([BusinessCardLength(), BusinessCardWidth(), BusinessCardThickness()]);
}

BusinessCard();