//OpenScadFont

//Author: Steve Miller (avrgeek on Thingiverse)
//http://www.thingiverse.com/thing:6820

/*

Usage: fnt_str(chars,char_count, block_size, height)
Example fnt_str(["H","e","l","l","o"],5,1,3);

This provides an alternate method of embedding lettering into an OpenSCAD project.  An 
open source font is exported into dxf files, and those files are linear_extruded to provide nicely 
rendered fonts.  The code is based on the bitmap font module 
(http://www.thingiverse.com/thing:2054).  The function provided by the fnt_str will map to the 
8bit_str moudule.  The block-size parameter will have no effect on the generated size of the letters.  
Make sure the "fnt-LeagueGothic" directory is contained within the directory for your project.

The font use was League Gothic from the League of Moveable Type 
(http://www.theleagueofmoveabletype.com/fonts/7-league-gothic)  This font does have variable width,
so some of the letters may look out of place.  Some manual adjustments have been made, but
OpenSCAD's immutable variables makes calculating the proper spacing difficult.  Perhaps a 
smarter person has a way of pulling this off.

Other fonts can be adapted to this module.  The Customize.txt file will contain basic instructions for
porting new fonts.



*/

/*
This work is licensed under the Creative Commons Attribution-ShareAlike 3.0 Unported License. To view a copy of this license, visit http://creativecommons.org/licenses/by-sa/3.0/; or, (b) send a letter to Creative Commons, 171 2nd Street, Suite 300, San Francisco, California, 94105, USA.
*/

//Variables
fnt_directory="fnt-LeagueGothic/";

//Test module for 
module fnt_str(chars,char_count, block_size, height) {
   //Block-size will be effectly ignored for now...may try to do something with it in the future
   char_width=5;
   echo(str("Total Width: ", char_width*char_count, "mm"));

   //Trans
   union() {
     for (count = [0:char_count-1]) {
      translate(v = [5,-2.5+count * char_width, 0])
        rotate([0,0,90]) fnt_char(chars[count], block_size, height);
     }

   }

}

module getChar(dxfString="0.dxf", height=5,scaleValue=[1,1]){
	scale(scaleValue){
			linear_extrude(height=height, convexity=10){
				import(file=str(fnt_directory,dxfString));
			}
	}
}

module fnt_char(char, block_size, height, include_base) {
  //TODO: Adjust scaling factors, determine correct "block" size.
   scale_x=8;
   scale_y=8;
   scaleValue=[scale_x,scale_y,1];
  if (char == "0") {
	  getChar("0.dxf", height,scaleValue);
  } else if (char == "1") {
	  getChar("1.dxf", height,scaleValue);
  } else if (char == "2") {
	  getChar("2.dxf", height,scaleValue);
  } else if (char == "3") {
	  getChar("3.dxf", height,scaleValue);
  } else if (char == "4") {
	  getChar("4.dxf", height,scaleValue);
  } else if (char == "5") {
	  getChar("5.dxf", height,scaleValue);
  } else if (char == "6") {
	  getChar("6.dxf", height,scaleValue);
  } else if (char == "7") {
	  getChar("7.dxf", height,scaleValue);
  } else if (char == "8") {
	  getChar("8.dxf", height,scaleValue);
  } else if (char == "9") {
	  getChar("9.dxf", height,scaleValue);
  } else if (char == "a") {
	  getChar("a-lower.dxf", height,scaleValue);
  } else if (char == "A") {
	  getChar("A.dxf", height,scaleValue);
  } else if (char == "&") {
	  getChar("amperstand.dxf", height,scaleValue);
  } else if (char == "*") {
    translate([0,2,0]) 
    		getChar("asterisk.dxf", height,scaleValue);
  } else if (char == "\\") {
	  getChar("backslash.dxf", height,scaleValue);
  } else if (char == "|") {
    translate([1.7,0,0])
    		getChar("bar.dxf", height,scaleValue);
  } else if (char == "b") {
	  getChar("b-lower.dxf", height,scaleValue);
  } else if (char == "B") {
	  getChar("B.dxf", height,scaleValue);
  } else if (char == "c") {
	  getChar("c-lower.dxf", height,scaleValue);
  } else if (char == "C") {
	  getChar("C.dxf", height,scaleValue);
  } else if (char == "-") {
    translate([1.7,4,0]) 
    		getChar("dash.dxf", height,scaleValue);
  } else if (char == "d") {
	  getChar("d-lower.dxf", height,scaleValue);
  } else if (char == "D") {
	  getChar("D.dxf", height,scaleValue);
  } else if (char == "$") {
    translate([0,-1.5,0]) 
		getChar("dollarsign.dxf", height,[scaleValue[0]-1,scaleValue[1],scaleValue[2]]);
  } else if (char == ".") {
	  getChar("dot.dxf", height,scaleValue);
  } else if (char == "''") {
    translate([0,6,0]) 
    		getChar("doublequote.dxf", height,scaleValue);
  } else if (char == "=") {
    translate([0,2.5,0]) 
				getChar("=.dxf", height,[scaleValue[0]-2,scaleValue[1],scaleValue[2]]);
  } else if (char == "_") {
	  getChar("_.dxf", height,[scaleValue[0]-2,scaleValue[1],scaleValue[2]]);
  } else if (char == ",") {
    translate([0,-1.75,0]) 
    		getChar(",.dxf", height,scaleValue);
  } else if (char == ":") {
	  getChar(":.dxf", height,scaleValue);
  } else if (char == "!") {
	  getChar("!.dxf", height,scaleValue);
  } else if (char == "(") {
	  getChar("openpar.dxf", height,scaleValue);
  } else if (char == ")") {
	  getChar("closepar.dxf", height,scaleValue);
  } else if (char == "[") {
	  getChar("[.dxf", height,scaleValue);
  } else if (char == "]") {
	  getChar("].dxf", height,scaleValue);
  } else if (char == "@") {
	  getChar("@.dxf", height,scaleValue);
  } else if (char == "#") {
	  getChar("#.dxf", height,[scaleValue[0]-3,scaleValue[1],scaleValue[2]]);
  } else if (char == "+") {
    translate([0,2,0]) 
    		getChar("+.dxf", height,scaleValue);
  } else if (char == "e") {
	  getChar("e-lower.dxf", height,scaleValue);
  } else if (char == "E") {
	  getChar("E.dxf", height,scaleValue);
  } else if (char == "f") {
	  getChar("f-lower.dxf", height,scaleValue);
  } else if (char == "F") {
	  getChar("F.dxf", height,scaleValue);
  } else if (char == "/") {
	  getChar("forwardslash.dxf", height,scaleValue);
  } else if (char == "g") {
    translate([0,-3,0]) 
    		getChar("g-lower.dxf", height,scaleValue);
  } else if (char == "G") {
	  getChar("G.dxf", height,scaleValue);
  } else if (char == ">") {
	  getChar("greaterthen.dxf", height,[scaleValue[0]-2,scaleValue[1],scaleValue[2]]);
  } else if (char == "h") {
	  getChar("h-lower.dxf", height,scaleValue);
  } else if (char == "H") {
	  getChar("H.dxf", height,scaleValue);
  } else if (char == "i") {
	  getChar("i-lower.dxf", height,scaleValue);
  } else if (char == "I") {
	  getChar("I.dxf", height,scaleValue);
  } else if (char == "j") {
     translate([0,-2.5,0])
    		 getChar("j-lower.dxf", height,scaleValue);
  } else if (char == "J") {
	  getChar("J.dxf", height,scaleValue);
  } else if (char == "k") {
	  getChar("k-lower.dxf", height,scaleValue);
  } else if (char == "K") {
	  getChar("K.dxf", height,scaleValue);
  } else if (char == "l") {
	  getChar("l-lower.dxf", height,scaleValue);
  } else if (char == "L") {
	  getChar("L.dxf", height,scaleValue);
  } else if (char == "<") {
	  getChar("lessthen.dxf", height,[scaleValue[0]-2,scaleValue[1],scaleValue[2]]);
  } else if (char == "m") {
	  getChar("m-lower.dxf", height,[scaleValue[0]-1,scaleValue[1],scaleValue[2]]);
  } else if (char == "M") {
	  getChar("M.dxf", height,[scaleValue[0]-1,scaleValue[1],scaleValue[2]]);
  } else if (char == "n") {
	  getChar("n-lower.dxf", height,scaleValue);
  } else if (char == "N") {
	getChar("N.dxf", height,[scaleValue[0]-1,scaleValue[1],scaleValue[2]]);
  } else if (char == "o") {
	  getChar("o-lower.dxf", height,scaleValue);
  } else if (char == "O") {
	  getChar("O.dxf", height,scaleValue);
  } else if (char == "p") {
     translate([0,-2.5,0]) 
    		 getChar("p-lower.dxf", height,scaleValue);
  } else if (char == "P") {
	  getChar("P.dxf", height,scaleValue);
  } else if (char == "%") {
	  getChar("percent.dxf", height,[scaleValue[0]-1.75,scaleValue[1],scaleValue[2]]);
  } else if (char == "q") {
     translate([0,-2.5,0]) 
    		 getChar("q-lower.dxf", height,scaleValue);
  } else if (char == "Q") {
     translate([0,-0.5,0]) 
    		 getChar("Q.dxf", height,scaleValue);
  } else if (char == "?") {
	  getChar("question.dxf", height,scaleValue);
  } else if (char == "r") {
	  getChar("r-lower.dxf", height,scaleValue);
  } else if (char == "R") {
	  getChar("R.dxf", height,scaleValue);
  } else if (char == "s") {
	  getChar("s-lower.dxf", height,scaleValue);
  } else if (char == "S") {
	  getChar("S.dxf", height,scaleValue);
  } else if (char == "'") {
    translate([0,6,0]) 
    		getChar("singlequote.dxf", height,scaleValue);
  } else if (char == "t") {
	  getChar("t-lower.dxf", height,scaleValue);
  } else if (char == "T") {
	  getChar("T.dxf", height,scaleValue);
  } else if (char == "u") {
	  getChar("u-lower.dxf", height,scaleValue);
  } else if (char == "U") {
	  getChar("U.dxf", height,scaleValue);
  } else if (char == "v") {
	  getChar("v-lower.dxf", height,scaleValue);
  } else if (char == "V") {
	  getChar("V.dxf", height,scaleValue);
  } else if (char == "w") {
	  getChar("w-lower.dxf", height,[scaleValue[0]-1,scaleValue[1],scaleValue[2]]);
  } else if (char == "W") {
	  getChar("W.dxf", height,[scaleValue[0]-2,scaleValue[1],scaleValue[2]]);
  } else if (char == "x") {
	  getChar("x-lower.dxf", height,scaleValue);
  } else if (char == "X") {
	  getChar("X.dxf", height,[scaleValue[0]-1,scaleValue[1],scaleValue[2]]);
  } else if (char == "y") {
     translate([0,-2.5,0]) 
    		 getChar("y-lower.dxf", height,scaleValue);
  } else if (char == "Y") {
	  getChar("Y.dxf", height,scaleValue);
  } else if (char == "z") {
	  getChar("z-lower.dxf", height,scaleValue);
  } else if (char == "Z") {
	  getChar("Z.dxf", height,scaleValue);
  } else {
    echo ("Unknown charachter: ",char);
  }

}

module fnt_test() {
    fnt_str(["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y","Z"],26,1,2);

   translate([15,0,0]) 
		fnt_str(["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"],26,1,2);

   translate([30,0,0]) 
		fnt_str(["0","1","2","3","4","5","6","7","8","9","+","-",":",".",",","?","=","*","!","''","#","$","%","&","@","'"],26,1,2);
	translate([45,0,0]) 
		fnt_str(["(",")","<",">","[","]","/","\\","_","|"],10,1,2);
}

module makeWord_LeagueGothic(wordString=" ",word_height=2.0){
	   //Block-size will be effectly ignored for now...may try to do something with it in the future
	   char_width=5;
	   char_count = len(wordString);
	   echo(str("Total Width: ", char_width*char_count, "mm"));
	   block_size=1;
	   //Trans
	   union() {
			for (count = [0:char_count-1]) {
				translate(v = [char_width,-2.5+count * char_width, 0])
						rotate([0,0,90]) 
							fnt_char(wordString[count], block_size, word_height);
			}

	   }
}


module makeWords(words=[" "],word_height=2.0) {
	for(i=[0:(len(words)-1)]){
	  translate([i*10,0,0]){
		  makeWord_LeagueGothic(wordString=words[i],word_height=word_height);
	  }
	}
}

makeWords(words=["Unfortunante","Publications"],word_height=5.0);



