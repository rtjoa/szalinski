include <write/Write.scad>

// preview[view:south, tilt:top]

wall_thickness = 1.6; //[1.6:Thicker,.8:Thinner]
height = 15; //[15:Short,30:Tall]

//To start a new shape, press the 'Undo' or 'Clear' buttons below the canvas. To return to the bunny, press the 'Revert to Default' button.
shape = [[[-30.607849,-48.473831],[-38.714745,-48.950043],[-40.559818,-48.486679],[-42.201851,-47.493645],[-47.306175,-42.282654],[-50.067959,-38.508476],[-47.496841,-39.749046],[-46.892071,-39.806171],[-46.653542,-39.556297],[-49.260830,-36.213120],[-49.681732,-34.902710],[-49.585598,-33.782043],[-49.138451,-33.165283],[-48.672112,-33.207165],[-46.200596,-35.658916],[-47.279457,-33.120216],[-47.321926,-32.230251],[-46.990898,-31.375122],[-45.878410,-30.094749],[-43.224831,-28.013985],[-42.217957,-27.615326],[-41.118553,-27.667067],[-40.805717,-27.398746],[-40.440659,-25.661360],[-39.173859,-13.378041],[-37.786060,-6.545761],[-36.585690,-3.203835],[-34.921036,-0.177278],[-32.697136,2.334522],[-31.352158,3.341671],[-28.276741,4.879042],[-24.862782,5.878342],[-21.320715,6.457005],[-16.227745,6.793123],[-6.193724,6.651176],[-3.917368,6.182596],[1.149520,4.628635],[3.496422,4.354591],[5.367534,4.861082],[8.187830,6.665401],[10.588829,7.390333],[11.411912,7.954811],[11.835903,9.095350],[12.399237,12.947439],[13.889902,16.162262],[13.933737,17.683546],[13.316607,19.065596],[11.898010,21.208532],[6.859921,27.302176],[5.617778,29.462534],[5.115950,31.361303],[3.388903,42.964180],[3.273381,46.066513],[3.726890,48.114418],[4.978456,49.315399],[7.242655,49.967201],[8.609360,50.079552],[9.707384,49.859634],[11.739238,48.611275],[14.175842,46.044868],[16.663437,42.226387],[17.125431,47.022690],[17.457367,48.010414],[17.989151,48.348061],[19.181324,47.905319],[24.528868,44.299988],[25.586594,43.349907],[26.602041,41.795021],[27.508392,39.332878],[29.795576,26.542974],[30.282230,24.476656],[31.117352,22.414083],[31.720629,21.625368],[32.642006,21.057058],[35.131134,20.683912],[36.914520,20.059973],[39.043831,18.184668],[42.450657,14.071085],[46.617176,8.405781],[48.564854,5.175398],[49.817593,2.084951],[50.067959,0.425432],[49.656380,-0.983798],[48.150597,-2.837172],[45.817619,-4.786176],[42.303886,-6.914544],[36.506889,-8.046309],[35.342590,-8.523187],[34.626579,-9.248261],[34.336266,-10.490269],[34.565552,-12.031119],[35.052368,-13.404231],[37.089733,-17.042198],[37.317879,-18.115067],[37.155357,-19.071182],[35.604301,-21.320902],[33.913990,-23.043991],[33.883816,-28.314064],[33.082306,-30.108660],[31.550901,-32.176041],[30.204401,-33.504837],[26.342428,-35.397213],[25.570063,-36.226906],[25.784672,-37.377975],[26.657942,-38.691196],[35.016315,-47.244415],[36.307613,-48.865204],[36.517559,-49.673759],[35.642605,-50.079552],[30.526541,-50.070801],[27.432796,-49.786285],[24.770382,-49.194931],[21.059244,-47.649162],[13.547039,-43.090836],[12.276370,-42.541962],[10.688703,-42.258522],[3.786492,-43.914528],[2.470330,-44.603432],[2.196272,-45.124454],[2.270218,-46.117500],[3.513528,-49.225983],[3.376098,-49.617065],[2.794866,-49.836327],[-5.766325,-50.020004],[-18.879635,-49.768524],[-25.214447,-49.130280],[-29.151905,-47.714996],[-30.600498,-48.472359]],[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127]]]; //[draw_polygon:120x120]

//Set to Yes to make the cookies look like the drawing
mirror = "Yes"; //[Yes,No]

if(mirror == "No"){
	cookie_cutter(shape);
} else {
	if(len(shape[0]) > 0) {
		scale([-1,1,1])
			cookie_cutter(shape);
	} else {
		cookie_cutter(shape);
	}
}

module grid(){

translate([-120,0])
	for(i = [0:10]){
		translate([30*i,0])
		square([5,200], center = true);
	}
rotate([0,0,90])
	translate([-120,0])
		for(i = [0:7]){
			translate([30*i,0])
			square([5,250], center = true);
		}

}

module outset(shape,path_index,dist){

		minkowski(){
			polygon(points = shape[0], paths = [shape[1][path_index]], convexity = 10);
			circle(r=dist);
		}

	
}

module cookie_cutter (shape){
	if(len(shape[0])>3){
		if(len(shape[1])>1){
		linear_extrude(height=wall_thickness)
			difference(){
				intersection(){
					grid();
					outset(shape,0,.5);
				}
				for(i = [1:len(shape[1])-1]){	
					if(i!=0){
						outset(shape,i,1);
					}
				}
			}
		}
	
		for(i = [0:len(shape[1])-1]){	
		translate([0,0,wall_thickness/2])
			linear_extrude(height=height)
				difference(){
					outset(shape,i,wall_thickness);
					polygon(points=shape[0], paths=[shape[1][i]]);
				}
		linear_extrude(height=wall_thickness)
			difference(){
				outset(shape,i,5);
				polygon(points=shape[0], paths=[shape[1][i]]);
			}
		}
	} else {
		write("<-- Draw A Shape");
	}
}
