//this is the standard hex bit driver


module hexbit(3dPrinterTolerance,bitradius,bitheight){
	cylinder($fn=6,r=bitradius+3dPrinterTolerance/2,h=bitheight);
}

hexbit(.4,7.2/2,25);
