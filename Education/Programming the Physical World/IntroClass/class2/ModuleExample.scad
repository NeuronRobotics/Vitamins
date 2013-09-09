

module transform(t=[0,0,0],r=[0,0,0], depth=0){
	translate(t){
		rotate(r){
			if(depth>10){
				transform(t*1.5,r*1.5,depth+1){
					 for (i = [0 : $children-1]){
						 child(i);
					 }
				}
			}else{
				for (i = [0 : $children-1]){
					 child(i);
				}
			}
		}
	}
}

module topLevel(){
	transform(t=[0,1,0],r=[0,10,0]){
		cube([5,5,5]);
	}
}

topLevel();