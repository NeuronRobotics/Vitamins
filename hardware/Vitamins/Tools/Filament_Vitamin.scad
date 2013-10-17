function FilamentDiam(3dPrinterTolerance=.4)=1.75+(3dPrinterTolerance);
function FilamentHeight()=100;
module Filament()
{
	$fn=50;
	cylinder(h=FilamentHeight(), r=FilamentDiam()/2);
}

Filament();


