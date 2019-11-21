use <write/Write.scad>

//preview[view:south,tilt:top]

//CUSTOMIZER VARIABLES

sign_size = 0; //[0:Makerbot Replicator 2,1:Makerbot Replicator,2:Makerbot Thingomatic,3:Manual]
//sets the length of the sign if the Sign Size is set to "manual"
manual_length = 100; //[100:300]
//sets the width of the sign if the Sign Size is set to "manual"
manual_width = 100; //[100:300]
message_one = "250RQ";
font_one_size = 60;//[20:60]
message_two = "S.N.: 0001";
font_two_size = 30;//[20:60]
Font = "write/orbitron.dxf";//["write/Letters.dxf":Basic,"write/orbitron.dxf":Futuristic,"write/BlackRose.dxf":Fancy]
icon = 0; //[0:Makerbot Replicator 2,1:Radiation,2:Radiation Sign,3:Skull and Crossbones,4:Hang Loose,5:Money,6:Bomb,7:Makerbot Logo]
icon_size = 0; //[0:20]
icon_rotation = 0; //[-20:20]
hole_radius = 2.5; //[0:none,2.5:Small,5:Big]
emboss_style = 0; //[0:Raised,1:Cut Out]


//CUSTOMIZER VARIABLES END








build_plate_size = sign_size; 
manual_build_plate_length = manual_length;
manual_build_plate_width = manual_width;

holeR = hole_radius;


font_one_scale = font_one_size/10;
font_two_scale = font_two_size/10;



REP2length = 285/1;
REP2width = 153/1;
REP1length = 225/1;
REP1width = 145/1;
ToMlength = 120/1;
ToMwidth = 120/1;
height = 5/1;
cornerR = 15/1;




icon_rot = icon_rotation*-9;


main();

icon_scale = icon_size/5;

module main() {
	plateLength = 0;
	plateWidth = 0;
	
	if(build_plate_size == 0){
		assign(plateLength = REP2length - 20){	
			assign(plateWidth = REP2width - 20){
				echo(plateLength);
				echo(plateWidth);
				sign(plateLength,plateWidth);
			}
		}
	}

	if(build_plate_size == 1){
		assign(plateLength = REP1length - 20){	
			assign(plateWidth = REP1width - 20){
				sign(plateLength,plateWidth);
			}
		}
	}

	if(build_plate_size == 2){
		assign(plateLength = ToMlength - 20){	
			assign(plateWidth = ToMwidth - 20){
				sign(plateLength,plateWidth);
			}
		}
	}

	if(build_plate_size == 3){
		assign(plateLength = manual_build_plate_length - 20){	
			assign(plateWidth = manual_build_plate_width - 20){
				sign(plateLength,plateWidth);
			}
		}
	}
}








module sign(pL,pW) {
	plateLength = pL;
	plateWidth = pW; 



	translate([-plateLength/2,-plateWidth/2,0])
	difference(){
		if(emboss_style == 0){
			union(){
				translate([plateLength/2,plateWidth-20,5])
					color([1,1,1])
						scale([font_one_scale,font_one_scale,5])
							write(message_one,space=1.05,center = true,font = Font);
			
				translate([plateLength/2,20,5])
					color([1,1,1])
						scale([font_two_scale,font_two_scale,5])
							write(message_two,space=1.05,center = true,font = Font);
			
				color([1,1,1]){
					translate([plateLength/2,plateWidth/2,5])
						linear_extrude(height = 5, center = true, convexity = 10, slices = 5)	
							scale([icon_scale,icon_scale,0]){
								rotate([0,0,icon_rot]){
									if(icon == 0)
										translate([4,0,0])
										scale(.25)
										makerbot_replicator_2();	
									if(icon == 1)
										radiation();
									if(icon == 2)
										radiation_sign();
									if(icon == 3)
										scale(.2)
										skull_crossbones();
									if(icon == 4)
										translate([0,2,0])
										scale(.18)
										hang_loose();
									if(icon == 5)
										translate([0,-1,0])
										scale(.15)
										money();
									if(icon == 6)
										bomb();
									if(icon == 7)
										translate([0,-1,0])
										scale([.8,.8,1])
										makerbot_logo();
								}
							}
				}
	
				union(){
					translate([cornerR,0,0])
						cube([plateLength-cornerR*2,plateWidth,5]);
					translate([0,cornerR,0])
						cube([plateLength,plateWidth-cornerR*2,5]);
					translate([cornerR,cornerR,0])
						cylinder(h = height, r = cornerR);
					translate([cornerR+(plateLength-cornerR*2),cornerR,0])
						cylinder(h = height, r = cornerR);
					translate([cornerR,cornerR+(plateWidth-cornerR*2),0])
						cylinder(h = height, r = cornerR);
					translate([cornerR+(plateLength-cornerR*2),cornerR+(plateWidth-cornerR*2),0])
						cylinder(h = height, r = cornerR);
				}
			}
		} else {
			difference(){
				union(){
					translate([cornerR,0,0])
						cube([plateLength-cornerR*2,plateWidth,5]);
					translate([0,cornerR,0])
						cube([plateLength,plateWidth-cornerR*2,5]);
					translate([cornerR,cornerR,0])
						cylinder(h = height, r = cornerR);
					translate([cornerR+(plateLength-cornerR*2),cornerR,0])
						cylinder(h = height, r = cornerR);
					translate([cornerR,cornerR+(plateWidth-cornerR*2),0])
						cylinder(h = height, r = cornerR);
					translate([cornerR+(plateLength-cornerR*2),cornerR+(plateWidth-cornerR*2),0])
						cylinder(h = height, r = cornerR);
				}

				union(){
					translate([plateLength/2,plateWidth-20,5])
						color([1,1,1])
							scale([font_one_scale,font_one_scale,5])
								write(message_one,space=1.05,center = true,font = Font);
				
					translate([plateLength/2,20,5])
						color([1,1,1])
							scale([font_two_scale,font_two_scale,5])
								write(message_two,space=1.05,center = true,font = Font);
				
					color([1,1,1]){
						translate([plateLength/2,plateWidth/2,5])
							linear_extrude(height = 5, center = true, convexity = 10, slices = 5)	
								scale([icon_scale,icon_scale,0]){
									rotate([0,0,icon_rot]){
										if(icon == 0)
											translate([4,0,0])
											scale(.25)
											makerbot_replicator_2();	
										if(icon == 1)
											radiation();
										if(icon == 2)
											radiation_sign();
										if(icon == 3)
											scale(.2)
											skull_crossbones();
										if(icon == 4)
											translate([0,2,0])
											scale(.18)
											hang_loose();
										if(icon == 5)
											translate([0,-1,0])
											scale(.15)
											money();
										if(icon == 6)
											bomb();
										if(icon == 7)
											translate([0,-1,0])
											scale([.8,.8,1])
											makerbot_logo();
									}
								}
					}
				}
			}
		}
		translate([cornerR,cornerR+(plateWidth-cornerR*2),0])
			cylinder(h = height*4, r = holeR,center = true);
		translate([cornerR+(plateLength-cornerR*2),cornerR+(plateWidth-cornerR*2),0])
			cylinder(h = height*4, r = holeR,center = true);
	}
	
}

module radiation_sign() {
  polygon(points=
    [[1.129, -3.788], [0.798, -4.587], [0.000, -4.917], [-0.798, -4.587], [-1.129, -3.788], [-0.798, -2.990], [0.000, -2.660], [0.798, -2.990], [0.000, -5.482], [-0.853, -5.252], [-2.545, -8.181], [-1.339, -8.688], [0.000, -8.868], [1.339, -8.688], [2.545, -8.180], [0.854, -5.252], [1.708, -3.773], [1.707, -3.788], [5.084, -3.788], [4.921, -2.491], [4.408, -1.241], [3.582, -0.172], [2.540, 0.618], [0.857, -2.297], [1.473, -2.910], [-0.850, -2.293], [-2.540, 0.633], [-3.582, -0.156], [-4.408, -1.226], [-4.921, -2.477], [-5.084, -3.773], [-1.708, -3.773], [-1.471, -2.906], [13.832, -10.684], [0.975, 11.585], [0.535, 12.020], [0.000, 12.128], [-0.534, 12.020], [-0.975, 11.585], [-13.832, -10.684], [-13.981, -11.262], [-13.827, -11.812], [-13.432, -12.222], [-12.857, -12.383], [12.857, -12.383], [13.432, -12.222], [13.827, -11.811], [13.981, -11.262], [0.000, 8.757], [10.902, -10.125], [-10.902, -10.125]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 0, 0], [8, 9, 10, 11, 12, 13, 14, 15, 8, 8], [16, 17, 18, 19, 20, 21, 22, 23, 24, 16, 16], [25, 26, 27, 28, 29, 30, 31, 32, 25, 25], [33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 33, 33], [48, 49, 50, 48, 48]]
    );}


module radiation(){
	rad1();
	rad2();
	rad3();
	rad4();
}

module rad1() {
  polygon(points=
    [[7.018, -11.155], [2.353, -3.148], [0.796, -3.660], [-0.117, -3.749], [-1.040, -3.660], [-2.605, -3.148], [-7.285, -11.155], [-5.350, -12.218], [-3.075, -12.948], [-0.056, -13.280], [2.932, -12.948], [5.155, -12.218]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 0, 0, 0]]
    );}
module rad2() {
  polygon(points=
    [[-0.034, -1.810], [1.041, -1.592], [1.915, -0.998], [2.502, -0.120], [2.717, 0.953], [2.502, 2.031], [1.915, 2.913], [1.041, 3.508], [-0.034, 3.727], [-1.110, 3.508], [-1.988, 2.913], [-2.580, 2.031], [-2.797, 0.953], [-2.580, -0.120], [-1.988, -0.998], [-1.110, -1.592]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 0, 0, 0, 0]]
    );}
module rad3() {
  polygon(points=
    [[6.925, 13.117], [2.329, 5.064], [3.541, 3.977], [4.068, 3.232], [4.458, 2.369], [4.795, 0.729], [14.070, 0.739], [14.026, 2.934], [13.524, 5.263], [12.307, 8.042], [10.519, 10.471], [8.774, 12.034]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 0, 0, 0]]
    );}
module rad4() {
  polygon(points=
    [[-14.057, 0.906], [-4.773, 0.906], [-4.445, 2.527], [-4.065, 3.372], [-3.526, 4.129], [-2.289, 5.231], [-6.898, 13.280], [-8.784, 12.138], [-10.553, 10.535], [-12.351, 8.088], [-13.559, 5.334], [-14.041, 3.047]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 0, 0, 0, 0]]
    );}


module bomb() {
  polygon(points=
    [[4.524, 11.943], [5.827, 12.172], [5.573, 10.404], [4.512, 9.325], [2.751, 9.059], [1.363, 9.795], [0.651, 11.207], [0.278, 11.893], [-0.435, 12.244], [-1.294, 12.113], [-1.822, 11.557], [-1.786, 9.807], [-0.483, 9.940], [0.253, 5.765], [3.952, 4.922], [6.671, 3.087], [8.621, 0.481], [9.616, -3.054], [9.581, -5.170], [9.143, -7.028], [7.504, -9.955], [5.111, -12.105], [1.833, -13.370], [-0.260, -13.535], [-2.245, -13.285], [-5.406, -11.898], [-7.750, -9.678], [-9.255, -6.662], [-9.621, -4.704], [-9.580, -2.632], [-8.458, 0.783], [-6.439, 3.310], [-3.644, 5.054], [-4.368, 9.252], [-3.077, 9.566], [-3.282, 11.026], [-2.908, 12.317], [-2.050, 13.184], [-0.797, 13.584], [0.256, 13.429], [1.061, 12.956], [1.954, 11.364], [2.447, 10.581], [3.330, 10.326], [4.273, 10.808]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 0, 0]]
    );}

module skull_crossbones() {
  polygon(points=
    [[-0.141, 68.518], [-8.246, 68.036], [-16.875, 66.590], [-25.281, 63.980], [-32.720, 60.007], [-32.720, 59.998], [-32.729, 59.998], [-38.887, 54.306], [-43.567, 47.249], [-46.438, 39.248], [-47.166, 30.727], [-47.157, 30.727], [-47.157, 30.718], [-46.182, 23.390], [-44.135, 16.606], [-41.131, 10.630], [-37.288, 5.724], [-38.100, 1.499], [-38.109, 1.438], [-38.109, 1.376], [-37.539, -7.221], [-36.202, -10.576], [-34.254, -13.070], [-34.254, -13.079], [-34.246, -13.079], [-34.122, -13.185], [-48.198, -6.112], [-49.915, -4.158], [-51.047, -1.914], [-52.689, 0.846], [-55.774, 3.563], [-55.906, 3.634], [-59.152, 4.639], [-61.630, 3.836], [-63.517, 1.632], [-63.623, 1.420], [-64.652, -2.617], [-64.893, -6.376], [-67.544, -8.756], [-70.220, -11.959], [-70.229, -11.968], [-71.225, -15.258], [-70.008, -17.939], [-68.001, -19.269], [-66.172, -19.835], [-66.172, -19.844], [-66.154, -19.844], [-62.319, -20.282], [-59.337, -19.949], [-54.363, -19.755], [-27.164, -32.782], [-27.172, -35.216], [-36.520, -40.073], [-46.460, -44.458], [-49.311, -44.736], [-51.496, -44.212], [-54.685, -43.799], [-59.513, -44.705], [-60.051, -44.996], [-61.668, -46.894], [-62.309, -49.150], [-61.887, -51.403], [-60.589, -53.357], [-60.545, -53.401], [-55.897, -57.829], [-55.077, -64.540], [-54.998, -64.911], [-53.409, -67.599], [-51.011, -68.897], [-48.466, -68.653], [-46.249, -67.398], [-45.949, -67.115], [-42.862, -63.244], [-42.853, -63.226], [-39.687, -58.331], [-22.419, -49.186], [-22.401, -49.177], [-18.613, -53.085], [-14.164, -55.774], [-14.129, -55.783], [-14.093, -55.800], [-7.127, -57.696], [0.256, -58.190], [7.502, -57.650], [14.314, -55.597], [18.755, -52.959], [22.569, -49.133], [39.511, -57.926], [42.483, -61.983], [43.560, -64.077], [45.473, -66.234], [45.464, -66.242], [45.579, -66.339], [47.775, -68.072], [50.112, -68.932], [52.598, -68.388], [54.574, -66.533], [54.707, -66.295], [55.976, -61.778], [56.338, -57.591], [61.251, -53.084], [61.277, -53.049], [62.573, -51.036], [62.865, -48.718], [61.804, -46.531], [59.672, -44.935], [59.540, -44.873], [55.585, -43.814], [51.091, -44.220], [51.073, -44.229], [48.795, -44.685], [46.284, -44.167], [46.284, -44.176], [27.375, -35.410], [27.367, -32.623], [27.437, -32.588], [54.010, -20.064], [54.019, -20.064], [56.508, -19.430], [58.252, -19.694], [60.457, -20.195], [63.597, -20.188], [63.641, -20.188], [66.430, -19.859], [68.923, -18.785], [70.755, -16.660], [71.322, -13.705], [71.031, -12.850], [64.981, -6.156], [64.588, -1.800], [63.341, 2.434], [63.147, 2.787], [61.544, 4.322], [59.249, 5.018], [58.922, 5.018], [56.557, 4.345], [54.169, 2.611], [54.107, 2.549], [54.019, 2.478], [51.950, 0.092], [50.808, -2.284], [47.986, -6.385], [34.784, -12.876], [36.714, -10.376], [38.039, -7.024], [38.602, 1.543], [38.594, 1.605], [38.585, 1.658], [37.650, 6.562], [41.657, 11.312], [44.858, 17.166], [46.892, 24.061], [47.395, 31.935], [47.395, 31.961], [46.202, 40.275], [43.210, 47.941], [38.470, 54.785], [32.032, 60.633], [32.014, 60.642], [26.067, 63.728], [18.415, 66.136], [3.969, 68.430], [3.969, 68.438], [3.881, 68.438], [0.926, 64.981], [3.792, 64.911], [3.836, 64.911], [3.881, 64.911], [17.524, 62.715], [24.828, 60.374], [29.924, 57.802], [29.933, 57.793], [29.942, 57.785], [35.831, 52.465], [40.123, 46.296], [42.806, 39.382], [43.868, 31.829], [43.868, 31.811], [43.868, 31.803], [43.550, 25.454], [42.127, 19.843], [39.828, 14.986], [36.883, 10.901], [36.627, 18.873], [36.636, 18.944], [36.636, 19.023], [37.775, 23.065], [39.132, 28.372], [39.132, 28.381], [39.343, 34.157], [38.659, 36.744], [37.024, 38.955], [34.695, 36.301], [35.833, 33.796], [35.621, 28.707], [35.621, 28.698], [34.350, 24.406], [33.126, 19.297], [33.108, 19.147], [33.117, 19.147], [33.502, 9.454], [35.101, 1.094], [35.101, 1.067], [34.463, -6.160], [32.394, -10.275], [32.385, -10.283], [28.849, -12.186], [25.003, -13.582], [24.968, -13.591], [24.968, -13.599], [18.362, -17.436], [18.291, -17.489], [18.230, -17.542], [15.476, -21.639], [14.737, -26.052], [8.306, -27.363], [0.415, -27.728], [0.406, -27.728], [-7.331, -27.507], [-14.252, -26.229], [-14.947, -21.915], [-17.683, -17.656], [-17.789, -17.542], [-17.912, -17.445], [-20.863, -15.338], [-24.580, -13.732], [-24.580, -13.723], [-28.681, -12.345], [-31.900, -10.451], [-31.909, -10.442], [-33.982, -6.294], [-34.598, 0.988], [-34.598, 1.023], [-33.006, 9.349], [-32.632, 18.988], [-32.623, 18.988], [-32.641, 19.129], [-33.865, 24.244], [-35.136, 28.540], [-35.348, 33.628], [-34.210, 36.133], [-36.539, 38.788], [-38.174, 36.576], [-38.858, 33.990], [-38.647, 28.213], [-38.647, 28.204], [-37.290, 22.898], [-36.151, 18.856], [-36.151, 18.785], [-36.142, 18.706], [-36.477, 10.133], [-41.369, 19.368], [-42.889, 24.948], [-43.638, 30.912], [-42.972, 38.480], [-40.383, 45.658], [-36.182, 52.015], [-30.683, 57.123], [-30.674, 57.132], [-23.675, 60.767], [-15.466, 63.200], [-6.960, 64.561], [-11.527, 17.348], [-12.859, 17.171], [-24.139, 15.646], [-27.046, 14.212], [-28.805, 12.098], [-29.522, 9.703], [-29.307, 7.426], [-26.608, 0.723], [-23.735, -2.417], [-20.849, -3.854], [-17.154, -4.077], [-13.679, -1.861], [-9.816, 3.087], [-6.747, 8.475], [-6.396, 11.497], [-7.142, 14.371], [-8.885, 16.516], [11.818, 17.348], [9.176, 16.516], [7.433, 14.371], [6.687, 11.497], [7.038, 8.475], [10.107, 3.087], [13.970, -1.861], [17.445, -4.077], [21.140, -3.854], [24.026, -2.417], [26.899, 0.723], [29.598, 7.426], [29.813, 9.703], [29.096, 12.098], [27.337, 14.212], [24.430, 15.646], [13.150, 17.171], [59.099, 1.490], [59.178, 1.490], [60.139, 0.900], [61.226, -2.939], [61.462, -6.809], [62.027, -8.202], [67.803, -14.420], [66.957, -15.857], [63.561, -16.660], [63.261, -16.686], [59.125, -16.272], [56.410, -15.965], [52.705, -16.783], [52.608, -16.827], [28.804, -28.046], [30.383, -18.970], [49.794, -9.428], [50.138, -9.207], [52.705, -6.306], [54.054, -3.660], [56.303, -0.212], [56.453, -0.079], [-59.301, 1.111], [-59.204, 1.111], [-57.564, 0.512], [-55.422, -1.330], [-54.239, -3.422], [-52.861, -6.093], [-50.315, -8.952], [-50.068, -9.119], [-30.145, -19.015], [-28.557, -28.196], [-53.119, -16.448], [-53.507, -16.316], [-57.115, -16.077], [-59.954, -16.475], [-65.307, -16.422], [-65.325, -16.422], [-67.512, -15.452], [-67.706, -15.081], [-67.230, -13.829], [-67.230, -13.820], [-61.877, -8.361], [-61.400, -7.276], [-60.413, -0.062], [-59.566, 0.979], [-0.873, -0.203], [-5.733, -5.283], [-7.585, -9.640], [-8.070, -14.129], [-7.333, -18.429], [-5.653, -19.949], [-3.677, -18.917], [-0.917, -15.981], [1.094, -0.256], [1.138, -16.034], [3.894, -18.975], [5.865, -20.011], [7.549, -18.486], [8.290, -14.182], [7.796, -9.701], [5.953, -5.345], [26.538, -16.783], [24.411, -22.627], [23.336, -28.804], [23.327, -29.042], [23.380, -29.272], [23.777, -36.398], [23.036, -40.657], [23.036, -40.675], [22.569, -42.095], [22.472, -42.342], [22.463, -42.359], [18.452, -48.278], [12.982, -52.325], [6.869, -54.204], [0.256, -54.662], [-6.523, -54.243], [-12.823, -52.511], [-12.823, -52.502], [-15.892, -50.621], [-18.817, -47.760], [-22.728, -41.037], [-22.807, -40.710], [-22.807, -40.701], [-23.574, -36.283], [-23.169, -29.272], [-23.116, -29.042], [-23.124, -28.804], [-24.183, -22.687], [-26.282, -16.898], [-25.611, -17.101], [-25.576, -17.110], [-25.541, -17.118], [-24.959, -17.286], [-21.793, -25.991], [-21.784, -26.008], [-19.870, -36.283], [-19.897, -36.301], [-19.870, -36.336], [-19.861, -36.371], [-19.835, -36.371], [-15.632, -40.079], [-10.793, -42.287], [-5.450, -43.387], [0.265, -43.771], [0.273, -43.771], [6.603, -43.352], [12.356, -41.804], [16.991, -39.376], [19.932, -36.168], [19.949, -36.168], [21.881, -25.805], [21.881, -25.788], [24.897, -17.445], [26.167, -16.916], [26.185, -16.907], [26.202, -16.898], [-22.586, -18.415], [-20.179, -20.161], [-18.169, -23.144], [-17.780, -26.158], [-17.692, -26.158], [-17.718, -26.211], [-16.492, -26.873], [-16.669, -26.873], [-16.766, -37.024], [-18.186, -35.586], [-20.099, -25.514], [-20.099, -25.506], [-20.099, -25.488], [22.401, -18.865], [20.196, -25.285], [20.188, -25.294], [20.188, -25.303], [18.256, -35.551], [16.986, -37.068], [16.871, -26.705], [18.115, -26.044], [18.089, -26.000], [18.265, -26.000], [18.698, -22.935], [20.611, -20.152], [15.478, -27.296], [15.522, -31.697], [13.026, -33.081], [13.000, -28.037], [-15.266, -27.384], [-12.850, -28.116], [-12.876, -33.055], [-15.302, -31.785], [11.589, -28.337], [11.615, -33.646], [8.766, -34.422], [8.714, -28.751], [-11.439, -28.416], [-8.617, -28.831], [-8.669, -34.448], [-11.465, -33.628], [7.302, -28.892], [7.355, -34.660], [5.036, -34.934], [5.009, -29.025], [-7.205, -28.963], [-4.798, -29.104], [-4.824, -35.057], [-7.267, -34.740], [3.598, -29.086], [3.625, -35.039], [0.900, -35.163], [0.900, -29.130], [-3.387, -29.148], [-0.512, -29.157], [-0.512, -35.198], [-3.413, -35.163], [15.540, -33.355], [15.584, -38.170], [13.061, -39.590], [13.035, -34.607], [-15.319, -33.417], [-12.885, -34.590], [-12.903, -39.599], [-15.372, -38.144], [-11.474, -35.128], [-8.687, -35.895], [-8.731, -41.037], [-11.500, -40.199], [11.624, -35.128], [11.650, -40.181], [8.819, -41.072], [8.775, -35.851], [7.364, -36.089], [7.417, -41.398], [5.071, -41.795], [5.045, -36.353], [-7.276, -36.168], [-4.833, -36.468], [-4.859, -41.680], [-7.329, -41.328], [3.634, -36.459], [3.660, -41.927], [0.900, -42.016], [0.900, -36.574], [-3.422, -36.574], [-0.512, -36.609], [-0.512, -41.980], [-3.448, -41.813], [-26.784, -38.999], [-26.246, -41.522], [-26.238, -41.548], [-26.097, -42.086], [-24.438, -46.258], [-41.698, -55.394], [-42.227, -55.827], [-45.914, -61.480], [-45.931, -61.498], [-48.507, -64.672], [-50.420, -65.422], [-51.593, -63.940], [-52.537, -56.567], [-53.022, -55.694], [-58.031, -50.923], [-58.031, -50.914], [-58.781, -49.283], [-58.031, -47.951], [-54.609, -47.276], [-52.414, -47.616], [-49.642, -48.200], [-45.499, -47.863], [-45.287, -47.801], [-35.642, -43.578], [26.978, -39.105], [44.864, -47.395], [44.926, -47.431], [48.833, -48.175], [52.096, -47.607], [52.114, -47.598], [55.206, -47.279], [58.129, -48.101], [59.381, -49.247], [58.622, -50.720], [58.596, -50.755], [53.419, -55.456], [52.899, -56.479], [52.465, -60.921], [51.576, -64.646], [50.544, -65.431], [47.845, -63.649], [47.730, -63.552], [45.693, -60.510], [44.325, -58.057], [41.707, -55.156], [41.363, -54.927], [24.544, -46.196], [26.273, -42.183], [26.326, -41.989], [26.449, -41.566], [26.449, -41.548], [26.458, -41.522], [26.458, -41.513], [26.485, -41.398]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 0, 0], [164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221, 222, 223, 224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 261, 164, 164], [262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 262, 262], [279, 280, 281, 282, 283, 284, 285, 286, 287, 288, 289, 290, 291, 292, 293, 294, 295, 279, 279], [296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 296, 296], [318, 319, 320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 318, 318], [342, 343, 344, 345, 346, 347, 348, 349, 342, 342], [350, 351, 352, 353, 354, 355, 356, 357, 350, 350], [358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413, 358, 358], [414, 415, 416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 414, 414], [427, 428, 429, 430, 431, 432, 433, 434, 435, 436, 437, 438, 427, 427], [439, 440, 441, 442, 439, 439], [443, 444, 445, 446, 443, 443], [447, 448, 449, 450, 447, 447], [451, 452, 453, 454, 451, 451], [455, 456, 457, 458, 455, 455], [459, 460, 461, 462, 459, 459], [463, 464, 465, 466, 463, 463], [467, 468, 469, 470, 467, 467], [471, 472, 473, 474, 471, 471], [475, 476, 477, 478, 475, 475], [479, 480, 481, 482, 479, 479], [483, 484, 485, 486, 483, 483], [487, 488, 489, 490, 487, 487], [491, 492, 493, 494, 491, 491], [495, 496, 497, 498, 495, 495], [499, 500, 501, 502, 499, 499], [503, 504, 505, 506, 507, 508, 509, 510, 511, 512, 513, 514, 515, 516, 517, 518, 519, 520, 521, 522, 523, 524, 525, 526, 503, 503], [527, 528, 529, 530, 531, 532, 533, 534, 535, 536, 537, 538, 539, 540, 541, 542, 543, 544, 545, 546, 547, 548, 549, 550, 551, 552, 553, 554, 555, 556, 527, 527]]
    );}

module hang_loose() {
  polygon(points=
    [[-5.059, -96.457], [-12.154, -95.479], [-17.838, -94.735], [-25.983, -91.532], [-34.127, -88.330], [-35.322, -83.425], [-37.398, -72.452], [-38.279, -66.384], [-45.718, -52.326], [-53.157, -38.269], [-59.972, -13.380], [-67.126, 12.496], [-80.782, 30.789], [-94.099, 48.169], [-96.191, 55.218], [-98.283, 62.190], [-96.996, 65.119], [-95.708, 68.047], [-92.434, 69.190], [-89.160, 70.332], [-87.068, 69.793], [-84.488, 68.745], [-75.180, 57.793], [-50.315, 30.493], [-48.720, 34.212], [-47.323, 37.724], [-43.689, 39.388], [-40.054, 41.053], [-34.822, 40.703], [-29.590, 40.353], [-28.029, 42.017], [-22.297, 48.261], [-10.001, 51.164], [-6.683, 49.986], [-3.696, 48.925], [-2.637, 50.325], [4.471, 57.047], [10.962, 58.091], [16.954, 58.718], [23.366, 52.187], [29.778, 45.657], [34.309, 38.274], [38.840, 30.891], [39.812, 26.656], [43.624, 15.941], [48.586, 21.669], [63.251, 39.025], [65.556, 41.706], [70.606, 44.089], [80.454, 48.770], [86.251, 51.542], [90.766, 51.301], [94.752, 50.439], [97.539, 46.044], [99.857, 41.796], [98.340, 40.247], [93.060, 35.969], [89.297, 33.240], [84.684, 26.577], [76.405, 12.889], [68.147, -5.989], [63.556, -17.842], [55.584, -28.425], [39.705, -47.292], [31.011, -57.593], [30.342, -64.973], [30.481, -74.212], [30.501, -78.088], [27.114, -81.506], [10.986, -94.803], [7.881, -95.724], [-5.059, -96.457], [-0.684, -92.830], [-2.501, -83.549], [-5.194, -67.051], [-6.155, -59.329], [-6.646, -67.436], [-5.469, -87.234], [-4.918, -92.667], [-2.801, -93.054], [-9.873, -91.008], [-11.119, -78.280], [-12.330, -66.639], [-17.781, -68.203], [-28.554, -70.798], [-33.974, -72.297], [-32.473, -79.771], [-30.984, -86.668], [-20.843, -89.405], [-10.215, -92.175], [7.243, -91.214], [11.817, -90.221], [15.514, -86.644], [19.293, -82.628], [18.782, -80.495], [17.667, -68.020], [16.407, -62.392], [11.856, -63.277], [7.887, -64.029], [5.385, -62.873], [8.008, -61.109], [14.694, -60.363], [16.948, -59.530], [14.835, -59.361], [6.936, -58.907], [-0.740, -58.466], [-3.052, -59.128], [-2.821, -67.539], [-0.283, -82.612], [2.415, -92.207], [22.185, -77.041], [22.519, -66.608], [21.818, -59.305], [21.082, -59.382], [19.988, -60.945], [19.071, -62.252], [19.067, -66.012], [20.266, -75.181], [21.589, -80.470], [22.185, -77.041], [-21.145, -63.228], [-13.017, -61.274], [-10.689, -60.599], [-10.538, -61.798], [-8.893, -59.624], [-7.273, -56.250], [-8.360, -52.798], [-11.369, -46.112], [-13.290, -42.878], [-12.392, -36.428], [-10.870, -28.756], [-8.585, -23.743], [-6.925, -19.951], [-8.395, -18.371], [-9.866, -16.791], [-12.542, -18.207], [-17.980, -20.108], [-21.225, -20.180], [-29.612, -13.015], [-40.065, -4.095], [-42.617, -1.927], [-47.056, -1.222], [-51.495, -0.517], [-54.664, -1.822], [-57.898, -3.164], [-58.243, -5.159], [-58.524, -7.118], [-51.846, -28.990], [-45.168, -50.862], [-41.838, -56.083], [-38.509, -61.304], [-34.343, -63.051], [18.648, -54.804], [25.862, -54.138], [34.328, -47.532], [42.072, -41.149], [51.081, -30.022], [60.089, -18.894], [62.945, -10.183], [68.967, 4.651], [72.134, 10.774], [70.825, 11.353], [69.227, 11.932], [69.447, 12.496], [71.043, 13.061], [72.128, 13.259], [71.241, 14.372], [70.354, 15.288], [71.030, 15.431], [75.648, 16.496], [81.548, 25.479], [87.365, 34.368], [92.040, 37.755], [96.716, 41.142], [96.596, 43.034], [95.366, 46.703], [94.256, 48.479], [90.883, 48.938], [87.509, 49.397], [77.588, 44.705], [67.668, 40.013], [63.131, 34.533], [58.594, 29.053], [59.111, 28.183], [60.675, 25.552], [63.686, 18.925], [64.212, 17.593], [62.662, 18.584], [57.245, 23.105], [55.410, 25.256], [53.449, 23.321], [43.624, 9.933], [45.469, 4.524], [49.951, -4.260], [52.496, -8.067], [49.495, -5.544], [46.588, -2.918], [44.517, 1.332], [41.752, 7.131], [41.056, 8.679], [39.730, 6.284], [38.262, 0.800], [38.121, -2.289], [36.428, 0.307], [34.452, 2.831], [29.475, 0.241], [24.780, -2.278], [23.734, -4.416], [20.950, -8.472], [19.212, -10.390], [14.254, -12.152], [-2.626, -22.018], [-6.120, -25.205], [-8.059, -30.808], [-9.998, -36.855], [-3.250, -50.156], [-0.543, -54.249], [4.678, -54.699], [-15.360, -15.505], [-13.394, -13.260], [-14.691, -11.318], [-17.075, -12.016], [-18.980, -14.525], [-19.593, -16.390], [-18.252, -16.564], [-22.123, -14.808], [-18.577, -8.846], [-16.529, -6.468], [-19.356, -3.308], [-22.466, -5.513], [-26.066, -6.718], [-29.896, -6.656], [-30.882, -5.981], [-29.400, -5.441], [-23.794, -2.952], [-19.670, -0.909], [-22.032, 6.288], [-27.646, 27.828], [-29.677, 36.787], [-33.594, 37.985], [-37.295, 38.986], [-40.765, 37.956], [-44.235, 36.926], [-45.986, 34.874], [-47.737, 32.822], [-48.175, 29.559], [-48.613, 26.296], [-44.108, 12.139], [-39.546, -2.058], [-31.057, -9.053], [-22.531, -16.008], [3.034, -14.145], [5.802, -12.564], [4.517, -11.060], [1.850, -9.260], [-1.790, -9.981], [-4.048, -10.998], [-4.765, -13.151], [-5.482, -15.515], [-2.608, -15.726], [0.267, -15.726], [-7.305, -9.429], [-1.572, -6.684], [1.053, -6.365], [3.887, -7.954], [6.844, -9.420], [0.650, 3.465], [-2.317, 2.011], [-7.855, 0.031], [-12.839, 0.397], [-12.995, 1.126], [-9.656, 2.180], [0.012, 6.106], [-1.494, 11.368], [-3.374, 23.221], [-3.752, 37.458], [-3.648, 44.780], [-7.093, 47.008], [-10.539, 49.236], [-15.470, 47.974], [-20.401, 46.712], [-23.525, 43.943], [-26.650, 40.876], [-23.803, 24.632], [-20.954, 8.686], [-14.739, -0.980], [-8.343, -10.628], [13.368, -6.107], [17.749, -4.451], [16.356, -2.287], [14.677, -0.260], [8.734, -1.312], [7.159, -1.735], [6.395, -1.902], [7.357, -4.150], [9.074, -7.541], [22.252, 9.886], [24.051, 33.733], [24.404, 43.810], [27.282, 39.621], [27.635, 35.921], [27.962, 32.957], [29.564, 35.610], [31.167, 38.262], [27.729, 43.371], [24.292, 48.479], [18.961, 52.501], [13.175, 56.512], [3.585, 54.075], [1.373, 51.141], [-0.662, 48.459], [0.051, 32.528], [0.876, 16.486], [5.443, 16.151], [12.580, 14.964], [6.936, 14.042], [1.613, 13.185], [4.424, 4.327], [5.637, 2.054], [8.364, 2.856], [10.746, 3.657], [13.696, 2.499], [16.647, 1.341], [18.494, -1.258], [20.488, -3.865], [-55.321, 0.202], [-48.098, 1.213], [-44.494, 1.612], [-47.261, 5.399], [-49.920, 9.110], [-48.190, 8.660], [-46.559, 8.308], [-50.310, 17.464], [-51.484, 19.644], [-50.760, 19.545], [-49.666, 19.764], [-50.078, 21.857], [-50.386, 23.457], [-53.358, 21.598], [-58.809, 17.010], [-61.723, 13.601], [-62.500, 10.380], [-62.842, 7.840], [-61.215, 3.677], [-59.303, -0.486], [29.846, 3.827], [34.311, 5.925], [28.032, 6.416], [26.832, 6.429], [26.366, 4.594], [25.965, 2.054], [29.846, 3.827], [36.259, 9.991], [39.551, 11.895], [38.143, 18.000], [35.334, 27.587], [33.559, 31.593], [30.725, 28.460], [28.127, 25.264], [27.538, 21.810], [27.031, 18.122], [29.649, 19.414], [32.184, 20.938], [32.824, 20.337], [32.179, 17.943], [29.098, 13.484], [27.208, 9.681], [29.513, 8.944], [32.370, 8.584], [-56.334, 23.692], [-53.318, 26.633], [-57.975, 32.892], [-65.963, 39.082], [-67.039, 36.701], [-70.745, 30.327], [-73.377, 26.514], [-72.238, 23.834], [-67.535, 18.613], [-64.132, 15.648], [-61.741, 18.290], [-72.844, 32.040], [-66.724, 42.443], [-68.315, 44.491], [-73.707, 47.588], [-74.623, 47.429], [-74.201, 48.625], [-73.779, 50.160], [-76.707, 55.057], [-84.116, 63.711], [-89.213, 67.668], [-92.491, 66.292], [-95.667, 61.320], [-94.035, 54.517], [-92.230, 49.548], [-88.587, 44.610], [-84.944, 39.671], [-82.396, 40.523], [-78.436, 42.449], [-76.930, 43.092], [-79.707, 40.153], [-82.192, 38.071], [-75.415, 28.589]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 0], [72, 73, 74, 75, 76, 77, 78, 79, 72], [80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 80], [90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 90], [110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 110], [120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 120], [152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173, 174, 175, 176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189, 190, 191, 192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205, 206, 207, 208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 152], [218, 219, 220, 221, 222, 223, 224, 218], [225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237, 238, 239, 240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 225], [251, 252, 253, 254, 255, 256, 257, 258, 259, 260, 251], [261, 262, 263, 264, 265, 266, 267, 268, 269, 270, 271, 272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285, 286, 261], [287, 288, 289, 290, 291, 292, 293, 294, 295, 287], [296, 297, 298, 299, 300, 301, 302, 303, 304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317, 318, 319, 320, 321, 322, 323, 324, 296], [325, 326, 327, 328, 329, 330, 331, 332, 333, 334, 335, 336, 337, 338, 339, 340, 341, 342, 343, 344, 325], [345, 346, 347, 348, 349, 350, 351, 345], [352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365, 366, 367, 368, 352], [369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 369], [380, 381, 382, 383, 384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397, 398, 399, 400, 401, 380]]
    );}

module money() {
  polygon(points=
    [[-54.142, -63.317], [-54.142, -33.436], [-39.938, -33.436], [-39.727, -35.435], [-39.517, -41.853], [-38.936, -45.731], [-37.564, -49.159], [-35.398, -52.136], [-32.441, -54.663], [-24.149, -58.365], [-12.687, -60.266], [-12.687, -2.923], [-21.735, 3.705], [-36.913, 15.595], [-45.198, 24.117], [-48.749, 32.403], [-49.933, 43.582], [-48.999, 53.400], [-46.198, 62.126], [-41.529, 69.761], [-34.992, 76.304], [-29.646, 79.783], [-23.603, 82.328], [-16.862, 83.939], [-9.425, 84.616], [-9.425, 101.556], [0.360, 101.556], [0.360, 84.616], [17.589, 82.380], [33.924, 77.567], [33.924, 48.317], [19.720, 48.317], [19.509, 50.316], [19.194, 57.576], [17.622, 64.717], [13.959, 70.044], [8.205, 73.556], [0.360, 75.252], [0.360, 21.171], [12.144, 13.175], [23.836, 3.765], [32.188, -6.369], [37.199, -17.226], [38.451, -22.926], [38.869, -28.806], [37.988, -38.407], [35.344, -46.903], [30.938, -54.295], [24.770, -60.581], [19.292, -64.277], [12.854, -67.263], [5.456, -69.538], [-2.902, -71.103], [-2.902, -87.937], [-12.687, -87.937], [-12.687, -71.103], [-34.677, -68.473], [-2.902, -59.634], [3.411, -57.451], [7.830, -53.637], [11.224, -46.561], [12.355, -37.118], [10.934, -26.965], [6.673, -18.179], [2.649, -13.524], [-2.902, -8.815], [-10.056, 27.274], [-10.056, 74.516], [-15.948, 71.668], [-20.157, 66.914], [-22.682, 60.252], [-23.524, 51.684], [-22.682, 44.753], [-20.157, 38.374], [-15.948, 32.548]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 0], [57, 58, 59, 60, 61, 62, 63, 64, 65, 57], [66, 67, 68, 69, 70, 71, 72, 73, 74, 66]]
    );}

module makerbot_replicator_2() {
  polygon(points=
    [[-81.295, 41.859], [-80.882, 42.857], [-76.064, 47.675], [-75.066, 48.088], [-31.115, 48.088], [42.455, 48.088], [43.453, 47.675], [48.271, 42.857], [48.684, 41.860], [48.684, -47.468], [48.271, -48.466], [43.453, -53.284], [42.455, -53.697], [-75.066, -53.697], [-76.064, -53.284], [-80.882, -48.466], [-81.295, -47.468], [-2.326, -18.073], [-24.840, -40.588], [-25.774, -41.212], [-26.875, -41.431], [-62.903, -41.431], [-64.004, -41.212], [-64.937, -40.588], [-68.344, -37.181], [-68.968, -36.248], [-69.187, -35.146], [-69.187, 30.571], [-68.968, 31.672], [-68.344, 32.606], [-64.937, 36.012], [-64.004, 36.636], [-62.903, 36.855], [30.292, 36.855], [31.393, 36.636], [32.326, 36.012], [35.733, 32.606], [36.357, 31.672], [36.576, 30.571], [36.576, -14.799], [36.350, -15.919], [35.733, -16.833], [34.818, -17.450], [33.698, -17.676], [-1.367, -17.676], [33.781, -35.058], [31.846, -35.860], [0.123, -35.860], [-0.942, -35.645], [-1.812, -35.058], [-2.399, -34.188], [-2.614, -33.123], [-2.614, -22.399], [-2.399, -21.334], [-1.812, -20.464], [-0.942, -19.877], [0.123, -19.662], [22.731, -19.662], [31.846, -19.662], [33.781, -20.464], [35.379, -22.062], [36.181, -23.997], [36.181, -31.525], [35.379, -33.460]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 0], [17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 17, 17], [45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 45]]
    );}

module makerbot_logo() {
  polygon(points=
    [[0.001, 17.388], [-1.745, 17.300], [-3.456, 17.044], [-5.132, 16.621], [-6.764, 16.021], [-9.709, 14.425], [-12.293, 12.300], [-14.419, 9.716], [-16.015, 6.770], [-16.615, 5.138], [-17.038, 3.463], [-17.294, 1.752], [-17.382, 0.005], [-17.294, -1.741], [-17.038, -3.461], [-16.615, -5.136], [-16.015, -6.768], [-14.419, -9.713], [-12.293, -12.298], [-9.709, -14.432], [-6.764, -16.019], [-5.132, -16.619], [-3.456, -17.042], [-1.745, -17.298], [0.001, -17.386], [1.747, -17.298], [3.458, -17.042], [5.134, -16.619], [6.765, -16.019], [9.711, -14.432], [12.295, -12.298], [14.421, -9.713], [16.017, -6.768], [16.608, -5.136], [17.040, -3.461], [17.296, -1.741], [17.384, 0.005], [17.296, 1.752], [17.040, 3.463], [16.608, 5.138], [16.017, 6.770], [14.421, 9.716], [12.295, 12.300], [9.711, 14.425], [6.765, 16.021], [5.134, 16.621], [3.458, 17.044], [1.747, 17.300], [0.001, 14.972], [3.017, 14.672], [5.830, 13.799], [8.370, 12.414], [10.584, 10.589], [12.410, 8.375], [13.794, 5.835], [14.668, 3.022], [14.967, 0.005], [14.668, -3.020], [13.794, -5.824], [12.410, -8.373], [10.584, -10.587], [8.370, -12.412], [5.830, -13.797], [3.017, -14.670], [0.001, -14.970], [-3.015, -14.670], [-5.829, -13.797], [-8.369, -12.412], [-10.582, -10.587], [-12.408, -8.373], [-13.793, -5.824], [-14.666, -3.020], [-14.966, 0.005], [-14.666, 3.022], [-13.793, 5.835], [-12.408, 8.375], [-10.582, 10.589], [-8.369, 12.414], [-5.829, 13.799], [-3.015, 14.672], [-4.700, 11.418], [-5.661, 11.330], [-6.543, 11.065], [-7.354, 10.624], [-8.078, 10.007], [-8.686, 9.266], [-9.110, 8.463], [-9.374, 7.581], [-9.453, 6.629], [-9.453, -8.126], [-9.312, -9.008], [-8.880, -9.696], [-8.210, -10.146], [-7.363, -10.296], [-6.481, -10.146], [-5.793, -9.696], [-5.344, -9.008], [-5.203, -8.126], [-5.203, 7.132], [-2.098, 7.132], [-2.098, -8.126], [-1.957, -9.008], [-1.534, -9.696], [-0.872, -10.146], [0.001, -10.296], [0.865, -10.146], [1.535, -9.696], [1.959, -9.008], [2.100, -8.126], [2.100, 7.132], [5.196, 7.132], [5.196, -8.126], [5.345, -9.008], [5.795, -9.696], [6.483, -10.146], [7.356, -10.296], [8.212, -10.137], [8.882, -9.678], [9.314, -8.990], [9.455, -8.126], [9.455, 6.629], [9.367, 7.581], [9.111, 8.463], [8.679, 9.266], [8.079, 10.007], [7.347, 10.624], [6.545, 11.065], [5.663, 11.330], [4.702, 11.418]]
    , paths=
    [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 0, 0], [48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 48, 48], [80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 80, 80]]
    );}
