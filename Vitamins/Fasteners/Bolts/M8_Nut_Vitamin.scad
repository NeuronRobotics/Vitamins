function M8NutDiameter(3dPrinterTolerance=.4)= 12.4+3dPrinterTolerance;
function M8NutHeight(3dPrinterTolerance=.4)= 5.5+3dPrinterTolerance;

module M8Nut(3dPrinterTolerance=.4)
{
	cylinder(h=M8NutHeight(3dPrinterTolerance), r=M8NutDiameter(3dPrinterTolerance)/2, $fn=6);
}

//M8Nut();

module M8NutSlot(Length=50, 3dPrinterTolerance=.4)
{
	translate([0,0,-Length+M8NutHeight()*2])
	{
		cylinder(h=Length, r=M8NutDiameter(3dPrinterTolerance)/2, $fn=6);
	}
}

M8NutSlot(70);
