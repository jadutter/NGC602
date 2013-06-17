fn=30;
pillar_radius=3;								//will likely be just a simply dowel rod
pillar_height=70;
base_boundaries = ([100,100,5]);			//the limits of the printing size; to be determined
Title=10;

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
			cube([base_boundaries[0],base_boundaries[1]-pillar_radius*3,base_boundaries[2]]);
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
	plate();
}

module plate2(){
	plate();
}

module plate3(){
	plate();
}

module plate4(){
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

assembly(10);

