use <braille_font.scad>;
fn=30;
pillar_radius=3;
pillar_height=70;
base_boundaries = ([100,100,5]);
Title=10;

braille_radius = 1;
braille_plate_height = 10;
braille_plate_thickness = 2;
spacing = 2.5;
distance = 3.75 + spacing;





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
	plate();;
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
}

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



assembly(10);









echo(2.5*2.5,distance/2);

//x=.5;
//rotate ([0,0,120]){
//	translate([0,x/2,0]){
//		color("black")cube([.01,x,x*5],center=true);
//	}
//}

