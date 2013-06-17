use <braille_font.scad>;
fn=30;
pillar_diameter=6.35;
pillar_radius=pillar_diameter/2;
pillar_height=70;
base_boundaries = ([140,140,5]);
Title=10;

braille_radius = 1;
braille_plate_height = 10;
braille_plate_thickness = 2;
spacing = 2.5;
distance = 3.75 + spacing;






Standard=1;
//Name,Number,X-cord,Y-cord,Layer,Intensity
A=[1,1,1,2,2];
B=[2,3,2,1,.2];
C=[3,7,5,1,1.2];
D=[4,3,7,3,.5];
E=[5,8,4,3,2.5];
F=[6,4,4,2,1.8];
G=[7,6,2,4,1];
Map=[A,B,C,D,E,F,G];

module star(Standard,Intensity,loc){
	translate([loc[1],loc[2],0]){
		scale([Standard,Standard,Intensity]){
			difference(){
				sphere(1,$fn=fn);
				translate([0,0,-1]){
					cube(2,center=true);
				}
			}
		}
	}
}

module triangle (s,h) {
//r=(s/2)/sin(60);
r=s;
	linear_extrude(height = h){
		polygon(points=[[-sin(60)*r,-sin(30)*r],[sin(60)*r,-sin(30)*r],[0,r]],triangle=[[0,1,2]]);
	}
}

module tab(thickness){
	linear_extrude(height=thickness){
		difference(){
			hull(){
				circle(pillar_radius*2,$fn=fn);
				translate([pillar_radius,pillar_radius,0]){
					intersection(){
						circle(pillar_radius*2.832,$fn=fn);
						square(pillar_radius*4);
					}
				}
			}
			circle(pillar_radius,$fn=fn);
			translate([pillar_radius*3,pillar_radius*3,0]){
				rotate([0,0,45]){
					square(pillar_radius*5,center=true);
				}
			}
		}
	}

//	linear_extrude(height=2){
//		circle(1,$fn=fn);
//	}
}

module base(){
	translate([0,0,0]){
		cube([base_boundaries[0],base_boundaries[1]-pillar_radius*3,base_boundaries[2]]);
	}
	translate([pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		rotate([0,0,-135]){
			tab(base_boundaries[2]);
		}
	}
	translate([base_boundaries[0]-pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		rotate([0,0,-135]){
			tab(base_boundaries[2]);
		}
	}
}

module pillar(pillar_radius,pillar_height){
	linear_extrude(height=pillar_height){
		circle(pillar_radius,$fn=fn);
	}
}

module plate(){
	difference(){
		translate([0,0,0]){
			cube([base_boundaries[0],base_boundaries[1]-pillar_radius*3,base_boundaries[2]-braille_radius]);
		}
		translate([-1,-1,base_boundaries[2]/2]){
			cube([base_boundaries[0]+2,base_boundaries[1]-pillar_radius*3-Title+1,base_boundaries[2]]);
		}
	}
	translate([pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		rotate([0,0,-135]){
			tab(base_boundaries[2]);
		}
	}
	translate([base_boundaries[0]-pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		rotate([0,0,-135]){
			tab(base_boundaries[2]);
		}
	}
}

module plate1(){
	chars = ["O", "N", "E"];
	char_count = 3;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}
	plate();
//	translate([base_boundaries[0]/2,base_boundaries[1]/2,base_boundaries[2]/2]){
//	translate([0,0,base_boundaries[2]/2]){
//		scale(6){
//			for(i=[0:6]){
//				if(Map[i][3]==1){
//					star(Standard,Map[i][4],Map[i]);
//					echo(Map[i][3],Map[i]);
//				}
//			}
//		}
//	}
}

module plate2(){
	chars = ["T", "W", "O"];
	char_count = 3;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}
	plate();
//	translate([base_boundaries[0]/2,base_boundaries[1]/2,base_boundaries[2]/2]){
	translate([0,0,base_boundaries[2]/2]){
		scale(6){
			for(i=[0:6]){
				if(Map[i][3]==2){
					star(Standard,Map[i][4],Map[i]);
					echo(Map[i][3],Map[i]);
				}
			}
		}
	}
}

module plate3(){
	chars = ["T", "H", "R", "E", "E"];
	char_count = 5;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}
	plate();
//	translate([base_boundaries[0]/2,base_boundaries[1]/2,base_boundaries[2]/2]){
	translate([0,0,base_boundaries[2]/2]){
		scale(6){
			for(i=[0:6]){
				if(Map[i][3]==3){
					star(Standard,Map[i][4],Map[i]);
					echo(Map[i][3],Map[i]);
				}
			}
		}
	}
}

module plate4(){
	chars = ["F", "O", "U", "R"];
	char_count = 4;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}
	plate();
//	translate([base_boundaries[0]/2,base_boundaries[1]/2,base_boundaries[2]/2]){
	translate([0,0,base_boundaries[2]/2]){
		scale(6){
			for(i=[0:6]){
				if(Map[i][3]==4){
					star(Standard,Map[i][4],Map[i]);
					echo(Map[i][3],Map[i]);
				}
			}
		}
	}
}

//Standard=1;
////Name,Number,X-cord,Y-cord,Layer,Intensity
//A=[1,1,1,2,2];
//B=[2,3,2,1,.2];
//C=[3,7,5,1,1.2];
//D=[4,3,7,3,.5];
//E=[5,8,4,3,2.5];
//F=[6,4,4,2,1.8];
//G=[7,6,2,4,1];
//
//module star(Standard,Intensity,loc){
//	translate([loc[1],loc[2],loc[3]]){
//		scale([Standard,Standard,Intensity]){
//			difference(){
//				sphere(1,$fn=fn);
//				translate([0,0,-1]){
//					cube(2,center=true);
//				}
//			}
//		}
//	}
//	echo(loc);
//}
//
//
//star(Standard,A[4],A);
//star(Standard,B[4],B);
//star(Standard,C[4],C);
//star(Standard,D[4],D);
//star(Standard,E[4],E);
//star(Standard,F[4],F);
//star(Standard,G[4],G)i,









module assembly(i){
//	%cube(base_boundaries);

	base(10);


	translate([0,0,(base_boundaries[2]+i)]){
		plate1();
	}
	translate([0,0,(base_boundaries[2]+i)*2]){
		plate2();
	}
	translate([0,0,(base_boundaries[2]+i)*3]){
		plate3();
	}
	translate([0,0,(base_boundaries[2]+i)*4]){
		plate4();
	}




	translate([pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		pillar(pillar_radius,pillar_height);
	}
	translate([base_boundaries[0]-pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		pillar(pillar_radius,pillar_height);
	}
}







//translate([0,0,thickness/2]){
//	triangle(pillar_radius,thickness);
//}
//translate([0,0,-thickness/2]){
//	triangle(pillar_radius,thickness);
//}



//assembly(30);

plate1();

//m	=	[	[1, 0, 0, 10],
//			[0, 1, 0, 20],
//			[0, 0, 1, 30],
//			[0, 0, 0,  1]
//		];
//
//echo(m);
//echo(m[2]);
//echo(m[2][3]);


//x=.5;
//rotate ([0,0,120]){
//	translate([0,x/2,0]){
//		color("black")cube([.01,x,x*5],center=true);
//	}
//}

