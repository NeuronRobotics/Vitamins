function BoxWidth(3dPrinterTolerance=.4)=100+3dPrinterTolerance;
function BoxHeight(3dPrinterTolerance=.4)=150+3dPrinterTolerance;
function HubDiameter(3dPrinterTolerance=.4)=70+3dPrinterTolerance;
function HubHeight(3dPrinterTolerance=.4)=180+3dPrinterTolerance;
function ShaftDiameter(3dPrinterTolerance=.4)=20+3dPrinterTolerance;
function ShaftHeight(3dPrinterTolerance=.4)=220+3dPrinterTolerance;

module GenericStepper(3dPrinterTolerance=.4)
{
color("Gray")
rotate([0,90,0])
{
	translate([0,0,-BoxHeight(3dPrinterTolerance)])
		{
		union()
			{
			cylinder(ShaftHeight(3dPrinterTolerance), ShaftDiameter(3dPrinterTolerance)/2, ShaftDiameter(3dPrinterTolerance)/2);
			cylinder(HubHeight(3dPrinterTolerance), HubDiameter(3dPrinterTolerance)/2, HubDiameter(3dPrinterTolerance)/2);
			translate([-BoxWidth(3dPrinterTolerance)/2,-BoxWidth(3dPrinterTolerance)/2,0])
				{
				cube([BoxWidth(3dPrinterTolerance), BoxWidth(3dPrinterTolerance), BoxHeight(3dPrinterTolerance)]);
				}
			}
		}
	}
}

GenericStepper(.4);
