//use <Parameters.scad>
use <RodEndClips.scad>

//I just set this to an arbitrary number since it should probably be a function of the encoder width or something but I'm not sure that is really your choice.
function CarriageWidth()=40;

module CarriageRodEndClip()
{
	translate([0,-CarriageWidth(),0])
	{
		RodEndClips();
	}
}

//CarriageRodEndClip();

module FillInSphere()
{	
	translate([CarriageWidth()*1.5,0,0])
	{
		cylinder(r=CarriageWidth()*.3, h=RodEndClipHeight(), $fn=30);
	}
}
	

module CarriageRodEndClips()
{
	union()
	{
		CarriageRodEndClip();
		rotate([0,0,120])
		{
			CarriageRodEndClip();
		}
		rotate([0,0,240])
		{
			CarriageRodEndClip();
		}
		rotate([0,0,-30])
		{
			FillInSphere();
		}
		rotate([0,0,90])
		{
			FillInSphere();
		}
		
		rotate([0,0,210])
		{
			FillInSphere();
		}
	}
}

module Carriage();
{
	union()
	{
		difference()
		{
			cylinder(r=CarriageWidth()*1.5, h=RodEndClipHeight(), $fn=100);
			translate([0,0,-1])
			{
				cylinder(r=CarriageWidth(), h=RodEndClipHeight()+2, $fn=100);
			}
		}
		CarriageRodEndClips();
	}
}

Carriage();

//so uh, I guess make a way for your extruder to mount, figure out the fan mount, and make sure things scale okay.

//I'm sure you'll notice but the fill in cylinders as they are kind of encroach into the rod end clip space, and also don't totally fill in the available area, but I'll leave those problems for you to deal with (since everything will probably need to get rescaled anyway)

