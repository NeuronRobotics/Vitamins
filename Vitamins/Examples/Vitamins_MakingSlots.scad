//Sometimes it might be necessary to make a slot that a vitamin can fit into

//For example, let's make a slot for the encoder.

use <../Sensors/Encoders/Encoder_Vitamin.scad>

module EncoderBoxNoSlot()
{
	difference()
	{
		cube(size=[50,50,50], center=true);
		translate([-20,0,0])
		{
			rotate([-90,0,90])
			{
				%Encoder();
			}
		}
	}
}

//if the encoder is introduced with no slot, then there would be no way to get it into the hole that it is meant to occupy (shown in red).

translate([0,50,0])
{
	color("Red")
	EncoderBoxNoSlot();
}

//If we make the encoder box effectively larger, we can make a larger cutout and create a slot for the user to slide the encoder in before securing it


module EncoderBoxSlot()
{
	difference()
	{
		cube(size=[50,50,50], center=true);
		translate([-20,0,0])
		{
			rotate([-90,0,90])
			{
				union()
				{
					%Encoder();
//note how I can pull the encoder dimensions from my encoder file, making a slot exactly the size of the encoder. This is the major benefit of doing "use" and pulling in .scad files, over "include" with .stl files.
					translate([0,0,2])
					{
						cube(size=[EncoderWidth(), 51, EncoderThickness()], center=true);
					}
					translate([0,0,5])
					{
						cube(size=[EncoderLongBoxWidth()+EncoderShortBoxWidth()+5, 51, EncoderBoxHeight()], center=true);
					}
				}
			}
		}
	}
}

//Here is the encoder complete with slot, shown in blue.
translate([0,-50,0])
{
	color("Blue")
	EncoderBoxSlot();
}
