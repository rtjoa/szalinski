theitem = "1/8"; // [alt,bass,violin,#,b,natural,1/1,1/2,1/4,1/8,1/16,1/32,1/1 break,1/2 break,1/4 break,1/8 break,1/16 break,1/32 break]

//height of the note-body. a normal note has a height of "3.5 * note_body_height"
note_body_height =10;
zeilenhoehe = note_body_height;

ring_x = 5;
ring_y = 35;
ring_inner_radius = 3;
ring_wallthickness = 2;

z_height = 2; 

$fn=11+1;



 
linear_extrude(height=z_height)
difference(){
	union(){
		item(theitem);
		translate([ring_x,ring_y,0])
			circle(r=ring_inner_radius+ring_wallthickness);
	}
	translate([ring_x,ring_y,0])
		circle(r=ring_inner_radius);
	
}



module item(item){

if(item == "violin"){
	violinschluessel(zeilenhoehe);
}else if(item == "bass"){
	bassschluessel(zeilenhoehe);
}else if(item == "alt"){
	altschluessel(zeilenhoehe);
}else if(item == "#"){
	translate([0,-zeilenhoehe + 5*(zeilenhoehe/2),0])
			vorzeichen("#", zeilenhoehe);
}else if(item == "b"){
	translate([0,-zeilenhoehe + 5*(zeilenhoehe/2),0])
			vorzeichen("b", zeilenhoehe);
}else if(item == "natural"){
	translate([0,-zeilenhoehe + 5*(zeilenhoehe/2),0])
			vorzeichen("n", zeilenhoehe);
}else if(item == "1/1"){	
	note(zeilenhoehe,"1/1",5);
}else if(item == "1/2"){	
	note(zeilenhoehe,"1/2",5);
}else if(item == "1/4"){	
	note(zeilenhoehe,"1/4",5);
}else if(item == "1/8"){	
	note(zeilenhoehe,"1/8",5);
}else if(item == "1/16"){	
	note(zeilenhoehe,"1/6",5);
}else if(item == "1/32"){	
	note(zeilenhoehe,"1/3",5);
}else if(item == "1/32"){	
	note(zeilenhoehe,"1/3",5);
}else if(item == "1/1 break"){	
	break(zeilenhoehe,"1/1");
}else if(item == "1/2 break"){	
	break(zeilenhoehe,"1/2");
}else if(item == "1/4 break"){	
	break(zeilenhoehe,"1/4");
}else if(item == "1/8 break"){	
	break(zeilenhoehe,"1/8");
}else if(item == "1/16 break"){	
	break(zeilenhoehe,"1/6");
}else if(item == "1/32 break"){	
	break(zeilenhoehe,"1/3");
}

}


/////////////////////////////////////





module note(zh,nw,tonhoehe){

	notenradius = zh/2;
	zweidrittel=notenradius*2/3;

	if(nw != "1/1"){

	difference(){
	union(){
			translate([zh/2-zweidrittel/4,0,0])
				square(size = [zweidrittel/2,zh*3.5]);
		rotate([0,0,30])
			hull(){
				circle(r = zh/2);
				translate([zweidrittel,0,0])
					circle(r = zweidrittel);
				translate([-zweidrittel,0,0])
					circle(r = zweidrittel);
			}
	}
		if(nw == "1/2"){
			rotate([0,0,30])
				hull(){
					translate([zh/4,0,0])
						circle(r = zh/4);

					translate([-zh/4,0,0])
						circle(r = zh/4);
				}
		}
	}

	
	if(nw == "1/8"){
		translate([tonhoehe >= 6 ? zh/2.5 : zh/2 + (zweidrittel/4.1),zh*2.85,0])
			if(tonhoehe >= 6)
				mirror(0,1,0)
					fahne(zh);
			else
				fahne(zh);
	}
	if(nw == "1/6"){
		for(i=[0:1])
		translate([tonhoehe >= 6 ? zh/2.5 : zh/2 + (zweidrittel/4.1),zh*2.85 - (i*zh),0])
			if(tonhoehe >= 6)
				mirror(0,1,0)
					fahne(zh);
			else
				fahne(zh);
	}
	if(nw == "1/3"){
		for(i=[-1:1])
		translate([tonhoehe >= 6 ? zh/2.5 : zh/2 + (zweidrittel/4.1),zh*2.85 - (i*zh),0])
			if(tonhoehe >= 6)
				mirror(0,1,0)
					fahne(zh);
			else
				fahne(zh);
		translate([zh/2-zweidrittel/4,zh,0])
				square(size = [zweidrittel/2,zh*3.5]);
	}


	}else{
difference(){
	union(){
			hull(){
				circle(r = zh/2);
				translate([zweidrittel,0,0])
					circle(r = zweidrittel);
				translate([-zweidrittel,0,0])
					circle(r = zweidrittel);
			}
	}

			rotate([0,0,-30])
				hull(){
					translate([zh/8,0,0])
						circle(r = zh/4);

					translate([-zh/8,0,0])
						circle(r = zh/4);
				}
}

	}
}



module fahne(zh){
scale(v = [zh/4, zh/4, zh/4])
translate([1.5,-2.5,0])
  polygon(points=
    [[-1.608, 1.379], [-0.236, 0.839], [0.625, 0.102], [1.070, -0.770], [1.193, -1.716], [0.857, -3.582], [0.377, -5.000], [1.337, -3.268], [1.607, -1.766], [1.360, -0.448], [0.766, 0.733], [-0.765, 2.866], [-1.359, 3.910], [-1.608, 5.000]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 0]]
    );

}


module vorzeichen(vz, zh){
	if(vz == "#")
		vorzeichen_sharp(zh);
	if(vz == "b")
		vorzeichen_b(zh);
	if(vz == "n")
		vorzeichen_natural(zh);
}


module vorzeichen_sharp(zh) {
scale(v = [zh/5, zh/5, zh/5])
  polygon(points=
    [[0.676, 6.500], [0.676, 3.768], [-0.620, 3.194], [-0.620, 5.880], [-1.259, 5.880], [-1.259, 2.907], [-1.935, 2.611], [-1.935, 0.444], [-1.259, 0.741], [-1.259, -1.852], [-1.935, -2.148], [-1.935, -4.315], [-1.259, -4.018], [-1.259, -6.500], [-0.620, -6.500], [-0.620, -3.731], [0.676, -3.167], [0.676, -5.843], [1.315, -5.843], [1.315, -2.880], [1.935, -2.611], [1.935, -0.435], [1.315, -0.713], [1.315, 1.880], [1.935, 2.157], [1.935, 4.324], [1.315, 4.046], [1.315, 6.500], [0.676, 1.602], [0.676, -0.991], [-0.620, -1.565], [-0.620, 1.028]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 0, 0], [28, 29, 30, 31, 28, 28]]
    );
}

module vorzeichen_b(zh) {
scale(v = [zh/5, zh/5, zh/5])
translate([0,3,0])
  polygon(points=
    [[-3.276, 7.500], [-3.276, -7.500], [-3.093, -7.500], [-0.500, -6.648], [1.446, -5.288], [2.710, -3.675], [3.256, -2.064], [3.049, -0.712], [2.054, 0.127], [0.236, 0.197], [-2.440, -0.758], [-2.440, 7.500], [-3.276, 7.500], [-0.009, -0.627], [0.711, -0.811], [1.005, -1.301], [0.585, -2.862], [-0.741, -4.638], [-2.440, -5.958], [-2.440, -1.280]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 0], [13, 14, 15, 16, 17, 18, 19, 13, 13]]
    );
}

module vorzeichen_natural(zh) {
scale(v = [zh/5, zh/5, zh/5])
  polygon(points=
    [[-1.915, 6.500], [-1.915, -3.955], [1.295, -1.911], [1.295, -6.500], [1.915, -6.500], [1.915, 3.955], [-1.268, 1.929], [-1.268, 6.500], [1.295, 1.837], [1.295, -0.190], [-1.268, -1.818], [-1.268, 0.208]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 0], [8, 9, 10, 11, 8]]
    );
}


module break(zh,nw){
	if(nw == "1/1")
		pause_1_1(zh);
	if(nw == "1/2")
		pause_1_2(zh);
	if(nw == "1/4")
		pause_1_4(zh);
	if(nw == "1/8")
		pause_1_8(zh);
	if(nw == "1/6")
		pause_1_16(zh);
	if(nw == "1/3")
		pause_1_32(zh);
}


module pause_1_1(zh) {
translate([0,2.5*zh,0])
	square(size = [zh*2,zh*0.5]);
}

module pause_1_2(zh) {
translate([0,2*zh,0])
	square(size = [zh*2,zh*0.5]);
}

module pause_1_4(zh) {
translate([0,2*zh,0])
scale(v = [zh/5.5, zh/5.5, zh/5.5])
  polygon(points=
    [[-0.983, 7.462], [-1.147, 7.044], [-0.707, 6.498], [-0.039, 5.578], [0.121, 4.196], [-0.584, 2.939], [-1.172, 2.439], [-2.362, 1.138], [-2.407, 0.846], [-1.545, -0.471], [0.527, -2.922], [0.589, -2.983], [0.507, -2.942], [-1.205, -2.433], [-2.382, -2.442], [-2.677, -2.733], [-2.550, -4.386], [-1.402, -6.689], [-0.815, -7.465], [-0.605, -7.465], [-0.666, -7.174], [-1.124, -5.887], [-1.065, -4.554], [-0.605, -3.968], [0.668, -3.969], [1.907, -4.595], [2.075, -4.744], [2.494, -4.575], [2.346, -4.095], [0.778, -2.231], [0.191, -0.849], [0.372, 0.150], [0.946, 0.994], [1.530, 1.494], [2.744, 2.837], [2.600, 3.588], [0.946, 5.578], [-0.707, 7.483], [-0.983, 7.462]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 0]]
    );
}

module pause_1_8(zh) {
translate([0,2*zh,0])
scale(v = [zh/5.5, zh/5.5, zh/5.5])
  polygon(points=
    [[-1.481, 4.970], [-2.212, 4.617], [-2.667, 3.941], [-2.709, 3.489], [-2.537, 2.735], [-2.058, 2.169], [-1.355, 1.832], [-0.302, 1.807], [1.121, 2.152], [1.378, 2.241], [0.108, -1.269], [-1.140, -4.775], [-1.030, -4.843], [-0.536, -4.991], [0.088, -4.712], [1.421, -0.193], [2.711, 4.262], [2.669, 4.324], [2.218, 4.392], [2.066, 4.198], [1.121, 3.080], [0.539, 2.949], [0.150, 3.747], [-0.452, 4.802], [-1.481, 4.970]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 0]]
    );
}

module pause_1_16(zh) {
translate([0,1.5*zh,0])
scale(v = [zh/5.5, zh/5.5, zh/5.5])
  polygon(points=
    [[-0.573, 7.468], [-1.285, 7.123], [-1.724, 6.464], [-1.769, 6.024], [-1.601, 5.288], [-1.134, 4.737], [-0.445, 4.408], [0.557, 4.374], [1.924, 4.700], [2.194, 4.786], [1.212, 1.595], [0.434, 0.506], [-0.235, 0.254], [-0.614, 1.032], [-0.971, 1.846], [-1.808, 2.254], [-2.753, 2.014], [-3.361, 1.216], [-3.406, 0.777], [-3.238, 0.044], [-2.771, -0.507], [-2.082, -0.836], [-0.865, -0.836], [0.266, -0.543], [0.583, -0.461], [-1.515, -7.255], [-1.182, -7.444], [-0.676, -7.444], [-0.343, -7.235], [1.545, -0.206], [3.413, 6.777], [3.371, 6.838], [2.972, 6.924], [2.639, 6.505], [1.965, 5.646], [1.401, 5.498], [1.023, 6.275], [0.434, 7.303], [-0.573, 7.468]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 0]]
    );
}

module pause_1_32(zh) {
translate([0,2*zh,0])
scale(v = [zh/5.5, zh/5.5, zh/5.5])
  polygon(points=
    [[0.122, 9.959], [-0.580, 9.615], [-1.016, 8.963], [-1.061, 8.528], [-1.016, 8.093], [-0.689, 7.491], [-0.126, 7.078], [0.764, 6.891], [2.488, 7.200], [2.817, 7.306], [2.402, 5.708], [1.926, 3.969], [1.179, 2.973], [0.642, 2.826], [0.269, 3.594], [-0.085, 4.404], [-0.912, 4.803], [-1.846, 4.566], [-2.447, 3.782], [-2.492, 3.347], [-2.324, 2.619], [-1.863, 2.074], [-1.183, 1.749], [0.020, 1.749], [1.138, 2.038], [1.471, 2.144], [0.597, -1.092], [-0.147, -2.129], [-0.789, -2.357], [-1.162, -1.588], [-1.516, -0.783], [-2.343, -0.380], [-3.276, -0.617], [-3.878, -1.405], [-3.923, -1.839], [-3.878, -2.274], [-3.550, -2.876], [-2.987, -3.291], [-2.077, -3.478], [-1.370, -3.433], [-0.166, -3.124], [0.102, -3.018], [0.102, -3.084], [-1.682, -9.758], [-1.102, -10.005], [-0.520, -9.758], [1.740, -0.222], [3.919, 9.317], [3.625, 9.439], [3.272, 9.110], [2.467, 8.029], [2.073, 8.008], [1.699, 8.777], [1.118, 9.793], [0.122, 9.959]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 0]]
    );
}


module altschluessel(zh) {
scale(v = [zh/6.2, zh/6.2, zh/6.2])
translate([0,12.5,0])
  polygon(points=
    [[-8.123, -12.484], [-8.123, 11.892], [-8.123, 12.431], [-5.302, 12.431], [-5.302, -11.945], [-5.302, -12.484], [-3.880, -12.484], [-3.880, 11.892], [-3.880, 12.431], [-2.979, 12.431], [-2.979, 0.222], [-1.632, 1.681], [-0.497, 4.038], [-0.019, 5.888], [0.638, 3.753], [1.657, 2.611], [2.792, 2.273], [3.946, 2.591], [4.584, 3.552], [4.966, 6.692], [4.924, 8.203], [4.711, 9.556], [4.171, 10.782], [3.142, 11.522], [2.007, 11.681], [1.158, 11.501], [0.776, 10.994], [1.179, 10.317], [1.635, 9.736], [1.763, 9.186], [1.317, 8.097], [0.129, 7.643], [-1.059, 8.171], [-1.536, 9.429], [-1.331, 10.332], [-0.847, 11.100], [0.723, 12.135], [2.611, 12.484], [4.680, 12.104], [6.451, 10.983], [7.681, 9.165], [8.127, 6.744], [7.953, 5.033], [7.438, 3.647], [6.642, 2.572], [5.656, 1.829], [3.333, 1.216], [1.211, 1.787], [0.087, -0.031], [1.211, -1.839], [3.492, -1.363], [4.815, -1.567], [5.963, -2.167], [6.893, -3.089], [7.575, -4.249], [8.127, -6.892], [7.960, -8.333], [7.459, -9.672], [6.655, -10.824], [5.581, -11.723], [4.274, -12.293], [2.792, -12.484], [1.113, -12.229], [-0.263, -11.617], [-1.179, -10.644], [-1.483, -9.291], [-0.942, -8.129], [0.087, -7.653], [1.285, -8.129], [1.816, -9.291], [1.688, -9.799], [1.317, -10.338], [0.967, -10.782], [0.829, -11.152], [1.190, -11.628], [2.102, -11.860], [3.559, -11.450], [4.436, -10.391], [4.865, -8.816], [5.008, -6.892], [4.595, -3.699], [3.940, -2.668], [2.792, -2.325], [1.694, -2.590], [0.882, -3.393], [0.023, -5.898], [-0.635, -3.551], [-1.706, -1.554], [-2.979, -0.222], [-2.979, -12.484], [-3.880, -12.484]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 0, 0], [6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 6]]
    );}





module bassschluessel(zh) {
translate([0,zh*1.3,0])
scale(v = [zh/6.2, zh/6.2, zh/6.2])
translate([0,7.5,0])
  polygon(points=
    [[-6.497, -7.077], [-3.725, -5.161], [-1.850, -3.543], [-0.220, -1.360], [0.670, 0.713], [1.064, 2.959], [0.796, 4.860], [-0.102, 6.360], [-0.835, 6.802], [-1.763, 6.949], [-3.630, 6.556], [-4.367, 6.036], [-4.843, 5.268], [-4.922, 5.040], [-4.725, 4.750], [-4.410, 4.648], [-4.024, 4.718], [-3.496, 4.797], [-2.370, 4.357], [-1.874, 3.297], [-2.126, 2.457], [-2.811, 1.836], [-3.772, 1.609], [-4.646, 1.751], [-5.379, 2.182], [-5.868, 2.850], [-6.032, 3.690], [-5.850, 4.798], [-5.308, 5.747], [-3.449, 7.051], [-1.173, 7.491], [0.060, 7.331], [1.222, 6.847], [2.234, 6.090], [3.010, 5.103], [3.510, 3.959], [3.679, 2.732], [3.301, 0.551], [2.167, -1.470], [0.476, -3.285], [-1.574, -4.847], [-6.387, -7.486], [4.443, 5.072], [4.750, 5.779], [5.483, 6.069], [6.184, 5.747], [6.499, 5.033], [6.184, 4.310], [5.443, 4.027], [4.727, 4.334], [4.443, 0.957], [4.735, 1.671], [5.483, 1.962], [6.184, 1.648], [6.499, 0.957], [6.200, 0.211], [5.483, -0.088], [4.735, 0.203]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 0, 0], [42, 43, 44, 45, 46, 47, 48, 49, 42, 42], [50, 51, 52, 53, 54, 55, 56, 57, 50, 50]]
    );}



module violinschluessel(zh) {
scale(v = [zh/5.2, zh/5.2, zh/5.2])
translate([0,9.5,0])
  polygon(points=
    [[0.832, -1.806], [-0.578, -2.778], [-1.061, -3.577], [-1.220, -4.447], [-0.848, -5.711], [0.249, -6.726], [0.485, -6.967], [0.283, -7.088], [-0.767, -6.625], [-1.608, -5.840], [-2.165, -4.819], [-2.368, -3.656], [-2.153, -2.373], [-1.583, -1.187], [-0.715, -0.206], [0.367, 0.439], [-0.215, 3.492], [-1.983, 1.806], [-3.390, 0.043], [-4.321, -1.828], [-4.664, -3.854], [-4.284, -5.677], [-3.221, -7.294], [-1.577, -8.405], [0.485, -8.825], [2.140, -8.541], [1.439, -1.720], [2.756, -8.335], [3.610, -7.818], [4.219, -7.066], [4.706, -4.869], [4.175, -3.269], [3.052, -2.133], [-0.291, 7.225], [0.654, 8.120], [1.659, 9.574], [2.444, 11.277], [2.731, 12.885], [2.672, 13.505], [2.385, 14.218], [1.769, 14.459], [1.047, 14.221], [0.401, 13.505], [-0.359, 11.561], [-0.680, 9.324], [-0.823, 6.726], [-1.456, 10.984], [-1.178, 13.591], [-0.443, 15.698], [0.637, 17.066], [1.406, 17.487], [1.693, 17.367], [2.022, 16.988], [3.154, 14.583], [3.533, 11.733], [3.153, 8.868], [2.064, 6.202], [0.333, 4.000], [1.017, 0.611], [1.786, 0.688], [3.533, 0.275], [4.892, -0.843], [5.753, -2.443], [6.057, -4.327], [5.861, -5.784], [5.272, -7.105], [4.290, -8.190], [2.908, -8.946], [3.271, -10.761], [3.651, -12.644], [3.769, -13.995], [3.288, -15.810], [1.963, -17.048], [0.148, -17.487], [-1.157, -17.288], [-2.284, -16.696], [-3.079, -15.758], [-3.381, -14.537], [-3.094, -13.393], [-2.402, -12.515], [-1.372, -12.137], [-0.435, -12.412], [0.266, -13.169], [0.528, -14.218], [0.021, -15.509], [-1.262, -16.042], [-1.456, -16.042], [-0.804, -16.627], [0.165, -16.825], [1.321, -16.584], [2.326, -15.930], [2.866, -15.053], [3.077, -13.599], [2.959, -12.361], [2.604, -10.743], [2.258, -9.212], [0.680, -9.410], [-0.663, -9.267], [-1.929, -8.834], [-4.090, -7.225], [-5.534, -4.886], [-6.057, -2.159], [-5.559, 0.353], [-4.386, 2.615], [-2.891, 4.542]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 0, 0], [26, 27, 28, 29, 30, 31, 32, 26, 26], [33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 33, 33], [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 45, 45]]
    );}

