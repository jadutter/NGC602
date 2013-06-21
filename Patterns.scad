X=10;
Y=10;
pat=0;
x=1;
y=1;
shape=0;
side=1;
h=1;


module shape(shape,side,h){
r = side;

	if(shape==0){
		difference(){
			linear_extrude(height = h){
				polygon(points=[[r*.1,0],[r*.9,0],[sin(30)*r,r]],triangle=[[0,1,2]]);
			}
			translate([r/2,-r*.3,-.1]){
				cylinder(r=side/2,h=h*2,$fn=40);
			}
		}
	}

	if(shape==1){
		translate([side/2,side/2,-.1]){
			cylinder(r=side/2,h=h*2,$fn=40);
		}
	}

	if(shape==2){
		cube([side,side,h]);
	}
	if(shape==3){
		cube([side,side,h]);
	}

}
module pattern(X,Y,pat,x,y,shape,side,h){
horizontal=X/(x+side);
vertical=Y/(y+side);
	if(pat==0){
		for(i=[0:horizontal-1]){
			translate([(side+x)*i,0,0]){
				for(j=[0:vertical-1]){
					translate([0,(side+y)*j,0]){
						 shape(shape,side,h);
					}
				}
			}
		}
	}
	if(pat==1){
		for(i=[0:horizontal-1]){
			translate([(side+x)*i,0,0]){
				for(j=[0:vertical-1]){
					translate([0,(side+y)*j,0]){
						 shape(shape,side,h);
					}
				}
			}
		}
		for(i=[0:horizontal-1]){
			translate([(side+x)*i+(side+x)/2,0,0]){
				for(j=[0:vertical-1]){
					translate([0,(side+y)*j+(side+y)/2,0]){
						 shape(shape,side,h);
					}
				}
			}
		}
	}
}

//shape(shape,side,h);
pattern(X,Y,pat,x,y,shape,side,h);


//color("black")cube([side,side,.1]);
//
%cube([X,Y,.1]);