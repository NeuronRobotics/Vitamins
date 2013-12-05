use <../../Fasteners/Screws/High_Low_Screw_Vitamin.scad>

function EncoderWidth(3dPrinterTolerance=.4)=35.5+ 3dPrinterTolerance;
function EncoderHeight(3dPrinterTolerance=.4)=25+ 3dPrinterTolerance;
function EncoderThickness(3dPrinterTolerance=.4)=3+ 3dPrinterTolerance;

function EncoderBoltWidth(3dPrinterTolerance=.4)=3+ 3dPrinterTolerance;
function EncoderBoltLength(3dPrinterTolerance=.4)=20+ 3dPrinterTolerance;
function EncoderBoltInset(3dPrinterTolerance=.4)=2.2+ 3dPrinterTolerance/2;

function EncoderLongBoxWidth(3dPrinterTolerance=.4)=9+ 3dPrinterTolerance;

function EncoderShortBoxWidth(3dPrinterTolerance=.4)=10+ 3dPrinterTolerance;
function EncoderShortBoxLength(3dPrinterTolerance=.4)=13.5+ 3dPrinterTolerance;
function EncoderShortBoxInset(3dPrinterTolerance=.4)=7+ 3dPrinterTolerance/2;

function EncoderBoxHeight(3dPrinterTolerance=.4)=9+EncoderThickness()+ 3dPrinterTolerance;

function EncoderChipSide(3dPrinterTolerance=.4)=4.25+ 3dPrinterTolerance;
function EncoderChipHeight(3dPrinterTolerance=.4)= 1+ 3dPrinterTolerance;
function EncoderChipOffset(3dPrinterTolerance=.4)=4+ 3dPrinterTolerance/2;

//this sort of forces the HiLo screw down so it is closer to the encoder and the encoder doesn't wiggle as much, feel free to change to 0 if you don't want it.
function HiLoOffset()=1.5;


module Encoder(Bolts=true, 3dPrinterTolerance=.4)
{
	//centers the encoder on the chip, which is the important part
	translate([-EncoderWidth(3dPrinterTolerance)/2,-EncoderChipOffset(3dPrinterTolerance)-EncoderChipSide(3dPrinterTolerance)/2,0])
	{
		union()
		{
	//base
			cube([EncoderWidth(3dPrinterTolerance), EncoderHeight(3dPrinterTolerance), EncoderThickness(3dPrinterTolerance)]);
	//chip
			translate([EncoderWidth(3dPrinterTolerance)/2-EncoderChipSide(3dPrinterTolerance)/2, EncoderChipOffset(3dPrinterTolerance), -EncoderChipHeight(3dPrinterTolerance)])
			{
				cube([EncoderChipSide(3dPrinterTolerance), EncoderChipSide(3dPrinterTolerance),EncoderChipHeight(3dPrinterTolerance)]);
			}
	//boxes
			translate([EncoderShortBoxInset(3dPrinterTolerance)+EncoderShortBoxWidth(3dPrinterTolerance),0,0])
			{
				cube([EncoderLongBoxWidth(3dPrinterTolerance), EncoderHeight(3dPrinterTolerance), EncoderBoxHeight(3dPrinterTolerance)]);
			}
			translate([EncoderShortBoxInset(3dPrinterTolerance),EncoderHeight(3dPrinterTolerance)-EncoderShortBoxLength(3dPrinterTolerance),0])
			{ 
				cube([EncoderShortBoxWidth(3dPrinterTolerance), EncoderShortBoxLength(3dPrinterTolerance), EncoderBoxHeight(3dPrinterTolerance)]);
			}
if(Bolts==true)
	{
	//screws
			translate([EncoderBoltInset(3dPrinterTolerance),EncoderBoltInset(3dPrinterTolerance),-EncoderBoltLength(3dPrinterTolerance)/2])
			{
				cylinder(EncoderBoltLength(3dPrinterTolerance), EncoderBoltWidth(3dPrinterTolerance)/2, EncoderBoltWidth(3dPrinterTolerance)/2);
			}
			translate([EncoderWidth(3dPrinterTolerance)-EncoderBoltInset(3dPrinterTolerance),EncoderBoltInset(3dPrinterTolerance),-EncoderBoltLength(3dPrinterTolerance)/2])
			{
				cylinder(EncoderBoltLength(3dPrinterTolerance), EncoderBoltWidth(3dPrinterTolerance)/2, EncoderBoltWidth(3dPrinterTolerance)/2);
			}
			translate([EncoderBoltInset(3dPrinterTolerance),EncoderHeight(3dPrinterTolerance)-EncoderBoltInset(3dPrinterTolerance),-EncoderBoltLength(3dPrinterTolerance)/2])
			{
				cylinder(EncoderBoltLength(3dPrinterTolerance), EncoderBoltWidth(3dPrinterTolerance)/2, EncoderBoltWidth(3dPrinterTolerance)/2);
			}
			translate([EncoderWidth(3dPrinterTolerance)-EncoderBoltInset(3dPrinterTolerance),EncoderHeight(3dPrinterTolerance)-EncoderBoltInset(3dPrinterTolerance),-EncoderBoltLength(3dPrinterTolerance)/2])
			{
				cylinder(EncoderBoltLength(3dPrinterTolerance), EncoderBoltWidth(3dPrinterTolerance)/2, EncoderBoltWidth(3dPrinterTolerance)/2);
			}
	}else{}
		}
	}
}

//This is the encoder, complete with its encoder bolts (though bolts can be removed by changing the boolean to "false". It is shown in red.
translate([0,0,0])
{
	//color("Red")
	Encoder(true);
}


module Encoder_Keepaway(HiLo=true, 3dPrinterTolerance=.4)
{
	union()
	{
		Encoder(3dPrinterTolerance);
		translate([-EncoderWidth(3dPrinterTolerance)/2, -EncoderHeight(3dPrinterTolerance)+EncoderChipOffset(3dPrinterTolerance), 0])
		{
			cube([EncoderWidth(3dPrinterTolerance),EncoderThickness(3dPrinterTolerance)*8, EncoderThickness(3dPrinterTolerance)]);
		}
		translate([-(EncoderLongBoxWidth(3dPrinterTolerance)+EncoderShortBoxWidth(3dPrinterTolerance))/2-1,-(EncoderHeight(3dPrinterTolerance)+EncoderThickness(3dPrinterTolerance)*8)/2-1,0])
		{
			cube([EncoderLongBoxWidth(3dPrinterTolerance)+EncoderShortBoxWidth(3dPrinterTolerance)+1,EncoderHeight(3dPrinterTolerance)+EncoderThickness(3dPrinterTolerance)*16,EncoderHeight(3dPrinterTolerance)]);
		}
		//screws
		if(HiLo==true)
		{
			translate([-EncoderWidth()/2+EncoderThickness(),-EncoderChipOffset(3dPrinterTolerance)-EncoderThickness(3dPrinterTolerance)*1.2-3dPrinterTolerance+HiLoOffset(),EncoderBoltLength(3dPrinterTolerance)/2])

			{
				#HiLoScrew(3dPrinterTolerance-.05);
			}
			translate([EncoderWidth()/2-EncoderThickness(),-EncoderChipOffset(3dPrinterTolerance)-EncoderThickness(3dPrinterTolerance)*1.2-3dPrinterTolerance+HiLoOffset(),EncoderBoltLength(3dPrinterTolerance)/2])		
			{
				#HiLoScrew(3dPrinterTolerance-.05);
			}
		}else{}
	}
}

//This is the encoder with a keepaway, this is done so that you can fit the encoder into a slot, and use HiLo screws to hold it in, rather than purchasing the specific encoder bolts.
translate([50,0,0])
{
	union()
	{
		//Encoder(false);
		//%Encoder_Keepaway(true);
	}
}


