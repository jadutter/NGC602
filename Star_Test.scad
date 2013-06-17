fn=30;
Standard=1;
//Name,Number,X-cord,Y-cord,Layer,Intensity
A=[1,1,1,2,2];
B=[2,3,2,1,.2];
C=[3,7,5,1,1.2];
D=[4,3,7,3,.5];
E=[5,8,4,3,2.5];
F=[6,4,4,2,1.8];
G=[7,6,2,4,1];

module star(Standard,Intensity,loc){
	translate([loc[1],loc[2],loc[3]]){
		scale([Standard,Standard,Intensity]){
			difference(){
				sphere(1,$fn=fn);
				translate([0,0,-1]){
					cube(2,center=true);
				}
			}
		}
	}
	echo(loc);
}

module stars(){
	star(Standard,A[4],A);
	star(Standard,B[4],B);
	star(Standard,C[4],C);
	star(Standard,D[4],D);
	star(Standard,E[4],E);
	star(Standard,F[4],F);
	star(Standard,G[4],G);
}

//stars();
%cube(1);



linear_extrude(file = "Test.dxf", height = 1, center = true, layer = "L1");



