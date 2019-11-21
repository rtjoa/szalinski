/* [Machine Settings] */

// Your selected layer height
layerHeight=0.2;

// Your printers line width
lineWidth=0.4;

/* [Print Settings] */

// Number of layers to print of the base
layersBase=3;

// Number of lines to print in the base
linesBase=3;

// Number of lines to print the cutter
linesThick=2;

// Number of layers tell for the cutter
layersHeight=60;

// Scale
cutterScale=1;

/* [Support Settings] */

// Support X Gap Factor
supportXGapFactor=20;

// Support Y Gap Factor
supportYGapFactor=30;

// Support Rotation
supportRotation=0;

// Support X Offset
supportXOffset=2;

// Support Y Offset
supportYOffset=0;

linear_extrude(layersBase * layerHeight)
supports();

linear_extrude(layersBase * layerHeight)
offset(linesBase * lineWidth)
sleighOutline();

linear_extrude(layersHeight * layerHeight)
sleighOutline();

module supports() {
    intersection() {
        sleigh();
        
        rotate([0, 0, supportRotation])
        union() {
            for (i = [-200:lineWidth * linesBase * supportXGapFactor:200]) {
                translate([i + supportXOffset, 0])
                square([lineWidth * linesBase * 2, 400], true);
            }
            
            for (i = [-200:lineWidth * linesBase * supportYGapFactor:200]) {
                translate([0, i + supportYOffset])
                square([400, lineWidth * linesBase * 2], true);
            }
        }
    }
}

module sleighOutline() {
    difference() {
        offset(linesThick * lineWidth)
        sleigh();
        
        sleigh();
    }
}

module sleigh()
    scale(cutterScale)
    polygon(
        points=
            [[-25.034, -30.277], [-28.255, -29.962], [-30.659, -29.463], [-32.422, -28.73], [-33.719, -27.711], [-34.698, -26.361], [-35.266, -24.874], [-35.448, -23.341], [-35.265, -21.852], [-34.74, -20.498], [-33.895, -19.369], [-32.753, -18.556], [-31.337, -18.148], [-29.718, -18.301], [-30.471, -19.865], [-31.432, -21.586], [-31.661, -23.15], [-31.168, -24.437], [-29.966, -25.326], [-27.936, -25.715], [-24.497, -25.98], [-20.582, -26.041], [-17.128, -25.817], [-15.196, -25.212], [-14.397, -24.208], [-14.585, -23.018], [-15.615, -21.855], [-17.916, -20.849], [-19.933, -19.759], [-21.916, -18.466], [-23.963, -16.653], [-28.014, -11.794], [-31.621, -5.837], [-34.322, 0.563], [-35.899, 6.824], [-36.922, 13.992], [-37.514, 18.484], [-38.018, 19.333], [-38.921, 20.039], [-40.38, 21.441], [-41.285, 23.088], [-41.656, 24.878], [-41.517, 26.709], [-40.888, 28.476], [-39.793, 30.076], [-38.253, 31.407], [-36.291, 32.364], [-34.097, 32.684], [-31.295, 32.15], [-27.407, 30.613], [-21.951, 27.926], [-15.982, 25.01], [-11.497, 23.522], [-6.99, 23.151], [-0.955, 23.585], [3.106, 23.912], [5.881, 23.887], [7.843, 23.467], [9.466, 22.607], [10.511, 21.551], [11.53, 19.985], [12.304, 18.309], [12.61, 16.921], [12.343, 15.343], [11.587, 14.04], [10.409, 13.091], [8.879, 12.574], [7.601, 12.117], [7.612, 11.147], [8.089, 9.341], [9.945, 4.765], [11.674, 1.805], [14.047, -0.866], [17.179, -3.56], [20.32, -5.331], [23.658, -6.255], [27.379, -6.412], [30.98, -5.926], [34.002, -4.769], [36.734, -2.784], [39.463, 0.186], [41.746, 2.72], [44.125, 4.199], [46.54, 5.167], [49.426, 5.961], [52.421, 6.497], [55.161, 6.694], [57.095, 6.548], [57.5, 6.327], [57.517, 5.975], [56.34, 4.777], [53.48, 2.754], [49.722, 0.23], [47.289, -1.859], [45.739, -4.476], [44.635, -8.587], [43.636, -12.456], [42.296, -14.843], [40.193, -16.602], [36.904, -18.584], [35.406, -19.594], [34.555, -20.594], [34.252, -21.655], [34.397, -22.844], [35.4, -24.083], [36.729, -24.643], [39.807, -24.805], [45.179, -24.745], [49.261, -24.303], [52.713, -23.283], [55.047, -21.943], [56.892, -20.184], [58.877, -17.914], [60.137, -15.858], [60.558, -13.728], [60.527, -11.78], [60.803, -10.392], [61.308, -9.486], [61.965, -8.983], [63.424, -8.877], [64.564, -9.449], [64.99, -10.098], [65.28, -11.185], [65.496, -14.526], [65.329, -17.439], [64.466, -19.753], [62.748, -22.55], [60.435, -24.952], [57.554, -26.937], [54.133, -28.48], [50.559, -29.599], [45.228, -30.169], [12.61, -30.453], [-25.034, -30.277]],
        paths=
            [[0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 0]]
    );
