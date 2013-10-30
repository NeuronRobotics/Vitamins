use <Extruder.scad>;
use <ExtruderIdlerWheel.scad>;
use <Extruder_Encoder_Keepaway.scad>;
use <../Vitamins/Sensors/Encoders/EncoderMagnet_Vitamin.scad>;

translate([ExtruderLength(.4)/2,-ExtruderWidth(.4)/2,0]){mirror([1,0,0]){Extruder(true,.4);}}

translate([ExtruderLength(.4)/2,ExtruderWidth(.4)/2,0]){Extruder(false,.4);}

translate([-ExtruderIdlerWheelDiam()/2,ExtruderIdlerWheelDiam()/2-1,MagnetLength()+ExtruderIdlerWheelThickness()/2]){rotate([0,180,0]){IdlerWheel(.4);}}

translate([-ExtruderIdlerWheelDiam()/2,ExtruderIdlerWheelDiam()*1.5,MagnetLength()+ExtruderIdlerWheelThickness()/2]){rotate([0,180,0]){IdlerWheel(.4);}}

translate([-GripLength(.4),-GripSpacing(.4),GripHeight(.4)]){mirror([0,0,1]){EncoderHousing(true);}}