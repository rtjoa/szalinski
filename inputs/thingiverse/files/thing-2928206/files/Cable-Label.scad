// ___________________________________________________________________________________________________________//
// Cabel Label.                                                                                               //
// A small customisable tag made for the ends of chargers or network cables to allow for permanent labelling. //
// Can be glued for extra security.                                                                           //
// ___________________________________________________________________________________________________________//

/* [Text] */
hatchTextIn = "McK ICT"; // Hatch text
bottomTextIn = "1"; // Bottom text

font = "Ubuntu"; //[Advent Pro,Alegreya Sans,Amaranth,Arimo,Arvo,Asap,Asul,Bangers,Basic,Bowlby One SC,Bubblegum Sans,Cabin Condensed,Carter One,Electrolize,Encode Sans Compressed,Exo 2,Federo,Fjord One,Geo,Graduate,Helvetica,Happy Monkey,Hind,Karma,Lemon One,Lilita One,Mako,McLaren,Merienda One,Nova Square,Nunito,Oswald,Oxygen,Permanent Marker,Racing Sans One,Roboto,Share,Source Sans Pro,Teko,Terminal Dosis,Ubuntu,Voces,Wallpoet]

/* [Text Size] */
hatchTextSize = 2; //[0.1:0.01:30.0]
bottomTextSize = 8; //[0.1:0.01:30.0]
hatchTextSpacing = 1; //[0.01:0.01:10.0]

/* [Text Positioning] */
hatchTextNudgeX = -14.7; //[-20.0:0.01:20.0]
hatchTextNudgeY = -0.1; //[-20.0:0.01:20.0]
bottomTextNudgeX = -2.5; //[-20.0:0.01:20.0]
bottomTextNudgeY = -0.3; //[-20.0:0.01:20.0]
textIndent = -0.8; //[-2.0:0.01:1.0]

bottomTextRotate = 0; //[0,90,180]

/* [Scale] */
length = 1; //[0.01:0.001:2.0]
width = 1; //[0.01:0.001:2.0]

/* [Hidden] */
bottomText = str(bottomTextIn); // Bottom text string
hatchText = str(hatchTextIn); // Hatch text string

cablelabelPoints = [
	[0.0999994, -9.956, 0],
	[0.0999994, 10, 0],
	[0.0999994, 10, 7.917],
	[0.0999994, -9.956, 7.917],
	[11.644, 5.08355, 0.301999],
	[11.644, 7.63445, 0.301999],
	[11.644, 7.63445, 2.402],
	[11.644, 5.08355, 2.402],
	[11.644, -7.56945, 0.301999],
	[11.644, -5.01855, 0.301999],
	[11.644, -5.01855, 2.402],
	[11.644, -7.56945, 2.402],
	[20, 7.63211, 0.301999],
	[20, 5.07989, 0.301999],
	[20, 5.07989, 2.402],
	[20, 7.63211, 2.402],
	[20, -5.02089, 0.301999],
	[20, -7.57311, 0.301999],
	[20, -7.57311, 2.402],
	[20, -5.02089, 2.402],
	[19.721, -10, 3.242],
	[18.7243, -10, 3.242],
	[19.721, 10, 3.242],
	[1.119, -4.81433, 7.621],
	[1.119, -7.71066, 7.621],
	[1.119, -9.956, 7.917],
	[1.119, 4.91734, 7.621],
	[1.119, 10, 7.917],
	[1.119, 7.81366, 7.621],
	[8.695, -9.956, 2.962],
	[10.1, -9.956, 0],
	[8.532, -9.956, 2.654],
	[8.336, -9.956, 2.362],
	[1.116, 4.92017, 7.621],
	[1.116, 4.92017, 7.004],
	[1.119, 4.91734, 7.004],
	[1.119, 4.88879, 7.004],
	[1.116, 4.89163, 5.538],
	[1.119, 4.88879, 5.499],
	[19.724, 7.89285, 2.402],
	[19.724, 4.81915, 2.402],
	[19.724, -7.83385, 2.402],
	[19.724, -4.76015, 2.402],
	[19.724, 7.89285, 0.301999],
	[19.724, 4.81915, 0.301999],
	[19.724, -7.83385, 0.301999],
	[19.724, -4.76015, 0.301999],
	[1.116, 4.89163, 7.004],
	[5.1, -9.956, 0.822],
	[5.481, -9.956, 0.839],
	[11.92, 4.82294, 2.402],
	[11.92, 7.89506, 2.402],
	[11.92, 10, 3.242],
	[11.92, -4.75794, 2.402],
	[11.92, -10, 3.242],
	[11.92, -7.83006, 2.402],
	[12.9167, -10, 3.242],
	[13.652, -10, 2.202],
	[13.652, 10, 2.202],
	[13.98, 10, 1.884],
	[1.116, 4.82042, 7.641],
	[1.116, 4.82042, 5.538],
	[13.344, -10, 2.571],
	[13.06, 10, 2.986],
	[13.344, 10, 2.571],
	[1.119, -7.73921, 7.004],
	[1.116, -7.73637, 5.538],
	[1.119, -7.73921, 5.499],
	[1.116, -7.73637, 7.004],
	[1.119, -7.71066, 7.004],
	[1.116, -7.70783, 7.004],
	[12.9167, 10, 3.242],
	[1.116, -7.83558, 7.641],
	[1.116, -7.83558, 5.538],
	[18.7243, 10, 3.242],
	[1.119, -4.81433, 6.728],
	[1.116, -4.81717, 6.728],
	[1.119, -4.85326, 6.728],
	[1.116, -4.8561, 6.728],
	[1.116, 7.81083, 6.728],
	[1.119, 7.81366, 6.728],
	[1.119, 7.77474, 6.728],
	[1.116, 7.7719, 6.728],
	[0.94, -7.57012, 5.499],
	[0.94, -7.57012, 5.538],
	[0.834, -7.57458, 5.538],
	[1.119, -9.956, 4.697],
	[1.116, -4.8561, 5.538],
	[1.119, -4.85326, 5.499],
	[0.94, -5.02252, 5.499],
	[0.94, -5.02252, 5.538],
	[1.116, -4.76142, 5.538],
	[0.94, 5.05788, 5.499],
	[0.94, 5.05788, 5.538],
	[0.834, 5.08142, 5.538],
	[18.581, 10, 2.986],
	[1.116, 7.7719, 5.538],
	[1.119, 7.77474, 5.499],
	[0.94, 7.60548, 5.499],
	[0.94, 7.60548, 5.538],
	[1.116, 7.89458, 5.538],
	[17.314, -10, 1.619],
	[17.314, 10, 1.619],
	[17.66, 10, 1.884],
	[16.954, 10, 1.411],
	[0.834, 7.63358, 5.538],
	[11.92, -10, 0],
	[11.92, -4.75794, 0.301999],
	[11.92, -7.83006, 0.301999],
	[11.92, 10, 0],
	[11.92, 4.82294, 0.301999],
	[11.92, 7.89506, 0.301999],
	[15.438, -10, 1.17],
	[15.059, -10, 1.261],
	[19.721, 10, 0],
	[13.98, -10, 1.884],
	[13.06, -10, 2.986],
	[14.687, -10, 1.411],
	[14.327, -10, 1.619],
	[1.119, 10, 4.697],
	[1.209, 10, 4.697],
	[1.209, -9.956, 4.697],
	[18.581, -10, 2.986],
	[19.721, -10, 0],
	[18.297, -10, 2.571],
	[17.989, -10, 2.202],
	[17.66, -10, 1.884],
	[18.297, 10, 2.571],
	[10.1, 10, 0],
	[10.1, -9.956, 7.917],
	[10.1, 10, 7.917],
	[16.954, -10, 1.411],
	[9.085, -7.83165, 5.538],
	[9.085, -7.7466, 5.499],
	[9.085, -7.7466, 5.538],
	[9.275, -5.02018, 5.499],
	[9.085, -4.84061, 5.499],
	[9.085, -4.84061, 5.538],
	[16.582, -10, 1.261],
	[0.834, -5.02242, 5.538],
	[16.203, -10, 1.17],
	[15.82, -10, 1.14],
	[9.085, -4.75935, 5.538],
	[17.989, 10, 2.202],
	[8.991, -9.956, 4.288],
	[9.085, -9.956, 4.697],
	[8.991, -9.956, 4.697],
	[8.973, -9.956, 3.948],
	[9.085, -9.956, 7.917],
	[9.085, 10, 7.917],
	[9.085, 4.82435, 5.538],
	[9.085, 4.8814, 5.499],
	[9.085, 4.8814, 5.538],
	[0.834, -7.57458, 7.641],
	[9.275, 7.60782, 5.499],
	[9.085, 7.78739, 5.499],
	[9.085, 7.78739, 5.538],
	[3.266, -9.956, 1.231],
	[2.938, -9.956, 1.406],
	[3.611, -9.956, 1.086],
	[3.97, -9.956, 0.971],
	[2.631, -9.956, 1.609],
	[2.348, -9.956, 1.837],
	[2.092, -9.956, 2.089],
	[1.864, -9.956, 2.362],
	[1.668, -9.956, 2.654],
	[8.108, 10, 2.089],
	[8.108, -9.956, 2.089],
	[1.505, -9.956, 2.962],
	[1.376, -9.956, 3.282],
	[1.283, -9.956, 3.612],
	[1.227, -9.956, 3.948],
	[9.085, 7.89665, 5.538],
	[9.366, 7.63658, 5.538],
	[1.209, -9.956, 4.288],
	[9.085, 10, 4.697],
	[7.852, -9.956, 1.837],
	[7.569, -9.956, 1.609],
	[7.262, -9.956, 1.406],
	[6.934, -9.956, 1.231],
	[6.589, -9.956, 1.086],
	[6.23, -9.956, 0.971],
	[5.859, -9.956, 0.889],
	[3.97, 10, 0.971],
	[3.611, 10, 1.086],
	[4.719, -9.956, 0.839],
	[4.341, -9.956, 0.889],
	[3.266, 10, 1.231],
	[2.938, 10, 1.406],
	[8.917, -9.956, 3.612],
	[2.631, 10, 1.609],
	[8.824, -9.956, 3.282],
	[2.348, 10, 1.837],
	[0.834, 5.08142, 7.641],
	[8.991, 10, 4.697],
	[9.275, -7.56712, 5.538],
	[9.275, -7.56712, 5.499],
	[9.366, -7.57158, 5.538],
	[9.085, -7.83165, 7.641],
	[0.834, -5.02242, 7.641],
	[9.275, -5.02018, 5.538],
	[0.834, 7.63358, 7.641],
	[2.092, 10, 2.089],
	[1.864, 10, 2.362],
	[1.668, 10, 2.654],
	[1.505, 10, 2.962],
	[1.376, 10, 3.282],
	[9.275, 5.06088, 5.538],
	[9.275, 5.06088, 5.499],
	[1.283, 10, 3.612],
	[7.852, 10, 1.837],
	[9.366, 5.08442, 5.538],
	[9.275, 7.60782, 5.538],
	[7.569, 10, 1.609],
	[7.262, 10, 1.406],
	[6.934, 10, 1.231],
	[6.589, 10, 1.086],
	[6.23, 10, 0.971],
	[9.366, -7.57158, 7.641],
	[5.859, 10, 0.889],
	[5.481, 10, 0.839],
	[8.991, 10, 4.288],
	[8.973, 10, 3.948],
	[4.341, 10, 0.889],
	[4.719, 10, 0.839],
	[8.917, 10, 3.612],
	[8.824, 10, 3.282],
	[9.085, -4.75935, 7.641],
	[8.695, 10, 2.962],
	[8.532, 10, 2.654],
	[8.336, 10, 2.362],
	[15.059, 10, 1.261],
	[14.687, 10, 1.411],
	[14.327, 10, 1.619],
	[5.1, 10, 0.822],
	[9.366, -5.01942, 5.538],
	[9.366, 5.08442, 7.641],
	[9.366, 7.63658, 7.641],
	[9.085, 7.89665, 7.641],
	[9.366, -5.01942, 7.641],
	[9.085, 4.82435, 7.641],
	[1.209, 10, 4.288],
	[1.227, 10, 3.948],
	[1.116, -7.70783, 7.621],
	[1.116, -4.81717, 7.621],
	[1.116, -4.76142, 7.641],
	[1.116, 7.81083, 7.621],
	[16.582, 10, 1.261],
	[1.116, 7.89458, 7.641],
	[15.438, 10, 1.17],
	[15.82, 10, 1.14],
	[16.203, 10, 1.17],
];

cablelabelFaces = [
	[0, 2, 3],
	[1, 2, 0],
	[129, 30, 145],
	[0, 157, 159],
	[0, 163, 162],
	[145, 30, 144],
	[0, 185, 48],
	[144, 30, 147],
	[0, 161, 158],
	[147, 30, 189],
	[189, 30, 191],
	[191, 30, 29],
	[29, 30, 31],
	[31, 30, 32],
	[32, 30, 167],
	[167, 30, 176],
	[176, 30, 177],
	[177, 30, 178],
	[178, 30, 179],
	[179, 30, 180],
	[0, 186, 185],
	[180, 30, 181],
	[181, 30, 182],
	[182, 30, 0],
	[49, 182, 0],
	[0, 160, 186],
	[0, 159, 160],
	[0, 158, 157],
	[0, 48, 49],
	[145, 144, 146],
	[163, 0, 164],
	[164, 0, 165],
	[165, 0, 168],
	[168, 0, 169],
	[169, 0, 170],
	[170, 0, 171],
	[171, 0, 174],
	[174, 0, 121],
	[121, 0, 86],
	[86, 0, 25],
	[25, 0, 3],
	[0, 162, 161],
	[129, 145, 148],
	[0, 128, 1],
	[30, 128, 0],
	[1, 27, 2],
	[119, 27, 1],
	[120, 119, 1],
	[241, 120, 1],
	[242, 241, 1],
	[1, 209, 242],
	[1, 206, 209],
	[1, 205, 206],
	[1, 204, 205],
	[1, 203, 204],
	[1, 202, 203],
	[1, 192, 202],
	[1, 190, 192],
	[1, 188, 190],
	[1, 187, 188],
	[1, 184, 187],
	[1, 183, 184],
	[1, 223, 183],
	[1, 224, 223],
	[1, 234, 224],
	[1, 220, 234],
	[1, 219, 220],
	[1, 128, 219],
	[219, 128, 217],
	[217, 128, 216],
	[216, 128, 215],
	[215, 128, 214],
	[214, 128, 213],
	[213, 128, 210],
	[210, 128, 166],
	[166, 128, 230],
	[230, 128, 229],
	[229, 128, 228],
	[228, 128, 226],
	[225, 130, 222],
	[175, 194, 221],
	[222, 175, 221],
	[130, 149, 175],
	[222, 130, 175],
	[128, 130, 225],
	[226, 128, 225],
	[27, 25, 3],
	[27, 3, 2],
	[27, 119, 80],
	[67, 86, 25],
	[27, 26, 23],
	[65, 67, 25],
	[26, 75, 23],
	[27, 24, 25],
	[24, 65, 25],
	[27, 23, 24],
	[88, 75, 36],
	[88, 119, 86],
	[38, 119, 88],
	[36, 38, 88],
	[27, 80, 28],
	[80, 119, 97],
	[80, 97, 81],
	[97, 119, 38],
	[27, 28, 26],
	[86, 67, 88],
	[65, 24, 69],
	[75, 88, 77],
	[75, 26, 36],
	[36, 26, 35],
	[120, 121, 86],
	[120, 86, 119],
	[120, 241, 174],
	[120, 174, 121],
	[242, 171, 174],
	[242, 174, 241],
	[209, 170, 171],
	[209, 171, 242],
	[206, 169, 170],
	[206, 170, 209],
	[205, 168, 169],
	[205, 169, 206],
	[204, 165, 168],
	[204, 168, 205],
	[203, 164, 165],
	[203, 165, 204],
	[202, 163, 164],
	[202, 164, 203],
	[192, 162, 163],
	[192, 163, 202],
	[190, 161, 162],
	[190, 162, 192],
	[188, 158, 161],
	[188, 161, 190],
	[187, 157, 158],
	[187, 158, 188],
	[184, 159, 157],
	[184, 157, 187],
	[183, 160, 159],
	[183, 159, 184],
	[223, 186, 160],
	[223, 160, 183],
	[224, 185, 186],
	[224, 186, 223],
	[234, 48, 185],
	[234, 185, 224],
	[220, 49, 48],
	[220, 48, 234],
	[219, 182, 49],
	[219, 49, 220],
	[217, 181, 182],
	[217, 182, 219],
	[216, 180, 181],
	[216, 181, 217],
	[215, 179, 180],
	[215, 180, 216],
	[214, 178, 179],
	[214, 179, 215],
	[213, 177, 178],
	[213, 178, 214],
	[210, 176, 177],
	[210, 177, 213],
	[166, 167, 176],
	[166, 176, 210],
	[167, 230, 32],
	[166, 230, 167],
	[32, 229, 31],
	[230, 229, 32],
	[31, 228, 29],
	[229, 228, 31],
	[29, 226, 191],
	[228, 226, 29],
	[191, 225, 189],
	[226, 225, 191],
	[189, 222, 147],
	[225, 222, 189],
	[147, 221, 144],
	[222, 221, 147],
	[144, 194, 146],
	[221, 194, 144],
	[175, 145, 146],
	[175, 146, 194],
	[175, 149, 172],
	[145, 132, 148],
	[145, 134, 132],
	[145, 133, 134],
	[136, 142, 137],
	[175, 136, 145],
	[142, 240, 227],
	[227, 149, 148],
	[198, 227, 148],
	[132, 198, 148],
	[152, 150, 151],
	[151, 175, 155],
	[151, 150, 136],
	[175, 151, 136],
	[156, 155, 172],
	[172, 149, 238],
	[175, 172, 155],
	[238, 149, 240],
	[240, 142, 150],
	[240, 149, 227],
	[142, 136, 150],
	[133, 145, 136],
	[130, 129, 148],
	[130, 148, 149],
	[130, 128, 30],
	[130, 30, 129],
	[66, 65, 68],
	[67, 65, 66],
	[67, 66, 83],
	[88, 67, 83],
	[88, 83, 89],
	[87, 88, 89],
	[77, 88, 87],
	[77, 87, 78],
	[75, 77, 78],
	[75, 78, 76],
	[23, 75, 76],
	[23, 76, 244],
	[243, 23, 244],
	[24, 23, 243],
	[70, 24, 243],
	[69, 24, 70],
	[68, 69, 70],
	[65, 69, 68],
	[97, 38, 92],
	[97, 92, 98],
	[37, 36, 47],
	[38, 36, 37],
	[38, 37, 92],
	[81, 97, 96],
	[81, 96, 82],
	[96, 97, 98],
	[80, 81, 82],
	[80, 82, 79],
	[28, 80, 79],
	[28, 79, 246],
	[33, 28, 246],
	[26, 28, 33],
	[34, 26, 33],
	[35, 26, 34],
	[47, 35, 34],
	[36, 35, 47],
	[132, 218, 198],
	[197, 218, 132],
	[235, 197, 195],
	[132, 134, 195],
	[235, 137, 142],
	[235, 200, 137],
	[195, 197, 132],
	[235, 195, 200],
	[198, 239, 227],
	[218, 239, 198],
	[239, 235, 142],
	[239, 142, 227],
	[200, 135, 136],
	[200, 136, 137],
	[135, 196, 133],
	[135, 133, 136],
	[133, 195, 134],
	[196, 195, 133],
	[150, 236, 240],
	[211, 236, 150],
	[173, 211, 207],
	[150, 152, 207],
	[173, 156, 172],
	[173, 212, 156],
	[207, 211, 150],
	[173, 207, 212],
	[240, 237, 238],
	[236, 237, 240],
	[237, 173, 172],
	[237, 172, 238],
	[212, 154, 155],
	[212, 155, 156],
	[154, 208, 151],
	[154, 151, 155],
	[151, 207, 152],
	[208, 207, 151],
	[66, 73, 85],
	[84, 85, 90],
	[66, 85, 84],
	[90, 85, 139],
	[87, 90, 91],
	[91, 90, 139],
	[66, 84, 83],
	[68, 73, 66],
	[91, 245, 87],
	[87, 245, 76],
	[87, 76, 78],
	[244, 245, 72],
	[243, 244, 72],
	[73, 243, 72],
	[68, 70, 243],
	[73, 68, 243],
	[76, 245, 244],
	[90, 89, 83],
	[90, 83, 84],
	[90, 87, 89],
	[99, 98, 92],
	[99, 92, 93],
	[37, 93, 92],
	[99, 96, 98],
	[37, 61, 94],
	[93, 94, 99],
	[37, 94, 93],
	[99, 94, 105],
	[96, 99, 100],
	[100, 99, 105],
	[47, 61, 37],
	[100, 248, 96],
	[96, 248, 79],
	[96, 79, 82],
	[246, 248, 60],
	[33, 246, 60],
	[61, 33, 60],
	[47, 34, 33],
	[61, 47, 33],
	[79, 248, 246],
	[197, 239, 218],
	[235, 239, 197],
	[196, 200, 195],
	[135, 200, 196],
	[211, 237, 236],
	[173, 237, 211],
	[208, 212, 207],
	[154, 212, 208],
	[199, 139, 85],
	[199, 85, 153],
	[85, 72, 153],
	[73, 72, 85],
	[245, 91, 139],
	[245, 139, 199],
	[153, 245, 199],
	[72, 245, 153],
	[201, 105, 94],
	[201, 94, 193],
	[94, 60, 193],
	[61, 60, 94],
	[248, 100, 105],
	[248, 105, 201],
	[193, 248, 201],
	[60, 248, 193],
	[50, 110, 4],
	[50, 4, 7],
	[4, 111, 5],
	[110, 111, 4],
	[4, 6, 7],
	[5, 6, 4],
	[51, 50, 7],
	[51, 7, 6],
	[109, 52, 111],
	[55, 106, 108],
	[109, 110, 106],
	[50, 52, 53],
	[109, 111, 110],
	[51, 52, 50],
	[111, 52, 51],
	[107, 50, 53],
	[110, 107, 106],
	[53, 52, 54],
	[55, 53, 54],
	[106, 55, 54],
	[108, 106, 107],
	[50, 107, 110],
	[5, 51, 6],
	[111, 51, 5],
	[20, 123, 124],
	[106, 141, 140],
	[20, 122, 21],
	[124, 123, 125],
	[125, 123, 126],
	[126, 123, 101],
	[106, 113, 112],
	[101, 123, 131],
	[131, 123, 138],
	[138, 123, 106],
	[140, 138, 106],
	[117, 106, 118],
	[118, 106, 115],
	[115, 106, 57],
	[57, 106, 62],
	[62, 106, 116],
	[116, 106, 56],
	[56, 106, 54],
	[20, 124, 122],
	[106, 112, 141],
	[106, 117, 113],
	[106, 114, 109],
	[123, 114, 106],
	[109, 71, 52],
	[63, 71, 109],
	[64, 63, 109],
	[109, 58, 64],
	[109, 59, 58],
	[109, 233, 59],
	[109, 232, 233],
	[109, 231, 232],
	[109, 249, 231],
	[109, 250, 249],
	[109, 251, 250],
	[109, 247, 251],
	[109, 114, 247],
	[247, 114, 104],
	[102, 22, 103],
	[103, 22, 143],
	[143, 22, 127],
	[22, 74, 95],
	[127, 22, 95],
	[114, 22, 102],
	[104, 114, 102],
	[71, 56, 54],
	[71, 54, 52],
	[55, 108, 8],
	[55, 8, 11],
	[8, 107, 9],
	[108, 107, 8],
	[53, 55, 11],
	[53, 11, 10],
	[9, 53, 10],
	[107, 53, 9],
	[63, 116, 56],
	[63, 56, 71],
	[64, 62, 116],
	[64, 116, 63],
	[58, 57, 62],
	[58, 62, 64],
	[59, 115, 57],
	[59, 57, 58],
	[233, 118, 115],
	[233, 115, 59],
	[232, 117, 118],
	[232, 118, 233],
	[231, 113, 117],
	[231, 117, 232],
	[249, 112, 113],
	[249, 113, 231],
	[250, 141, 112],
	[250, 112, 249],
	[251, 140, 141],
	[251, 141, 250],
	[247, 138, 140],
	[247, 140, 251],
	[104, 131, 138],
	[104, 138, 247],
	[102, 101, 131],
	[102, 131, 104],
	[103, 126, 101],
	[103, 101, 102],
	[143, 125, 126],
	[143, 126, 103],
	[125, 127, 124],
	[143, 127, 125],
	[124, 95, 122],
	[127, 95, 124],
	[122, 74, 21],
	[95, 74, 122],
	[22, 20, 21],
	[22, 21, 74],
	[22, 114, 123],
	[22, 123, 20],
	[8, 10, 11],
	[9, 10, 8],
	[43, 15, 39],
	[12, 15, 43],
	[44, 12, 43],
	[13, 12, 44],
	[15, 12, 13],
	[15, 13, 14],
	[44, 39, 40],
	[43, 39, 44],
	[15, 14, 40],
	[15, 40, 39],
	[14, 13, 44],
	[14, 44, 40],
	[46, 19, 42],
	[16, 19, 46],
	[45, 16, 46],
	[17, 16, 45],
	[19, 16, 17],
	[19, 17, 18],
	[45, 42, 41],
	[46, 42, 45],
	[19, 18, 41],
	[19, 41, 42],
	[18, 17, 45],
	[18, 45, 41],
];

module cablelabel() {
 	polyhedron(points = cablelabelPoints, faces = cablelabelFaces);
}

difference() {
    scale([width, length, width])
    cablelabel();
    rotate([0, 180, 0])
    translate([hatchTextNudgeX,hatchTextNudgeY,textIndent])
    linear_extrude(height=3)
    text(hatchText, size=hatchTextSize, font = font, halign = "center", valign = "center", spacing = hatchTextSpacing, direction = "ttb");
    rotate([0, 180, bottomTextRotate])
    translate([bottomTextNudgeX,bottomTextNudgeY,textIndent])
    linear_extrude(height=3)
    text(bottomText, size=bottomTextSize, font = font, halign = "center", valign = "center", direction = "ttb");
}

// preview[view:north, tilt:bottom]