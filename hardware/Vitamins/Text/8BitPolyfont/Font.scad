// Example combining MCAD/fonts.scad with search() function.

use <MCAD/fonts.scad>

module makeWord_8bitPolyfont(wordString=" ",word_height=2){
	thisFont=8bit_polyfont();
	x_shift=thisFont[0][0];
	y_shift=thisFont[0][1];
	assign( hourHandAngle=(i+1)*360/len(hours), theseIndicies=search(wordString,thisFont[2],1,1) ) {
			  
		  for( j=[0:(len(theseIndicies)-1)] ){
			  translate([j*x_shift,-y_shift/2]) {
				  linear_extrude(height=word_height) polygon(points=thisFont[2][theseIndicies[j]][6][0],paths=thisFont[2][theseIndicies[j]][6][1]);
			  }
		  }	
	  }
}

module makeWords(words=[" "],word_height=2.0) {
	for(i=[0:(len(words)-1)]){
	  translate([0,-i*10,0]){
		  makeWord_8bitPolyfont(wordString=words[i],word_height=word_height);
	  }
	}
}

makeWords(words=["UNFORTUNATE","PUBLICATIONS"],word_height=5.0);


