use <braille_font.scad>;
use <Data.scad>;
fn = 30;
pillar_diameter = 6.35;
pillar_radius = pillar_diameter/2;
pillar_height = 70;
base_boundaries = ([100,120,5]);
Title = 10;
max_plate_height = base_boundaries[2];
max_plate_height = 3;


braille_radius = 1;
braille_plate_height = 10;
braille_plate_thickness = 2;
spacing = 2.5;
distance = 3.75 + spacing;
Emboss = 1;

scaling = (.95);
transX = (1);
transY = (1);

move = -90.230965;
inkscale = 2.538071037;


star =
[
	[1.4,31.4,3,1063.653075],
	[4.5,92.6,3,1228.004618],
	[6,88.7,3,1063.653075],
	[6.7,74.7,3,1315.830655],
	[6.7,74.7,3,1130.316325],
	[8.9,17.9,3,2441.181106],
	[18.3,45.3,4,1475.027102],
	[20.8,98.9,3,1742.60919],
	[20.8,98.9,3,1611.387536],
	[22.2,46.1,4,3212.180934],
	[22.5,19.8,4,3518.843888],
	[23.6,18.8,4,16338.04169],
	[23.8,23.7,4,1310.991875],
	[23.8,23.7,4,1279.970617],
	[25.9,43,4,1958.844674],
	[27.8,68.5,4,1307.37447],
	[29.4,51.6,4,1090.435546],
	[31.5,34.9,3,22511.27016],
	[32.4,19.4,4,4195.657223],
	[32.6,38.1,3,7641.87624],
	[32.7,84.7,3,1618.825363],
	[34.7,42.9,3,7008.095316],
	[36.2,36.2,3,7184.557088],
	[37,35.7,3,4604.685784],
	[37.1,35.8,3,15617.08593],
	[38.9,38.2,3,6432.799273],
	[39.5,45,3,2839.226239],
	[43.9,97.6,3,11107.08256],
	[44.3,41.4,3,1274.089686],
	[45.2,61.3,3,9453.66046],
	[45.6,40.4,3,1509.384897],
	[45.6,40.4,3,1319.471457],
	[45.7,95.3,3,4685.975353],
	[48.2,78.1,3,1253.141175],
	[48.2,78.1,3,1302.566786],
	[48.7,72.2,3,1470.957077],
	[53.1,51.5,3,32448.90157],
	[56.1,0.9,3,3087.450476],
	[61,65.9,3,2135.99386],
	[61,65.9,4,2135.99386],
	[61.7,57.5,4,3787.913038],
	[62.7,45.1,4,1154.516117],
	[62.7,45.1,4,1102.554332],
	[66.8,55.6,4,1630.797361],
	[68.8,76.5,3,14521.11618],
	[68.9,76.5,3,4393.392456],
	[75.7,21.5,3,1986.094917],
	[78.9,100,3,62172.73893],
	[81.1,94,3,3144.850465],
	[84.3,18.4,3,2208.004733],
];





module triangle (s,h) {
//r=(s/2)/sin(60);
r = s;
	linear_extrude(height = h){
		polygon(points=[[-sin(60)*r,-sin(30)*r],[sin(60)*r,-sin(30)*r],[0,r]],triangle=[[0,1,2]]);
	}
}

Standard = 1.5;
//X-cord,Y-cord,Layer,Intensity

module star(Standard,Intensity,loc){
	translate([loc[0],loc[1],0]){
		scale([Standard,Standard,Intensity]){
			color("Purple")triangle(Standard,Intensity);
		}
	}
}

module drawing(i){
	if(i==1){
		translate([0,move,base_boundaries[2]/2]){
			scale(inkscale){
				color("Blue")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Filaments");
			}
		}
	}
	if(i==2){
		translate([0,move,base_boundaries[2]/2]){
			scale(inkscale){
				color("Red")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Gasses");
			}
		}
	}
	if(i==3){
		translate([0,move,base_boundaries[2]/2]){
			scale(inkscale){
				color("White")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Dust");
			}
		}
	}
	if(i==4){
		translate([0,move,base_boundaries[2]/2]){
			scale(inkscale){
				color("White")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Dust");
			}
		}
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
					square(pillar_radius*5,center = true);
				}
			}
		}
	}
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
			tab(max_plate_height);
		}
	}
	translate([base_boundaries[0]-pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		rotate([0,0,-135]){
			tab(max_plate_height);
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
	drawing(1);
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
	drawing(2);
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
	translate([transX,transY,0]){
		scale(scaling){
			for(i=[0:49]){
				if(star[i][2]==3){
					star(Standard,log(star[i][3]),star[i]);
				}
			}
		}
	}
	drawing(3);
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
	translate([transX,transY,0]){
		scale(scaling){
			for(i=[0:49]){
				if(star[i][2]==4){
					star(Standard,log(star[i][3]),star[i]);
				}
			}
		}
	}
	drawing(4);
}

module assembly(i){
//	%cube(base_boundaries);

	base();

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

module assembly2(j){
	for(i=[0:4]){
		translate([(base_boundaries[0]*i+j*i),0,0]){
			if(i==0){
				base();
			}
			if(i==1){
				plate1();
			}
			if(i==2){
				plate2();
			}
			if(i==3){
				plate3();
			}
			if(i==4){
				plate4();
			}
		}
	}
}


cube(.1);

plate3();





translate([62.04,28,10]){
	%cube(.3);
}




//assembly(30);
//assembly2(10);

//plate3();
//translate([base_boundaries[0]+1,0,0])plate4();



