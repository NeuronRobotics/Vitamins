use <../Vitamins/Structural/SteelRod/8mm_Rod_Vitamin.scad>
use<../Vitamins/Structural/LinearBearings/LM8UU_Linear_Bearing_Vitamin.scad>

function mm(i) = i*25.4; 

//Build dimensions (x,y,z)-- x, y and z of printable area, NOT of overall device

//z-rod length, diameter-- dependent on which rods you buy
//(bearing diameter is dependent on rod diameter)


function RodEndSpacing()= 108.4;// this is a magic number

function ZrodSpacing()=RodEndSpacing()-LM8UULinearBearingDiam()*2-PlasticWidth()*4;
echo(ZrodSpacing());

//parametric of which hotend is being used (printerbot or bucha nozzle)

//stepper vs servo

//3 parameters (1 for each link) horizontal vs vertical

//paper is a parametric vitamin

//distance between link arms will be calculable based on radius of toolplate

//tolerances
//function LaserCutTolerance() = .02;
function 3dPrinterTolerance() = .4;



//the equation used for plastic width, it can of course be changed
function PlasticWidth()= (8mmRodDiameter()/2);
function SideWidth() = (8mmRodDiameter()+PlasticWidth());
echo(PlasticWidth());