//this is the standard hex bit driver


module hexbit(bitradius,bitheight){
	cylinder($fn=6,r=bitradius,h=bitheight);
}

hexbit(7.2/2,25);
