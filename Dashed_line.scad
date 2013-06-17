length = 3;
width = 1;
height = 1;
spacing = 1;
start = [0,0];
end = [30,0];


module line(width,length,height,shape){
	if(shape == 1){
		translate([length/2,0,height/2]){
			cube([length,width,height],center=true);
		}
	}
	if(shape == 2){
		linear_extrude(height=height){
			polygon(
			points	=[
								[length,0],
								[0,width],
								[0,-width]
							],
			paths		=[
								[0,1,2]
							]
			);
		}
	}
	if(shape == 3){
		translate([length/2,width/3,height/2]){
			cube([length,width/3,height],center=true);
		}
		translate([length/2,-width/3,height/2]){
			cube([length,width/3,height],center=true);
		}
	}
	if(shape == 4){
		translate([length/2,width/3,height/2]){
			cube([length,width/3,height],center=true);
		}
		translate([-spacing/2,-width/3,height/2]){
			cube([length,width/3,height],center=true);
		}
		translate([length+spacing/2,-width/3,height/2]){
			cube([length,width/3,height],center=true);
		}
	}
	if(shape == 5){
		translate([length/2,0,height/2]){
			scale([1,width/length,1]){
				circle(length/2,center=true,$fn=30);
			}
		}
	}
}

module dashline(width,length,height,spacing,start,end,shape){
	angle = atan(end[1]/end[0]);
	line = end[0]/cos(angle);
	j = (line/(length+spacing));

	translate([start[0],start[1],0]){
		rotate([0,0,angle]){
			difference(){
				for(i=[0:j]){
					translate([(length+spacing)*i,0,0]){
						line(width,length,height,shape);
					}
				}
				translate([length+line,0,height/2]){
					cube([length*2,width*2,height*2],center=true);
				}
				translate([-length,0,height/2]){
					cube([length*2,width*2,height*2],center=true);
				}
			}
		}
	}
}

//translate([0,-10,0])%cube(25);

dashline(width,length,height,spacing,start,end,5);


//%line(width,length,height,1);
//line(width,length,height,5);







