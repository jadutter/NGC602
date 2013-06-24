use <braille_font.scad>;
//use <Patterns.scad>;
fn = 30;
pillar_diameter = 6.35;
pillar_radius = pillar_diameter/2;
pillar_height = 100;
base_boundaries = ([100,120,5]);
Title = 10;
max_plate_height = base_boundaries[2];
max_plate_height = 3;


braille_radius = 1;
braille_plate_height = 10;
braille_plate_thickness = 2;
spacing = 2.5;
distance = 3.75 + spacing;
Emboss = 2;

scaling = (.95);
transX = (2);
transY = (2);
transY_draw = (-18);

move = 17.687;
move2=-90.230965;
inkscale = 2.538071037;
texturing=.3;

function scale_object(x) = (x)/15;

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

//X,Y,Z=1,Z=2,Z=3,Z=4,Flux
gasses =
[
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

//X,Y,Z=1,Z=2,Z=3,Z=4,Flux
dust =
[
	[2.4,40.7,0      ,12.92,0      ,25.84,38.76],
	[2.4,45.5,0      ,12.70666667,0      ,25.41333333,38.12],
	[2.4,50.3,0      ,25.19,0      ,50.38,75.57],
	[2.4,55.1,0      ,10.28,0      ,20.56,30.84],
	[7.1,36,0      ,18.86666667,0      ,37.73333333,56.6],
	[7.1,40.7,0      ,13.72,0      ,27.44,41.16],
	[7.1,45.5,0      ,15.14333333,0      ,30.28666667,45.43],
	[7.1,50.3,0      ,26.64,0      ,53.28,79.92],
	[7.1,55.1,0      ,11.26666667,0      ,22.53333333,33.8],
	[7.1,59.9,0      ,10.60333333,0      ,21.20666667,31.81],
	[7.1,64.7,0      ,10.22,0      ,20.44,30.66],
	[11.9,45.5,0      ,13.76333333,0      ,27.52666667,41.29],
	[11.9,50.3,0      ,14.28,0      ,28.56,42.84],
	[11.9,55.1,0      ,13.13333333,0      ,26.26666667,39.4],
	[11.9,59.9,0      ,12.94333333,0      ,25.88666667,38.83],
	[11.9,64.7,0      ,14.42666667,0      ,28.85333333,43.28],
	[11.9,69.5,0      ,10.07,0      ,20.14,30.21],
	[16.4,50.3,0      ,17.34333333,0      ,34.68666667,52.03],
	[16.4,55.1,0      ,15.64666667,0      ,31.29333333,46.94],
	[16.4,59.9,0      ,12.51333333,0      ,25.02666667,37.54],
	[16.4,64.7,0      ,10.09,0      ,20.18,30.27],
	[16.4,69.5,0      ,9.65,0      ,19.3,28.95],
	[21.2,59.9,0      ,12.08333333,0      ,24.16666667,36.25],
	[21.2,64.7,0      ,10.35333333,0      ,20.70666667,31.06],
	[21.2,69.5,0      ,11.56333333,0      ,23.12666667,34.69],
	[21.2,16.8,0      ,16.18333333,0      ,32.36666667,48.55],
	[26,12,0      ,18.42,0      ,36.84,55.26],
	[30.6,12,0      ,18.97333333,0      ,37.94666667,56.92],
	[35.3,12,0      ,17.02666667,0      ,34.05333333,51.08],
	[39.9,7.2,0      ,16.82333333,0      ,33.64666667,50.47],
	[44.7,7.2,0      ,17.27,0      ,34.54,51.81],
	[49.3,7.2,0      ,16.06333333,0      ,32.12666667,48.19],
	[54,2.4,0      ,12.3,0      ,24.6,36.9],
	[54,7.2,0      ,15.23,0      ,30.46,45.69],
	[58.6,2.4,0      ,14.34,0      ,28.68,43.02],
	[58.6,7.2,0      ,14.12,0      ,28.24,42.36],
	[58.6,12,0      ,16.05666667,0      ,32.11333333,48.17],
	[63.4,7.2,0      ,13.92666667,0      ,27.85333333,41.78],
	[63.4,12,0      ,11.73,0      ,23.46,35.19],
	[68,7.2,0      ,11.29,0      ,22.58,33.87],
	[68,12,0      ,10.49666667,0      ,20.99333333,31.49],
	[72.7,7.2,0      ,12.91666667,0      ,25.83333333,38.75],
	[72.7,12,0      ,14.52,0      ,29.04,43.56],
	[72.7,16.8,0      ,10.63333333,0      ,21.26666667,31.9],
	[72.7,21.6,0      ,12.51666667,0      ,25.03333333,37.55],
	[77.3,16.8,0      ,10.56333333,0      ,21.12666667,31.69],
	[77.3,21.6,0      ,12.54333333,0      ,25.08666667,37.63],
	[77.3,36,0      ,11.28333333,0      ,22.56666667,33.85],
	[77.3,74.2,0      ,12.27333333,0      ,24.54666667,36.82],
	[82.1,16.8,0      ,11.57333333,0      ,23.14666667,34.72],
	[82.1,21.6,0      ,8.926666667,0      ,17.85333333,26.78],
	[82.1,40.7,0      ,12.83333333,0      ,25.66666667,38.5],
	[82.1,45.5,0      ,12.26666667,0      ,24.53333333,36.8],
	[82.1,79,0      ,9.263333333,0      ,18.52666667,27.79],
	[86.7,16.8,0      ,8.976666667,0      ,17.95333333,26.93],
	[86.7,21.6,0      ,9.14,0      ,18.28,27.42],
	[86.7,59.9,0      ,14.07,0      ,28.14,42.21],
	[86.7,69.5,0      ,6.833333333,0      ,13.66666667,20.5],
	[91.4,21.6,0      ,11.16333333,0      ,22.32666667,33.49],
	[91.4,26.4,0      ,12.84666667,0      ,25.69333333,38.54],
	[91.4,31.2,0      ,10.58333333,0      ,21.16666667,31.75],
	[96,31.2,0      ,14.58333333,0      ,29.16666667,43.75],
	[96,36,0      ,20.15,0      ,40.3,60.45]
];

//X,Y,Z=1,Z=2,Z=3,Z=4,Flux
gas_dust=
[
	[11.8,40.7,0      ,74.7,0      ,74.7,149.4],
	[11.8,31.2,0      ,74.35,0      ,74.35,148.7],
	[21.2,55.1,0      ,65.95,0      ,65.95,131.9],
	[21.2,50.3,0      ,74.35,0      ,74.35,148.7],
	[21.2,21.6,0      ,76.35,0      ,76.35,152.7],
	[26,16.8,0      ,69.65,0      ,69.65,139.3],
	[30.5,26.4,0      ,228.6,0      ,228.6,457.2],
	[35.3,26.4,0      ,225,0      ,225,450],
	[35.3,21.6,0      ,178.55,0      ,178.55,357.1],
	[39.9,21.6,0      ,133.95,0      ,133.95,267.9],
	[39.9,12,0      ,65.4,0      ,65.4,130.8],
	[44.7,12,0      ,68.75,0      ,68.75,137.5],
	[58.6,74.2,0      ,51.25,0      ,51.25,102.5],
	[63.4,74.2,0      ,56.5,0      ,56.5,113],
	[67.9,74.2,0      ,93.75,0      ,93.75,187.5],
	[72.7,74.2,0      ,63.3,0      ,63.3,126.6],
	[72.7,59.9,0      ,115.6,0      ,115.6,231.2],
	[72.7,55.1,0      ,101.95,0      ,101.95,203.9],
	[72.7,50.3,0      ,89.15,0      ,89.15,178.3],
	[77.3,69.4,0      ,75.9,0      ,75.9,151.8],
	[77.3,64.6,0      ,105.4,0      ,105.4,210.8],
	[77.3,59.9,0      ,110.5,0      ,110.5,221],
	[77.3,55.1,0      ,96.35,0      ,96.35,192.7],
	[77.3,50.3,0      ,93.55,0      ,93.55,187.1],
	[77.3,45.5,0      ,80.4,0      ,80.4,160.8],
	[77.3,40.7,0      ,64.45,0      ,64.45,128.9],
	[82.1,64.6,0      ,60.45,0      ,60.45,120.9],
	[82.1,59.9,0      ,79.75,0      ,79.75,159.5],
	[82.1,55.1,0      ,83.3,0      ,83.3,166.6],
	[82.1,50.3,0      ,73.85,0      ,73.85,147.7]
];

//X,Y,Z=1,Z=2,Z=3,Z=4,Flux
filaments=[
	[11.8,36,1      ,0      ,0      ,0      ,202],
	[16.4,45.5,1      ,0      ,0      ,0      ,185.4],
	[16.4,40.7,1      ,0      ,0      ,0      ,239.7],
	[16.4,36,1      ,0      ,0      ,0      ,368.1],
	[16.4,31.2,1      ,0      ,0      ,0      ,357.6],
	[21.2,45.5,1      ,0      ,0      ,0      ,243.8],
	[21.2,40.7,1      ,0      ,0      ,0      ,374.3],
	[21.2,31.2,1      ,0      ,0      ,0      ,293.3],
	[21.2,26.4,1      ,0      ,0      ,0      ,265.2],
	[26,55.1,1      ,0      ,0      ,0      ,130.4],
	[26,50.3,1      ,0      ,0      ,0      ,222.2],
	[26,45.5,1      ,0      ,0      ,0      ,266.1],
	[26,31.2,1      ,0      ,0      ,0      ,532.6],
	[26,26.4,1      ,0      ,0      ,0      ,651.3],
	[26,21.6,1      ,0      ,0      ,0      ,307.3],
	[26,59.9,1      ,0      ,0      ,0      ,276.8],
	[30.5,21.6,1      ,0      ,0      ,0      ,372.8],
	[30.6,16.8,1      ,0      ,0      ,0      ,111.7],
	[35.3,16.8,1      ,0      ,0      ,0      ,247.1],
	[39.9,16.8,1      ,0      ,0      ,0      ,253.8],
	[44.7,16.8,1      ,0      ,0      ,0      ,195.1],
	[49.3,12,1      ,0      ,0      ,0      ,59.74],
	[49.3,16.8,1      ,0      ,0      ,0      ,80.34],
	[54,12,1      ,0      ,0      ,0      ,64.02],
	[58.6,69.4,1      ,0      ,0      ,0      ,235],
	[58.6,64.6,1      ,0      ,0      ,0      ,190.4],
	[63.4,69.4,1      ,0      ,0      ,0      ,213.6],
	[63.4,64.6,1      ,0      ,0      ,0      ,195.3],
	[63.4,59.9,1      ,0      ,0      ,0      ,276.1],
	[63.4,55.1,1      ,0      ,0      ,0      ,341.3],
	[63.4,50.3,1      ,0      ,0      ,0      ,349.6],
	[67.9,55.1,1      ,0      ,0      ,0      ,234.7],
	[67.9,50.3,1      ,0      ,0      ,0      ,248],
	[67.9,45.5,1      ,0      ,0      ,0      ,226.5],
	[68,31.2,1      ,0      ,0      ,0      ,56.04],
	[68,59.9,1      ,0      ,0      ,0      ,109.7],
	[68,64.7,1      ,0      ,0      ,0      ,70.44],
	[68,69.5,1      ,0      ,0      ,0      ,71.49],
	[72.7,40.7,1      ,0      ,0      ,0      ,180.7],
	[72.7,36,1      ,0      ,0      ,0      ,157.7],
	[72.7,31.2,1      ,0      ,0      ,0      ,119.6],
	[72.7,26.4,1      ,0      ,0      ,0      ,53.49],
	[72.7,45.5,1      ,0      ,0      ,0      ,57.11],
	[72.7,64.7,1      ,0      ,0      ,0      ,69.38],
	[72.7,69.5,1      ,0      ,0      ,0      ,84.53],
	[82.1,69.5,1      ,0      ,0      ,0      ,49.81],
	[82.1,74.2,1      ,0      ,0      ,0      ,40.85],
	[86.7,64.7,1      ,0      ,0      ,0      ,62.36],
	[91.4,59.9,1      ,0      ,0      ,0      ,33.92]
];


module triangle (s,h) {
//r=(s/2)/sin(60);
r = s;
	linear_extrude(height = h){
		polygon(points=[[-sin(60)*r,-sin(30)*r],[sin(60)*r,-sin(30)*r],[0,r]],triangle=[[0,1,2]]);
	}
}

Standard = 5;
//X-cord,Y-cord,Layer,Intensity

module star(Standard,Intensity,loc,pointiness,fragments){
Intensity2=Intensity;
	translate([loc[0],loc[1],0]){
		scale([1,1,1]){
			color("Purple")cylinder(r1=Standard/2,r2=pointiness,h=Intensity2,$fn=fragments);
		}
	}
}

//module star(Standard,Intensity,loc){
//Intensity2=Intensity;
//	translate([loc[0],loc[1],0]){
//		scale([1,1,1]){
//			intersection(){
//				resize([Standard/2,Standard/2,Intensity2*2]){
//					color("Purple")sphere(r1=Standard/2,r2=Standard/2,h=Intensity2,$fn=fn);
//				}
//				translate([-Standard/2,-Standard/2,0]){
//					resize([Standard,Standard,]){
//						cube(Intensity2*2);
//					}
//				}
//			}
//		}
//	}
//}

module object(type,Standard,x,y,z){
	if(type==0){
		translate([x,y,z/2]){
			scale([1,1,1]){
				cube([Standard,Standard,z],center=true);
			}
		}
	}
	translate([x,y,0]){
		scale([1,1,1]){
			cylinder(r=Standard/2,h=z,$fn=type);
		}
	}
}

module drawing(i){
k=2;
K=120/2/k;
h=3;
H=120/2/h;
	if(i==1){
		scale(scaling/.95){
			translate([0,move2,base_boundaries[2]/2]){
				scale(inkscale){
					color("White")linear_extrude(file = "v6_NGC_602.dxf", height = Emboss, layer = "Filaments");
				}
			}
		}
	}

	if(i==2||i==4){
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2+((Emboss*3)/inkscale/.95-texturing)*2.5]){
				scale(inkscale){
					color("Maroon")linear_extrude(file = "v6_NGC_602.dxf", height =texturing, layer = "Gasses_t");
				}
			}
		}
		scale(scaling/.95){
			translate([0,move2,base_boundaries[2]/2]){
				scale(inkscale){
					color("Red")linear_extrude(file = "v6_NGC_602.dxf", height =(Emboss*3)/inkscale/.95-texturing, layer = "Gasses");
				}
			}
		}
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2+((Emboss*1)/inkscale/.95-texturing)*2.5]){
				scale(inkscale){
					color("Green")linear_extrude(file = "v6_NGC_602.dxf", height = texturing, layer = "Dust_t");
				}
			}
		}
		scale(scaling/.95){
			translate([0,move2,base_boundaries[2]/2]){
				scale(inkscale){
					color("Lime")linear_extrude(file = "v6_NGC_602.dxf", height = (Emboss*1)/inkscale/.95-texturing, layer = "Dust");
				}
			}
		}
		scale(scaling/.95){
			translate([0,17.687,base_boundaries[2]/2+((Emboss*2)/inkscale/.95-texturing)*2.5]){
				scale(inkscale){
					color("Navy")linear_extrude(file = "v6_NGC_602.dxf", height = texturing, layer = "Gas_Dust_t");
				}
			}
		}
		scale(scaling/.95){
			translate([0,17.687,base_boundaries[2]/2]){
				scale(inkscale){
					color("Blue")linear_extrude(file = "v6_NGC_602.dxf", height = (Emboss*2)/inkscale-texturing, layer = "Gas_Dust");
				}
			}
		}
	}
}
module test(x,y,z){
	if(x==1){
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2/scaling]){
				scale(inkscale){
					color("Red")linear_extrude(file = "v6_NGC_602.dxf", height =(Emboss)/inkscale/.95, layer = "Gasses_t");
				}
			}
		}
	}
	if(y==1){
		scale(scaling/.95){
			translate([0,17.687,base_boundaries[2]/2/scaling]){
				scale(inkscale){
					color("Blue")linear_extrude(file = "v6_NGC_602.dxf", height = (Emboss*2)/inkscale, layer = "Gas_Dust_t");
				}
			}
		}
	}

	if(z==1){
		scale(scaling/.95){
			translate([0,move,base_boundaries[2]/2/scaling]){
				scale(inkscale){
					color("green")linear_extrude(file = "v6_NGC_602.dxf", height = (Emboss*3)/inkscale/.95, layer = "Dust_t");
				}
			}
		}
	}
}

module bits(I){

	if(I==1){
		translate([transX,transY,base_boundaries[2]/2]){
			scale([scaling,scaling,1]){
				for(i=[0:48]){
					color("cyan")object(0,Standard,filaments[i][0],filaments[i][1],scale_object(filaments[i][6],10)-1*10);
		
				}
			}
		}
	}

	if(I==2){
		translate([transX,transY,base_boundaries[2]/2]){
			scale([scaling,scaling,1]){
				for(i=[0:69]){
					color("Red")object(0,Standard,gasses[i][0],gasses[i][1],scale_object(gasses[i][3]));
				}
				for(i=[0:62]){
					color("Green")object(3,Standard,dust[i][0],dust[i][1],scale_object(dust[i][3],10));
				}
				for(i=[0:29]){
					color("Blue")object(30,Standard,gas_dust[i][0],gas_dust[i][1],scale_object(gas_dust[i][3]));
				}
			}
		}
	}

	if(I==3){
		translate([transX,transY,base_boundaries[2]/2]){
			scale([scaling,scaling,1]){
				for(i=[0:69]){
					color("Red")object(0,Standard,gasses[i][0],gasses[i][1],scale_object(gasses[i][4]));
				}
				for(i=[0:62]){
					color("Green")object(3,Standard,dust[i][0],dust[i][1],scale_object(dust[i][4]));
				}
				for(i=[0:29]){
					color("Blue")object(30,Standard,gas_dust[i][0],gas_dust[i][1],scale_object(gas_dust[i][4]));
				}
				for(i=[0:49]){
					if(star[i][2]==3){
						star(Standard,log(star[i][3])*5,star[i],1,30);
					}
				}
			}
		}
	}

	if(I==4){
		translate([transX,transY,base_boundaries[2]/2]){
			scale([scaling,scaling,1]){
				for(i=[0:69]){
					color("Red")object(0,Standard,gasses[i][0],gasses[i][1],scale_object(gasses[i][5],10));
				}
				for(i=[0:62]){
					color("Green")object(3,Standard,dust[i][0],dust[i][1],scale_object(dust[i][5],10));
				}
				for(i=[0:29]){
					color("Blue")object(30,Standard,gas_dust[i][0],gas_dust[i][1],scale_object(gas_dust[i][5],10));
				}
				for(i=[0:49]){
					if(star[i][2]==4){
						star(Standard,log(star[i][3])*5,star[i],1,30);
					}
				}
			}
		}
	}
}

module tab(thickness){
	linear_extrude(height=thickness){
		difference(){
			hull(){
				circle(pillar_radius*2,$fn=50);
				translate([pillar_radius,pillar_radius,0]){
					intersection(){
						circle(pillar_radius*2.832,$fn=50);
						square(pillar_radius*4);
					}
				}
			}
			circle(pillar_radius,$fn=50);
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
		circle(pillar_radius,$fn=50);
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

module plate1(type){
	chars = ["O", "N", "E"];
	char_count = 3;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}

	plate();

	if(type==0){
		bits(1);
	}

	if(type==1){
		translate([transX,transY_draw,0]){
			drawing(1);
		}
	}
}

module plate2(type){
	chars = ["T", "W", "O"];
	char_count = 3;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}

	plate();

	if(type==0){
		bits(2);
	}

	if(type==1){
		translate([transX,transY_draw,0]){
			drawing(2);
		}
	}
}

module plate3(type){
	chars = ["T", "H", "R", "E", "E"];
	char_count = 5;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}

	plate();

	if(type==0){
		bits(3);
	}

	if(type==1){
		translate([transX,transY,0]){
			scale([scaling,scaling,1]){
				for(i=[0:49]){
					if(star[i][2]==3){
						star(Standard,log(star[i][3])*5,star[i],Standard/2,fn);
					}
				}
			}
		}
		translate([transX,transY_draw,base_boundaries[2]/2]){
			drawing(3);
		}
	}
}

module plate4(type){
	chars = ["F", "O", "U", "R"];
	char_count = 4;
	Total_width = distance*char_count+distance;

	translate([distance/2+base_boundaries[0]/2-Total_width/2,braille_plate_height+base_boundaries[1]-pillar_radius*3-Title,base_boundaries[2]-braille_plate_thickness-braille_radius]){
		rotate ([0,0,-90]){
			braille_str(chars, char_count);
		}
	}

	plate();

	if(type==0){
		bits(4);
	}
	if(type==1){
		translate([transX,transY,base_boundaries[2]/2]){
			scale([scaling,scaling,1]){
				for(i=[0:49]){
					if(star[i][2]==4){
						star(Standard,log(star[i][3])*5,star[i],Standard/2,fn);
					}
				}
			}
		}
		translate([transX,transY_draw,0]){
			drawing(4);
		}
	}
}




module assembly(i,type){
//	%cube(base_boundaries);

	base();

	translate([0,0,(base_boundaries[2]+i)]){
		plate4(type);
	}
	translate([0,0,(base_boundaries[2]+i)*2]){
		plate3(type);
	}
	translate([0,0,(base_boundaries[2]+i)*3]){
		plate2(type);
	}
	translate([0,0,(base_boundaries[2]+i)*4]){
		plate1(type);
	}


}

module assembly2(j,type){
	for(i=[0:4]){
		translate([(base_boundaries[0]*i+j*i),0,0]){
			if(i==0){
				base();
			}
			if(i==1){
				plate1(type);
			}
			if(i==2){
				plate2(type);
			}
			if(i==3){
				plate3(type);
			}
			if(i==4){
				plate4(type);
			}
		}
	}
}

module assembly3(j){
	for(i=[0:3]){
		translate([(base_boundaries[0]*i+j*i),base_boundaries[1]+j,0]){
			if(i==0){
				plate1(1);
			}
			if(i==1){
				plate2(1);
			}
			if(i==2){
				plate3(1);
			}
			if(i==3){
				plate4(1);
			}
		}
	}
	for(i=[0:3]){
		translate([(base_boundaries[0]*i+j*i),0,0]){
			if(i==0){
				plate1(0);
			}
			if(i==1){
				plate2(0);
			}
			if(i==2){
				plate3(0);
			}
			if(i==3){
				plate4(0);
			}
		}
	}
}

//test(1,1,1);

//cube(.1);

//assembly(45,0);

//assembly2(10,1);

//assembly3(10,1);

rotate([0,0,90]){
	translate([-base_boundaries[0]/2,-base_boundaries[1]/2,0]){
		plate4(1);
	}
}

//drawing(4);

//pattern(X,Y,pat,x,y,shape,side,h);
//pattern(100,120,0,0,1,2,1,1);
//pattern(10,12,0,1,1,0,1,1);