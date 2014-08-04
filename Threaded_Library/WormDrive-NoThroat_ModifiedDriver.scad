use <Thread_Library.scad>

function numberTeeth()=25;
function pitchRadius()=40;
function thickness()=15;


function wormLength()=60;
function wormRadius()=15;
function pitch()=2*3.1415*pitchRadius()/numberTeeth();

function wormAngle()=-360*$t;
function wormOffset()=4;

//distance=radius+pitchRadius+0.0*pitch;



module WormDriver()
{
	//making it smaller
	scale([0.5,0.5,0.5])
	{
		rotate([0,0,180+wormAngle()])
		trapezoidThread( 
			length=wormLength(), 			// axial length of the threaded rod
			pitch=pitch(),				 // axial distance from crest to crest
			pitchRadius=wormRadius(), 		// radial distance from center to mid-profile
			threadHeightToPitch=0.5, 	// ratio between the height of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
			profileRatio=0.5,			 // ratio between the lengths of the raised part of the profile and the pitch
						// std value for Acme or metric lead screw is 0.5
			threadAngle=20, 			// angle between the two faces of the thread
						// std value for Acme is 29 or for metric lead screw is 30
			RH=true, 				// true/false the thread winds clockwise looking along shaft, i.e.follows the Right Hand Rule
			clearance=0.2, 			// radial clearance, normalized to thread height
			backlash=0.06, 			// axial clearance, normalized to pitch
			stepsPerTurn=24 			// number of slices to create per turn
			);
	}
}

WormDriver();