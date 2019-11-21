

/* [Size and Shape] */

box_size = 100;
base_height = 25;
cap_height = 5;

box_shape = 4; // [1:Classic heart,2:Heavy hart,3:Thin heart,4:Curved heart]

/* [Width] */

bottom_wall = 2;
top_wall = 2;
side_wall = 2;

/* [Fine tuning] */
cap_to_body_inserting = 4;
cap_to_body_gap = 0.1;

/* [Hidden] */

$fa = 1;
$fs = 1;

size = box_size;
base = base_height;
cap = cap_height;

bottom = bottom_wall;
top = top_wall;

wall = side_wall;

cap_to_body = cap_to_body_inserting;
//cap_to_body_gap = cap_to_body_gap;

shape = box_shape;

heart_size = size / 1.5;


base_and_cap();


module base_and_cap() {
    rotate([0, 0, -90]) {
        base3d();
        translate([0, size, 0])
            rotate([0, 0, 90])
                cap3d();
    }
}

module cap3d() {
    difference() {
        union() {
            linear_extrude(cap)
                mirror([1, 0, 0])
                    heart_shape(shape);
            linear_extrude(cap + cap_to_body)
                offset(delta = -(wall+cap_to_body_gap))
                    mirror([1, 0, 0])
                        heart_shape(shape);
        }
        translate([0, 0, top])
            linear_extrude(cap + cap_to_body)
                offset(delta = -(wall+cap_to_body_gap+wall))
                    mirror([1, 0, 0])
                        heart_shape(shape);
    }
}

module base3d() {
    difference() {
        linear_extrude(base)
            heart_shape(shape);
        translate([0, 0, bottom])
            linear_extrude(base)
                offset(delta = -wall)
                    heart_shape(shape);
    }
}

module heart_shape(n) {
    if (n == 1) {
        heart_shape_1(heart_size);
    } else if (n == 2) {
        heart_shape_2(size);
    } else if (n == 3) {
        heart_shape_3(size);
    } else if (n == 4) {
        heart_shape_4(size);
    }
}


module heart_shape_1(size) {
    translate([2, 2, 0])
        union() {
            square(size);
            translate([size/2, size, 0])
                circle(size/2);
            translate([size, size/2, 0])
                circle(size/2);
        }
}

module heart_shape_2(size) {
    image = [[115.5,33.26],[115.5,33.26],[111.992,33.015],[107.618,32.912],[98.5,33.15],[98.5,33.15],[94.262,33.496],[90.117,33.955],[84,34.97],[84,34.97],[81.86,35.565],[79.355,36.325],[74.5,37.95],[74.5,37.95],[72.164,38.847],[69.5,39.946],[64.5,42.19],[64.5,42.19],[62.242,43.334],[59.793,44.651],[55.5,47.15],[55.5,47.15],[53.443,48.598],[50.801,50.672],[45.12,55.59],[45.12,55.59],[42.262,58.477],[39.185,61.968],[33.85,69],[33.85,69],[31.707,72.506],[29.487,76.503],[25.86,84],[25.86,84],[24.51,87.683],[23.122,92.163],[20.88,101.25],[20.88,101.25],[20.033,106.481],[19.448,112.137],[19,125.5],[19,125.5],[19.117,132.607],[19.476,139.203],[20.95,151.25],[20.95,151.25],[21.912,156.329],[23.096,161.84],[25.52,171.5],[25.52,171.5],[26.939,175.981],[28.856,181.529],[33.19,193],[33.19,193],[35.728,198.921],[38.916,205.797],[45.61,219],[45.61,219],[49.128,225.111],[53.241,231.767],[61.21,243.5],[61.21,243.5],[65.344,248.745],[70.54,254.897],[81.46,266.85],[81.46,266.85],[86.884,272.301],[92.755,278.02],[103,287.54],[103,287.54],[107.637,291.541],[113.236,296.253],[124.5,305.47],[124.5,305.47],[130.579,310.163],[138.262,315.86],[154.5,327.39],[154.5,327.39],[162.258,332.66],[170.077,337.9],[182.25,345.86],[192,352],[202.75,345.27],[202.75,345.27],[208.067,341.871],[214.602,337.603],[228,328.64],[228,328.64],[234.657,323.996],[242.061,318.677],[255.5,308.64],[255.5,308.64],[261.455,303.913],[268.061,298.516],[280,288.37],[280,288.37],[285.303,283.566],[291.236,278.002],[302.09,267.35],[302.09,267.35],[306.696,262.504],[311.416,257.336],[318.98,248.5],[318.98,248.5],[321.718,244.96],[324.523,241.236],[329.01,235],[329.01,235],[330.894,232.077],[333.271,228.18],[338.29,219.5],[338.29,219.5],[340.833,214.71],[343.658,209.061],[348.78,198],[348.78,198],[350.986,192.649],[353.34,186.576],[357.36,175.25],[357.36,175.25],[358.89,170.19],[360.367,164.732],[362.49,155.25],[362.49,155.25],[363.142,150.985],[363.815,145.84],[364.9,135.5],[364.9,135.5],[365.207,130.371],[365.318,124.923],[364.95,115],[364.95,115],[364.533,110.88],[364.031,106.678],[363.03,100],[363.03,100],[362.491,97.472],[361.806,94.648],[360.35,89.5],[360.35,89.5],[359.478,87.085],[358.316,84.206],[355.72,78.5],[355.72,78.5],[354.266,75.737],[352.513,72.648],[349,67],[349,67],[347.054,64.4],[344.499,61.382],[338.89,55.6],[338.89,55.6],[335.977,53.031],[332.765,50.407],[327,46.22],[327,46.22],[324.235,44.612],[320.767,42.813],[313.5,39.52],[313.5,39.52],[309.999,38.181],[306.381,36.902],[300.5,35.11],[300.5,35.11],[297.769,34.58],[294.031,34.037],[285.5,33.16],[285.5,33.16],[281.105,32.932],[276.53,32.863],[269,33.19],[269,33.19],[265.847,33.652],[262.061,34.336],[254.5,36],[254.5,36],[250.802,37.071],[246.648,38.483],[239,41.59],[239,41.59],[235.577,43.315],[231.797,45.377],[225,49.48],[225,49.48],[221.845,51.814],[218.053,54.982],[210.47,62.15],[210.47,62.15],[206.963,66.001],[203.343,70.317],[197.47,78.23],[197.47,78.23],[195.502,81.235],[193.816,83.692],[192,85.96],[192,85.96],[191.453,85.389],[190.328,83.85],[187,78.8],[187,78.8],[184.584,75.32],[181.328,71.127],[174,62.72],[174,62.72],[170.188,58.91],[166.087,55.151],[159,49.51],[159,49.51],[155.985,47.604],[152.576,45.575],[146.25,42.12],[146.25,42.12],[143.131,40.71],[139.263,39.183],[131.25,36.51],[131.25,36.51],[127.301,35.487],[123.014,34.532],[115.5,33.26]];
    resize([0, size, 0], auto=true)
        translate([140, 410, 0])
            rotate([0, 0, 135])
                mirror([1, 0, 0])
                    polygon(image);
}

module heart_shape_3(size) {
    image = [[112.5,9.16],[112.5,9.16],[111.092,9.269],[108.737,9.485],[102.5,10.11],[102.5,10.11],[98.702,10.635],[94.278,11.446],[85.75,13.48],[85.75,13.48],[81.82,14.697],[77.587,16.157],[70.25,19.06],[70.25,19.06],[66.998,20.671],[63.133,22.788],[55.5,27.44],[55.5,27.44],[51.647,30.268],[47.213,33.947],[38.5,42.21],[38.5,42.21],[34.504,46.635],[30.622,51.358],[24.5,60.05],[24.5,60.05],[22.309,63.979],[20.04,68.48],[16.329,76.97],[16.329,76.97],[14.967,80.912],[13.594,85.343],[11.46,93.5],[11.46,93.5],[10.709,97.889],[10.18,102.981],[9.77,115.5],[9.77,115.5],[9.896,121.995],[10.243,128.415],[11.49,139.5],[11.49,139.5],[12.414,144.212],[13.68,149.648],[16.56,160],[16.56,160],[18.235,164.789],[20.298,170.061],[24.54,179.5],[24.54,179.5],[26.742,183.625],[29.352,188.206],[34.48,196.5],[34.48,196.5],[37.183,200.356],[40.593,204.942],[47.78,214],[47.78,214],[51.888,218.677],[57.187,224.385],[68.62,236],[68.62,236],[74.926,241.997],[82.567,249.078],[98,262.96],[98,262.96],[105.592,269.655],[114.061,277.188],[129.5,291.08],[129.5,291.08],[136.232,297.32],[143.473,304.217],[156,316.62],[156,316.62],[161.061,321.946],[166.347,327.659],[175.09,337.5],[175.09,337.5],[178.642,341.823],[182.708,346.942],[190.38,357],[190.38,357],[193.56,361.315],[196.533,365.298],[200.52,370.5],[200.52,370.5],[201.789,371.96],[202.67,372.652],[203.89,372],[203.89,372],[204.858,370.551],[206.811,367.711],[212.53,359.5],[212.53,359.5],[216.198,354.401],[220.487,348.648],[228.79,338],[228.79,338],[233.738,332.302],[240.881,324.546],[257.93,306.93],[257.93,306.93],[267.691,297.373],[279.067,286.553],[301,266.44],[301,266.44],[310.794,257.676],[320.822,248.545],[336.88,233.5],[336.88,233.5],[342.697,227.703],[348.658,221.529],[358.21,211],[358.21,211],[361.778,206.603],[365.607,201.648],[372.21,192.5],[372.21,192.5],[374.925,188.216],[377.871,183.206],[383.03,173.5],[383.03,173.5],[385.095,168.947],[387.17,163.942],[390.38,155],[390.38,155],[391.504,150.948],[392.67,146.206],[394.57,137],[394.57,137],[395.32,131.695],[395.747,126.083],[395.74,111.5],[395.74,111.5],[395.398,102.955],[394.868,96.78],[392.61,86.5],[392.61,86.5],[391.232,82.295],[389.457,77.5],[385.63,68.5],[385.63,68.5],[383.475,64.374],[380.807,59.793],[375.28,51.5],[375.28,51.5],[372.439,47.927],[369.155,44.115],[362.88,37.6],[362.88,37.6],[359.928,34.987],[356.611,32.242],[350.5,27.65],[350.5,27.65],[347.46,25.745],[343.618,23.543],[335.5,19.34],[335.5,19.34],[331.374,17.522],[326.793,15.72],[318.5,13],[318.5,13],[314.644,12.123],[310.061,11.268],[301,10.01],[301,10.01],[296.371,9.7],[291.366,9.6],[281.5,10.03],[281.5,10.03],[276.947,10.583],[271.942,11.405],[263,13.41],[263,13.41],[259.149,14.607],[254.942,16.065],[247.5,19.02],[247.5,19.02],[244.249,20.595],[240.572,22.546],[233.75,26.59],[233.75,26.59],[230.49,28.916],[226.601,31.983],[218.89,38.75],[218.89,38.75],[215.474,42.133],[212.168,45.618],[207.39,51.25],[207.39,51.25],[205.977,53.096],[204.631,54.617],[202.75,56.05],[202.75,56.05],[201.91,55.607],[200.552,54.375],[197.02,50.3],[197.02,50.3],[194.768,47.546],[191.943,44.337],[186.02,38.15],[186.02,38.15],[182.978,35.343],[179.51,32.393],[173,27.47],[173,27.47],[169.808,25.473],[165.916,23.237],[158,19.14],[158,19.14],[154.066,17.426],[149.645,15.703],[141.5,13.04],[141.5,13.04],[137.644,12.147],[133.061,11.275],[124,9.99],[124,9.99],[120.155,9.636],[116.705,9.361],[112.5,9.16]];
    resize([0, size, 0], auto=true)
        translate([130, 410, 0])
            rotate([0, 0, 135])
                mirror([1, 0, 0])
                    polygon(image);
}

module heart_shape_4(size) {
    image = [[250.5,22.46],[250.5,22.46],[245.038,22.394],[239.777,22.485],[232.25,23.05],[232.25,23.05],[229.756,23.6],[226.851,24.398],[221.25,26.31],[221.25,26.31],[218.55,27.517],[215.446,29.097],[209.56,32.56],[209.56,32.56],[206.898,34.446],[204.046,36.667],[199.14,41],[199.14,41],[197.113,43.143],[194.89,45.648],[190.94,50.5],[190.94,50.5],[189.141,53.072],[187.011,56.381],[182.82,63.5],[182.82,63.5],[180.701,67.167],[179,69.648],[176.5,71.5],[176.5,71.5],[175.371,71.055],[174,69.648],[170.18,63.5],[170.18,63.5],[168.184,59.999],[165.988,56.381],[162.06,50.5],[162.06,50.5],[160.223,48.169],[157.978,45.52],[153.41,40.57],[153.41,40.57],[151.03,38.353],[148.18,35.96],[142.5,31.8],[142.5,31.8],[139.696,30.139],[136.5,28.467],[130.5,25.87],[130.5,25.87],[127.182,24.916],[123.267,24.166],[113.5,23.25],[113.5,23.25],[107.872,23.09],[103.148,23.218],[94.5,24.47],[94.5,24.47],[90.841,25.4],[86.793,26.645],[79.5,29.42],[79.5,29.42],[76.327,30.959],[72.866,32.771],[66.75,36.31],[66.75,36.31],[64.064,38.151],[61,40.436],[55.25,45.17],[55.25,45.17],[52.595,47.66],[49.617,50.611],[44.15,56.42],[44.15,56.42],[41.692,59.331],[38.966,62.768],[34.03,69.5],[34.03,69.5],[31.948,72.691],[29.788,76.206],[26.26,82.5],[26.26,82.5],[24.893,85.382],[23.392,88.793],[20.72,95.5],[20.72,95.5],[19.612,98.928],[18.465,103.087],[16.6,111.5],[16.6,111.5],[15.978,115.487],[15.47,119.691],[15,126.75],[15,126.75],[15.108,129.749],[15.406,133.293],[16.39,140.25],[16.39,140.25],[17.177,143.697],[18.298,147.721],[20.95,155.5],[20.95,155.5],[22.435,159],[24.13,162.617],[27.31,168.49],[27.31,168.49],[28.94,170.899],[31.013,173.776],[35.43,179.49],[35.43,179.49],[39.361,183.877],[46.423,191.373],[65.93,211.5],[65.93,211.5],[76.33,222.249],[85.75,232.297],[97.5,245.79],[97.5,245.79],[100.24,249.775],[103.265,254.497],[108.7,263.79],[108.7,263.79],[110.96,268.308],[113.272,273.436],[116.96,283],[116.96,283],[118.262,287.302],[119.553,291.988],[121.51,300.25],[121.51,300.25],[122.131,304.549],[122.591,309.98],[122.96,323.25],[122.96,323.25],[122.872,329.528],[122.675,335.345],[122.06,343],[122.06,343],[121.784,344.859],[121.652,346.591],[121.86,348.9],[121.86,348.9],[122.472,349.548],[123.712,349.873],[129,349.64],[129,349.64],[132.784,349.022],[138.288,347.823],[151.5,344.38],[151.5,344.38],[158.264,342.395],[164.856,340.393],[174.5,337.27],[174.5,337.27],[178.362,335.804],[183.704,333.667],[196,328.52],[196,328.52],[202.066,325.872],[207.859,323.288],[216,319.49],[216,319.49],[218.768,318.02],[222.236,316.076],[229.5,311.77],[229.5,311.77],[233.04,309.522],[236.767,307.061],[243,302.69],[243,302.69],[245.887,300.448],[249.678,297.396],[258,290.46],[258,290.46],[262.413,286.527],[267.401,281.815],[276.66,272.42],[276.66,272.42],[280.719,267.939],[284.998,263.066],[292.19,254.5],[292.19,254.5],[295.061,250.841],[298.177,246.793],[303.64,239.5],[303.64,239.5],[306.089,235.992],[308.997,231.618],[314.73,222.5],[314.73,222.5],[317.298,218.143],[319.856,213.675],[323.76,206.5],[323.76,206.5],[325.216,203.5],[326.938,199.767],[330.32,192],[330.32,192],[331.896,187.991],[333.581,183.355],[336.46,174.5],[336.46,174.5],[337.639,170.177],[338.928,165.061],[341.21,155],[341.21,155],[342.24,149.161],[342.911,143.232],[343.42,128],[343.42,128],[343.371,119.689],[343.101,113.393],[341.68,104],[341.68,104],[340.659,100.341],[339.226,95.916],[335.88,87],[335.88,87],[333.9,82.682],[331.467,77.942],[326.47,69.5],[326.47,69.5],[323.904,65.885],[320.937,61.957],[315.27,55.06],[315.27,55.06],[312.439,52.058],[308.995,48.644],[302,42.26],[302,42.26],[298.42,39.446],[294.21,36.488],[286,31.55],[286,31.55],[282.149,29.688],[277.942,27.833],[270.5,25.01],[270.5,25.01],[266.524,23.949],[262.198,23.213],[250.5,22.46]];
    resize([0, size, 0], auto=true)
        translate([130, 400, 0])
            rotate([0, 0, 135])
                mirror([1, 0, 0])
                    polygon(image);
}

