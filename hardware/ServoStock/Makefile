CFILES :=	$(wildcard *.scad) 
OFILES := 	$(CFILES:%.scad=%.stl)

all:clean $(OFILES)
	openscad -o 

extruder:clean
	openscad -o	Extruder_Encoder_Keepaway.stl 	Extruder_Encoder_Keepaway.scad
	openscad -o Extruder.stl 					Extruder.scad 					
	openscad -o ExtruderIdlerWheel.stl 			ExtruderIdlerWheel.scad 		

%.stl: %.scad
	openscad -o $@ $<

clean:
	rm -rf $(OFILES)
