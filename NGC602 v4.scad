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

gasses = [
[21.2,36,0      ,240.6,0      ,120.3,360.9],
[26,40.7,0      ,195.8,0      ,97.9,293.7],
[26,36,0      ,188.1333333,0      ,94.06666667,282.2],
[30.5,55.1,0      ,77.2,0      ,38.6,115.8],
[30.5,50.3,0      ,116.2666667,0      ,58.13333333,174.4],
[30.5,45.5,0      ,146.4666667,0      ,73.23333333,219.7],
[30.5,40.7,0      ,127.8666667,0      ,63.93333333,191.8],
[30.5,36,0      ,285.8666667,0      ,142.9333333,428.8],
[30.5,31.2,0      ,185,0      ,92.5,277.5],
[35.3,50.3,0      ,105.2666667,0      ,52.63333333,157.9],
[35.3,45.5,0      ,112.6666667,0      ,56.33333333,169],
[35.3,40.7,0      ,116.6,0      ,58.3,174.9],
[35.3,36,0      ,303.5333333,0      ,151.7666667,455.3],
[35.3,31.2,0      ,254.2,0      ,127.1,381.3],
[39.9,50.3,0      ,76.13333333,0      ,38.06666667,114.2],
[39.9,45.5,0      ,205,0      ,102.5,307.5],
[39.9,40.7,0      ,118.4,0      ,59.2,177.6],
[39.9,36,0      ,163.4,0      ,81.7,245.1],
[39.9,31.2,0      ,208.9333333,0      ,104.4666667,313.4],
[39.9,26.4,0      ,213.8666667,0      ,106.9333333,320.8],
[44.7,59.9,0      ,104.4,0      ,52.2,156.6],
[44.7,55.1,0      ,105.2,0      ,52.6,157.8],
[44.7,50.3,0      ,107.5333333,0      ,53.76666667,161.3],
[44.7,45.5,0      ,144.5333333,0      ,72.26666667,216.8],
[44.7,40.7,0      ,158.8,0      ,79.4,238.2],
[44.7,36,0      ,154.0666667,0      ,77.03333333,231.1],
[44.7,31.2,0      ,164.7333333,0      ,82.36666667,247.1],
[44.7,26.4,0      ,172,0      ,86,258],
[44.7,21.6,0      ,151.5333333,0      ,75.76666667,227.3],
[49.2,69.4,0      ,88.26666667,0      ,44.13333333,132.4],
[49.2,64.6,0      ,99.4,0      ,49.7,149.1],
[49.2,59.9,0      ,97.93333333,0      ,48.96666667,146.9],
[49.2,55.1,0      ,127.8,0      ,63.9,191.7],
[49.2,50.3,0      ,113.6,0      ,56.8,170.4],
[49.2,45.5,0      ,143.2666667,0      ,71.63333333,214.9],
[49.2,40.7,0      ,180.3333333,0      ,90.16666667,270.5],
[49.2,36,0      ,136.8666667,0      ,68.43333333,205.3],
[49.2,31.2,0      ,142.4666667,0      ,71.23333333,213.7],
[49.2,26.4,0      ,144.3333333,0      ,72.16666667,216.5],
[49.2,21.6,0      ,112.3333333,0      ,56.16666667,168.5],
[54,69.4,0      ,96.26666667,0      ,48.13333333,144.4],
[54,64.6,0      ,106.2,0      ,53.1,159.3],
[54,59.9,0      ,111.7333333,0      ,55.86666667,167.6],
[54,55.1,0      ,145.2666667,0      ,72.63333333,217.9],
[54,50.3,0      ,226.0666667,0      ,113.0333333,339.1],
[54,45.5,0      ,165.0666667,0      ,82.53333333,247.6],
[54,40.7,0      ,181.4,0      ,90.7,272.1],
[54,36,0      ,131.1333333,0      ,65.56666667,196.7],
[54,31.2,0      ,143.7333333,0      ,71.86666667,215.6],
[54,26.4,0      ,130.5333333,0      ,65.26666667,195.8],
[54,21.6,0      ,111.5333333,0      ,55.76666667,167.3],
[54,16.8,0      ,112.2666667,0      ,56.13333333,168.4],
[58.6,59.9,0      ,152.0666667,0      ,76.03333333,228.1],
[58.6,55.1,0      ,167.7333333,0      ,83.86666667,251.6],
[58.6,50.3,0      ,120.6666667,0      ,60.33333333,181],
[58.6,45.5,0      ,149.6,0      ,74.8,224.4],
[58.6,40.7,0      ,125.8666667,0      ,62.93333333,188.8],
[58.6,36,0      ,115.4666667,0      ,57.73333333,173.2],
[58.6,31.2,0      ,124.6666667,0      ,62.33333333,187],
[58.6,26.4,0      ,114.4666667,0      ,57.23333333,171.7],
[58.6,21.6,0      ,99.13333333,0      ,49.56666667,148.7],
[58.6,16.8,0      ,83.4,0      ,41.7,125.1],
[63.4,45.5,0      ,133.3333333,0      ,66.66666667,200],
[63.4,40.7,0      ,110.4,0      ,55.2,165.6],
[63.4,36,0      ,86.66666667,0      ,43.33333333,130],
[63.4,31.2,0      ,88.13333333,0      ,44.06666667,132.2],
[63.4,26.4,0      ,93.6,0      ,46.8,140.4],
[67.9,40.7,0      ,119.3333333,0      ,59.66666667,179],
[67.9,36,0      ,75.86666667,0      ,37.93333333,113.8],
[67.9,26.4,0      ,82.4,0      ,41.2,123.6]
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

module gas(Standard,x,y,z){
	translate([x,y,0]){
		scale([Standard,Standard,1]){
			color("Magenta")cube([Standard,Standard,z]);
		}
	}
}

module drawing(i){
	if(i==1){
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2]){
				scale(inkscale){
					color("Blue")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Filaments");
				}
			}
		}
	}
	if(i==2||i==3||i==4){
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2]){
				scale(inkscale){
					color("Red")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Gasses");
				}
			}
		}
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2]){
				scale(inkscale){
					color("White")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Dust");
				}
			}
		}
	}
//	if(i==3||4){
//		translate([0,move,base_boundaries[2]/2]){
//			scale(inkscale){
//				color("White")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Dust");
//			}
//		}
//	}
//	if(i==4){
//		translate([0,move,base_boundaries[2]/2]){
//			scale(inkscale){
//				color("White")linear_extrude(file = "v3_NGC_602.dxf", height = Emboss, layer = "Dust");
//			}
//		}
//	}
}

module drawing2(i){
	scale(scaling/.95){
		translate([0,move,base_boundaries[2]/2]){
			scale(inkscale){
				color("Red")linear_extrude(file = "v4_NGC_602.dxf", height = Emboss, layer = "Gasses_t");
			}
		}
	}
echo("gas pattern");
	scale(scaling/.95){
		translate([0,move,base_boundaries[2]/2]){
			scale(inkscale){
				color("White")linear_extrude(file = "v4_NGC_602.dxf", height = Emboss, layer = "Dust");
			}
		}
	}
echo("dust");
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

module pillar(pillar_radius,pillar_height){
	linear_extrude(height=pillar_height){
		circle(pillar_radius,$fn=fn);
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
	translate([pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		pillar(pillar_radius,pillar_height);
	}
	translate([base_boundaries[0]-pillar_radius*2,base_boundaries[1]-pillar_radius*2,0]){
		pillar(pillar_radius,pillar_height);
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
		plate4();
	}
	translate([0,0,(base_boundaries[2]+i)*2]){
		plate3();
	}
	translate([0,0,(base_boundaries[2]+i)*3]){
		plate2();
	}
	translate([0,0,(base_boundaries[2]+i)*4]){
		plate1();
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

//plate3();
//base();




translate([62.04,28,10]){
	%cube(.3);
}




//assembly(40);


//assembly2(10);


//plate();
//
//translate([transX,transY,0]){
//	scale(scaling){
//		for(i=[0:69]){
//			gas(Standard*1.5,gasses[i][0],gasses[i][1],gasses[i][3]/30+3);
//
//		}
//	}
//}
//translate([transX,transY,0]){
//	scale(scaling){
//		for(i=[0:69]){
//			gas(Standard*1.5,gasses[i][0],gasses[i][1],gasses[i][3]/30+3);
//
//		}
//	}
//}
drawing2(4);


//plate3();






