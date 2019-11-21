// preview[view:south east, tilt:top diagonal]



/* [Config] */

// New hole diameter.
holeDiameter = 1.0; // [1:0.01:10]



/* [Hidden] */

// Original hole dimensions, position.
350ClipHoleWidth = 1;
350ClipHoleDepth = 1.05;
350ClipHoleX = 23.5845 + 350ClipHoleWidth/2;
350ClipHoleZ = 5;

// This number of fragments should match number of fragments used in 350Clip.
$fn = 24;



/* Modules */

// The 350Clip zeroed to [0, 0, 0]. This clip does not necessarily magnify 350x.
module clip() {
    // zero the original 350Clip
    translate([0, -1.9, 0])
        350Clip();
}

// This drills bigger hole to the clip. The cylinder center is aligned with the hole.
module hole() {
    // center new hole
    translate([350ClipHoleX, 0, 350ClipHoleZ])
        // align cylinder sides with hole sides
        rotate([-90, 360/$fn/2, 0])
            cylinder(h=350ClipHoleDepth, d=holeDiameter, $fn=$fn);
}



/* Runtime */

difference() {
	clip();
    hole();
}










/* External dependencies */

// This is original PNNL 350x clip downloaded from https://availabletechnologies.pnnl.gov/technology.asp?id=393.
// It was converted from STL to OFF and then to polyhedron() function call.

// converted from 350Clip.off with off2polyhedron.sh

350ClipPoints = [
	[13.5553, 15.5202, 0],
	[14.4385, 15.1531, 0],
	[13.5553, 15.5202, 10],
	[14.4385, 15.1531, 10],
	[28.4185, 10.238, 0],
	[28.4185, 10.238, 10],
	[27.7291, 9.69549, 0],
	[27.7291, 9.69549, 10],
	[25.1381, 8.78909, 0],
	[25.1381, 8.78909, 10],
	[24.4945, 8.81721, 0],
	[24.4945, 8.81721, 10],
	[10.9744, 15.9441, 0],
	[11.8386, 15.9064, 0],
	[10.9744, 15.9441, 10],
	[11.8386, 15.9064, 10],
	[2.83636, 2.94568, 0],
	[2.83636, 2.94568, 10],
	[2.83636, 10.0912, 0],
	[2.83636, 10.0912, 10],
	[9.17896, 15.7158, 0],
	[10.092, 15.8814, 0],
	[9.17896, 15.7158, 10],
	[10.092, 15.8814, 10],
	[0, 10.0912, 10],
	[0, 1.9, 10],
	[33.4544, 1.9, 10],
	[0.570274, 10.5813, 10],
	[2.18979, 11.902, 10],
	[33.4544, 2.94568, 10],
	[3.63184, 12.9728, 10],
	[4.49487, 11.1899, 10],
	[4.93128, 13.834, 10],
	[5.92341, 12.0525, 10],
	[6.11531, 14.517, 10],
	[7.16066, 12.7113, 10],
	[7.20597, 15.0462, 10],
	[8.25718, 13.2054, 10],
	[8.2218, 15.4409, 10],
	[9.26933, 13.5682, 10],
	[9.59615, 13.6633, 10],
	[10.4905, 13.8611, 10],
	[11.3376, 13.9555, 10],
	[12.1553, 13.9514, 10],
	[12.6903, 15.7679, 10],
	[12.9601, 13.8483, 10],
	[13.7677, 13.6402, 10],
	[14.5977, 13.3134, 10],
	[15.2685, 14.7022, 10],
	[15.4453, 12.8609, 10],
	[16.1576, 14.1154, 10],
	[16.3164, 12.287, 10],
	[17.4753, 13.1091, 10],
	[17.2318, 11.5998, 10],
	[19.6365, 9.64675, 10],
	[19.5638, 11.4044, 10],
	[20.7885, 10.4768, 10],
	[20.7761, 8.79049, 10],
	[21.5628, 8.28176, 10],
	[21.6645, 9.89807, 10],
	[22.2488, 7.919, 10],
	[22.4605, 9.45734, 10],
	[22.9185, 7.65884, 10],
	[23.1394, 9.15905, 10],
	[23.5373, 7.51355, 10],
	[23.8321, 8.93904, 10],
	[24.2169, 7.44071, 10],
	[25.1265, 7.43294, 10],
	[25.4914, 7.45155, 10],
	[25.7737, 8.85492, 10],
	[26.4134, 7.55789, 10],
	[26.4159, 9.0215, 10],
	[27.2279, 7.73477, 10],
	[27.0636, 9.29644, 10],
	[27.9215, 7.96715, 10],
	[28.5303, 8.26265, 10],
	[29.137, 10.9474, 10],
	[28.9491, 8.54528, 10],
	[29.2615, 8.8284, 10],
	[29.8712, 11.8277, 10],
	[29.4969, 9.11571, 10],
	[29.673, 9.41528, 10],
	[29.7988, 9.7399, 10],
	[29.8712, 10.0912, 10],
	[24.0154, 2.94568, 5.49522],
	[24.0154, 1.9, 5.49522],
	[24.146, 2.94568, 5.4962],
	[24.146, 1.9, 5.4962],
	[8.25718, 13.2054, 0],
	[7.16066, 12.7113, 0],
	[29.2615, 8.8284, 0],
	[28.9491, 8.54528, 0],
	[24.2792, 1.9, 4.5395],
	[24.2792, 2.94568, 4.5395],
	[24.3917, 1.9, 4.60561],
	[24.3917, 2.94568, 4.60561],
	[29.7988, 9.7399, 0],
	[29.8712, 10.0912, 0],
	[7.20597, 15.0462, 0],
	[8.2218, 15.4409, 0],
	[16.3164, 12.287, 0],
	[15.4453, 12.8609, 0],
	[26.4134, 7.55789, 0],
	[27.2279, 7.73477, 0],
	[24.5478, 1.9, 4.81211],
	[24.4833, 1.9, 4.69859],
	[24.5478, 2.94568, 4.81211],
	[24.4833, 2.94568, 4.69859],
	[29.137, 10.9474, 0],
	[29.8712, 11.8277, 0],
	[22.4605, 9.45734, 0],
	[23.1394, 9.15905, 0],
	[23.783, 2.94568, 4.60106],
	[23.8965, 2.94568, 4.53664],
	[23.783, 1.9, 4.60106],
	[23.8965, 1.9, 4.53664],
	[33.4544, 1.9, 0],
	[33.4544, 2.94568, 0],
	[9.26933, 13.5682, 0],
	[2.18979, 11.902, 0],
	[3.63184, 12.9728, 0],
	[4.49487, 11.1899, 0],
	[4.93128, 13.834, 0],
	[5.92341, 12.0525, 0],
	[6.11531, 14.517, 0],
	[9.59615, 13.6633, 0],
	[10.4905, 13.8611, 0],
	[11.3376, 13.9555, 0],
	[12.1553, 13.9514, 0],
	[12.6903, 15.7679, 0],
	[12.9601, 13.8483, 0],
	[13.7677, 13.6402, 0],
	[14.5977, 13.3134, 0],
	[15.2685, 14.7022, 0],
	[16.1576, 14.1154, 0],
	[17.4753, 13.1091, 0],
	[17.2318, 11.5998, 0],
	[19.6365, 9.64675, 0],
	[19.5638, 11.4044, 0],
	[20.7885, 10.4768, 0],
	[20.7761, 8.79049, 0],
	[21.5628, 8.28176, 0],
	[21.6645, 9.89807, 0],
	[22.2488, 7.919, 0],
	[22.9185, 7.65884, 0],
	[23.5373, 7.51355, 0],
	[23.8321, 8.93904, 0],
	[24.2169, 7.44071, 0],
	[25.1265, 7.43294, 0],
	[25.4914, 7.45155, 0],
	[25.7737, 8.85492, 0],
	[26.4159, 9.0215, 0],
	[27.0636, 9.29644, 0],
	[27.9215, 7.96715, 0],
	[28.5303, 8.26265, 0],
	[29.4969, 9.11571, 0],
	[29.673, 9.41528, 0],
	[0, 10.0912, 0],
	[0, 1.9, 0],
	[0.570274, 10.5813, 0],
	[24.0229, 1.9, 4.5038],
	[24.0229, 2.94568, 4.5038],
	[24.3858, 1.9, 5.39894],
	[24.4788, 1.9, 5.30733],
	[24.3858, 2.94568, 5.39894],
	[24.4788, 2.94568, 5.30733],
	[23.5882, 1.9, 5.06156],
	[23.6211, 1.9, 5.18789],
	[23.5882, 2.94568, 5.06156],
	[23.6211, 2.94568, 5.18789],
	[24.5449, 1.9, 5.19478],
	[24.5796, 1.9, 5.06896],
	[24.5449, 2.94568, 5.19478],
	[24.5796, 2.94568, 5.06896],
	[23.6239, 1.9, 4.80521],
	[23.5892, 1.9, 4.93104],
	[23.6239, 2.94568, 4.80521],
	[23.5892, 2.94568, 4.93104],
	[23.69, 1.9, 4.69267],
	[23.69, 2.94568, 4.69267],
	[24.5806, 1.9, 4.93844],
	[24.5806, 2.94568, 4.93844],
	[24.1534, 1.9, 4.50478],
	[24.2723, 1.9, 5.46336],
	[23.6855, 1.9, 5.30141],
	[23.7771, 1.9, 5.39439],
	[23.8896, 1.9, 5.4605],
	[24.1534, 2.94568, 4.50478],
	[23.6855, 2.94568, 5.30141],
	[23.7771, 2.94568, 5.39439],
	[23.8896, 2.94568, 5.4605],
	[24.2723, 2.94568, 5.46336],
];

350ClipFaces = [
	[129, 2, 44],
	[0, 2, 129],
	[158, 159, 157],
	[119, 159, 158],
	[120, 119, 158],
	[122, 120, 18],
	[124, 122, 121],
	[99, 98, 123],
	[20, 99, 89],
	[12, 21, 88],
	[13, 12, 125],
	[129, 13, 126],
	[0, 129, 127],
	[1, 0, 130],
	[133, 1, 131],
	[134, 133, 132],
	[135, 134, 101],
	[138, 135, 136],
	[139, 138, 136],
	[110, 142, 137],
	[141, 111, 140],
	[10, 146, 141],
	[8, 10, 141],
	[151, 97, 152],
	[152, 97, 6],
	[6, 97, 4],
	[97, 109, 108],
	[4, 97, 108],
	[96, 97, 151],
	[143, 8, 141],
	[155, 156, 144],
	[90, 155, 145],
	[154, 91, 147],
	[153, 154, 149],
	[149, 154, 148],
	[148, 154, 147],
	[147, 91, 145],
	[156, 96, 143],
	[91, 90, 145],
	[96, 151, 143],
	[145, 155, 144],
	[151, 150, 143],
	[143, 150, 8],
	[16, 158, 117],
	[141, 146, 111],
	[140, 110, 137],
	[140, 111, 110],
	[137, 142, 139],
	[136, 135, 100],
	[100, 135, 101],
	[101, 134, 132],
	[132, 133, 131],
	[131, 1, 130],
	[130, 0, 128],
	[128, 0, 127],
	[127, 129, 126],
	[126, 13, 125],
	[125, 12, 118],
	[118, 12, 88],
	[88, 21, 89],
	[21, 20, 89],
	[123, 98, 121],
	[89, 99, 123],
	[98, 124, 121],
	[121, 122, 18],
	[18, 120, 158],
	[18, 158, 16],
	[137, 139, 136],
	[116, 117, 158],
	[103, 153, 149],
	[102, 103, 149],
	[144, 156, 143],
	[0, 3, 2],
	[1, 3, 0],
	[13, 44, 15],
	[129, 44, 13],
	[29, 26, 25],
	[17, 25, 19],
	[29, 25, 17],
	[19, 25, 30],
	[31, 19, 14],
	[33, 31, 15],
	[35, 33, 44],
	[37, 35, 44],
	[39, 37, 2],
	[58, 64, 62],
	[40, 39, 3],
	[41, 40, 3],
	[64, 58, 57],
	[42, 41, 48],
	[81, 7, 5],
	[43, 42, 50],
	[78, 73, 7],
	[82, 81, 5],
	[74, 9, 69],
	[43, 50, 45],
	[47, 59, 61],
	[57, 54, 64],
	[62, 60, 58],
	[49, 68, 67],
	[54, 66, 64],
	[53, 67, 66],
	[68, 49, 61],
	[47, 56, 59],
	[72, 11, 9],
	[70, 61, 63],
	[47, 55, 56],
	[77, 75, 73],
	[80, 78, 7],
	[75, 71, 73],
	[83, 76, 79],
	[82, 5, 83],
	[45, 50, 52],
	[80, 7, 81],
	[77, 73, 78],
	[74, 71, 75],
	[74, 69, 71],
	[72, 9, 74],
	[70, 11, 72],
	[49, 47, 61],
	[70, 65, 11],
	[70, 63, 65],
	[68, 61, 70],
	[50, 42, 48],
	[48, 41, 3],
	[3, 39, 2],
	[2, 37, 44],
	[44, 33, 15],
	[15, 31, 14],
	[14, 19, 23],
	[23, 19, 22],
	[22, 19, 38],
	[38, 19, 36],
	[36, 19, 34],
	[34, 19, 32],
	[32, 19, 30],
	[30, 25, 28],
	[28, 25, 27],
	[27, 25, 24],
	[83, 5, 76],
	[67, 53, 51],
	[51, 49, 67],
	[66, 54, 53],
	[47, 46, 55],
	[45, 52, 46],
	[46, 52, 55],
	[158, 24, 25],
	[157, 24, 158],
	[26, 116, 162],
	[26, 158, 25],
	[116, 94, 105],
	[26, 162, 183],
	[167, 166, 158],
	[26, 183, 87],
	[184, 167, 158],
	[26, 87, 85],
	[185, 184, 158],
	[26, 186, 158],
	[186, 185, 158],
	[162, 116, 163],
	[163, 116, 170],
	[170, 116, 171],
	[171, 116, 180],
	[180, 116, 104],
	[104, 116, 105],
	[158, 160, 182],
	[94, 116, 92],
	[92, 116, 182],
	[158, 115, 160],
	[182, 116, 158],
	[114, 115, 158],
	[178, 114, 158],
	[174, 178, 158],
	[166, 175, 158],
	[175, 174, 158],
	[26, 85, 186],
	[29, 117, 116],
	[29, 116, 26],
	[16, 29, 17],
	[117, 29, 107],
	[190, 16, 189],
	[177, 168, 16],
	[176, 177, 16],
	[179, 176, 16],
	[112, 179, 16],
	[113, 112, 16],
	[117, 113, 16],
	[161, 117, 187],
	[187, 117, 93],
	[93, 117, 95],
	[95, 117, 107],
	[107, 29, 106],
	[164, 29, 191],
	[106, 29, 181],
	[181, 29, 173],
	[173, 29, 172],
	[172, 29, 165],
	[165, 29, 164],
	[191, 29, 86],
	[86, 29, 84],
	[84, 29, 16],
	[190, 84, 16],
	[189, 16, 188],
	[169, 188, 16],
	[168, 169, 16],
	[113, 117, 161],
	[19, 18, 16],
	[19, 16, 17],
	[31, 121, 18],
	[31, 18, 19],
	[33, 123, 121],
	[33, 121, 31],
	[35, 89, 123],
	[35, 123, 33],
	[37, 88, 89],
	[37, 89, 35],
	[39, 118, 88],
	[39, 88, 37],
	[40, 125, 118],
	[40, 118, 39],
	[41, 126, 125],
	[41, 125, 40],
	[42, 127, 126],
	[42, 126, 41],
	[43, 128, 127],
	[43, 127, 42],
	[45, 130, 128],
	[45, 128, 43],
	[46, 131, 130],
	[46, 130, 45],
	[47, 132, 131],
	[47, 131, 46],
	[49, 101, 132],
	[49, 132, 47],
	[51, 100, 101],
	[51, 101, 49],
	[53, 136, 100],
	[53, 100, 51],
	[54, 137, 136],
	[54, 136, 53],
	[57, 140, 137],
	[57, 137, 54],
	[58, 141, 140],
	[58, 140, 57],
	[60, 143, 141],
	[60, 141, 58],
	[62, 144, 143],
	[62, 143, 60],
	[64, 145, 144],
	[64, 144, 62],
	[66, 147, 145],
	[66, 145, 64],
	[67, 148, 147],
	[67, 147, 66],
	[68, 149, 148],
	[68, 148, 67],
	[70, 102, 149],
	[70, 149, 68],
	[72, 103, 102],
	[72, 102, 70],
	[74, 153, 103],
	[74, 103, 72],
	[75, 154, 153],
	[75, 153, 74],
	[77, 91, 154],
	[77, 154, 75],
	[78, 90, 91],
	[78, 91, 77],
	[80, 155, 90],
	[80, 90, 78],
	[81, 156, 155],
	[81, 155, 80],
	[82, 96, 156],
	[82, 156, 81],
	[83, 97, 96],
	[83, 96, 82],
	[79, 109, 97],
	[79, 97, 83],
	[108, 79, 76],
	[109, 79, 108],
	[4, 76, 5],
	[108, 76, 4],
	[6, 5, 7],
	[4, 5, 6],
	[152, 7, 73],
	[6, 7, 152],
	[151, 73, 71],
	[152, 73, 151],
	[150, 71, 69],
	[151, 71, 150],
	[8, 69, 9],
	[150, 69, 8],
	[10, 9, 11],
	[8, 9, 10],
	[146, 11, 65],
	[10, 11, 146],
	[111, 65, 63],
	[146, 65, 111],
	[110, 63, 61],
	[111, 63, 110],
	[142, 61, 59],
	[110, 61, 142],
	[139, 59, 56],
	[142, 59, 139],
	[138, 56, 55],
	[139, 56, 138],
	[135, 55, 52],
	[138, 55, 135],
	[134, 52, 50],
	[135, 52, 134],
	[133, 50, 48],
	[134, 50, 133],
	[1, 48, 3],
	[133, 48, 1],
	[12, 15, 14],
	[13, 15, 12],
	[21, 14, 23],
	[12, 14, 21],
	[20, 23, 22],
	[21, 23, 20],
	[99, 22, 38],
	[20, 22, 99],
	[98, 38, 36],
	[99, 38, 98],
	[124, 36, 34],
	[98, 36, 124],
	[122, 34, 32],
	[124, 34, 122],
	[120, 32, 30],
	[122, 32, 120],
	[119, 30, 28],
	[120, 30, 119],
	[159, 28, 27],
	[119, 28, 159],
	[157, 27, 24],
	[159, 27, 157],
	[169, 168, 166],
	[169, 166, 167],
	[177, 175, 166],
	[177, 166, 168],
	[176, 174, 175],
	[176, 175, 177],
	[179, 178, 174],
	[179, 174, 176],
	[112, 114, 178],
	[112, 178, 179],
	[113, 115, 114],
	[113, 114, 112],
	[161, 160, 115],
	[161, 115, 113],
	[187, 182, 160],
	[187, 160, 161],
	[93, 92, 182],
	[93, 182, 187],
	[95, 94, 92],
	[95, 92, 93],
	[94, 107, 105],
	[95, 107, 94],
	[105, 106, 104],
	[107, 106, 105],
	[104, 181, 180],
	[106, 181, 104],
	[171, 181, 173],
	[180, 181, 171],
	[170, 173, 172],
	[171, 173, 170],
	[163, 172, 165],
	[170, 172, 163],
	[162, 165, 164],
	[163, 165, 162],
	[183, 164, 191],
	[162, 164, 183],
	[87, 191, 86],
	[183, 191, 87],
	[85, 86, 84],
	[87, 86, 85],
	[186, 84, 190],
	[85, 84, 186],
	[185, 190, 189],
	[186, 190, 185],
	[189, 188, 184],
	[189, 184, 185],
	[188, 169, 167],
	[188, 167, 184],
];

module 350Clip() {
	polyhedron(points = 350ClipPoints, faces = 350ClipFaces, convexity = 4);
}
