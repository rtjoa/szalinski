// OpenSCAD file automatically generated by svg2cookiercutter.py
wallHeight = 12;
wallFlareWidth = 3;
wallFlareThickness = 1.5;
minWallWidth = 1;
maxWallWidth = 3;
insideWallFlareWidth = 2;
insideWallFlareThickness = 1.5;
minInsideWallWidth = 1;
maxInsideWallWidth = 3;
featureHeight = 8;
minFeatureThickness = 0.8;
maxFeatureThickness = 3;
connectorThickness = 1;
size = 76.823;

module dummy() {}

scale = size/76.823;

module ribbon(points, thickness=1, closed=false) {
    p = closed ? concat(points, [points[0]]) : points;
    
    union() {
        for (i=[1:len(p)-1]) {
            hull() {
                translate(p[i-1]) circle(d=thickness, $fn=8);
                translate(p[i]) circle(d=thickness, $fn=8);
            }
        }
    }
}

module cookieCutter() {

path0=scale*[[-148.756,106.447],[-153.189,109.080],[-152.858,109.379],[-150.382,110.982],[-146.670,113.008],[-146.402,113.186],[-146.642,113.425],[-149.098,114.918],[-107.093,111.971],[-106.780,109.795],[-105.644,104.917],[-105.231,100.778],[-148.756,106.447]];
render(convexity=10) linear_extrude(height=connectorThickness) polygon(points=path0);
path1=scale*[[-135.389,114.768],[-135.449,114.304],[-135.089,113.944],[-134.230,113.199],[-133.567,112.280],[-133.450,111.945],[-133.489,111.695],[-133.683,111.522],[-134.029,111.421],[-135.293,111.355],[-136.569,111.584],[-137.126,110.051],[-138.042,106.872],[-138.045,106.583],[-137.871,106.349],[-135.697,104.249],[-135.530,103.988],[-135.527,103.737],[-135.675,103.533],[-135.962,103.416],[-137.291,103.260],[-138.694,103.323]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path1,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path2=scale*[[-106.709,109.514],[-108.219,102.182],[-108.391,101.134],[-108.580,100.098],[-108.753,99.897],[-109.016,99.835],[-109.399,99.885],[-109.712,99.870],[-110.002,99.737],[-110.507,99.529],[-110.736,99.597],[-111.199,99.951],[-111.458,99.897],[-112.091,99.764],[-112.395,99.833],[-112.695,100.002],[-113.018,100.047],[-113.520,100.045],[-113.839,100.140],[-114.026,100.380],[-114.133,100.815],[-114.278,101.069],[-114.653,101.344],[-114.847,101.619],[-114.882,101.956],[-114.684,102.683],[-114.502,103.025],[-114.440,103.378],[-114.528,104.110],[-114.903,106.358],[-114.983,107.492],[-114.967,108.634],[-114.755,110.432],[-114.233,112.167],[-114.047,112.292]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path2,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path3=scale*[[-134.027,125.531],[-134.289,129.706],[-134.255,131.793],[-134.004,133.682],[-133.461,135.866],[-132.614,137.957],[-104.380,133.957],[-103.889,131.525],[-103.611,130.652],[-102.750,128.633],[-102.472,127.608],[-102.353,126.463],[-102.390,125.317],[-102.579,124.292],[-134.027,125.531]];
render(convexity=10) linear_extrude(height=connectorThickness) polygon(points=path3);
path4=scale*[[-126.628,123.413],[-127.237,123.425],[-127.805,123.562],[-128.321,123.811],[-128.774,124.158],[-129.153,124.591],[-129.448,125.097],[-129.647,125.663],[-129.740,126.276],[-129.704,126.913],[-129.534,127.520],[-129.243,128.080],[-128.849,128.576],[-128.365,128.989],[-127.807,129.302],[-127.191,129.499],[-126.531,129.560],[-125.943,129.501],[-125.395,129.346],[-124.896,129.098],[-124.456,128.757],[-124.086,128.326],[-123.795,127.807],[-123.593,127.202],[-123.490,126.513],[-123.505,125.879],[-123.639,125.294],[-123.886,124.767],[-124.240,124.311],[-124.697,123.937],[-125.251,123.655],[-125.896,123.476],[-126.628,123.413]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path4,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path5=scale*[[-119.870,132.743],[-119.891,132.094],[-120.017,131.518],[-120.240,131.016],[-120.551,130.592],[-120.941,130.250],[-121.403,129.994],[-121.928,129.826],[-122.506,129.751],[-123.679,129.874],[-124.191,130.075],[-124.639,130.371],[-125.012,130.764],[-125.299,131.256],[-125.489,131.849],[-125.572,132.544],[-125.536,133.137],[-125.392,133.696],[-125.151,134.208],[-124.825,134.660],[-124.423,135.037],[-123.958,135.328],[-123.439,135.517],[-122.877,135.593],[-122.252,135.561],[-121.680,135.433],[-121.171,135.211],[-120.734,134.896],[-120.376,134.491],[-120.107,133.995],[-119.935,133.412],[-119.870,132.743]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path5,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path6=scale*[[-122.854,112.640],[-122.657,112.528],[-122.186,111.698],[-121.673,110.109],[-121.275,108.489],[-120.983,106.853],[-120.669,103.541],[-120.625,102.731],[-120.386,101.952],[-120.185,100.946],[-120.262,100.660],[-120.492,100.473],[-120.901,100.343],[-121.218,100.203],[-121.433,99.928],[-121.634,99.605],[-121.865,99.433],[-122.155,99.399],[-122.531,99.492],[-122.786,99.522],[-123.006,99.370],[-123.311,99.146],[-123.662,99.047],[-124.578,99.311],[-125.023,99.152],[-125.523,99.472],[-125.706,99.518],[-126.252,99.499],[-126.636,99.644],[-126.842,99.857],[-126.856,100.042],[-126.828,100.961],[-126.929,101.290],[-128.362,103.517],[-128.906,104.519],[-129.341,105.566],[-130.559,109.904],[-130.670,111.105],[-130.444,111.369]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path6,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path7=scale*[[-106.103,132.159],[-106.221,131.239],[-106.491,130.682],[-106.883,130.247],[-107.371,129.977],[-107.985,129.882],[-108.594,129.987],[-109.160,130.278],[-109.646,130.741],[-110.084,131.593],[-110.228,132.580],[-110.097,133.570],[-109.711,134.431],[-109.098,135.025],[-108.760,135.167],[-108.413,135.218],[-107.733,135.084],[-107.138,134.693],[-106.675,134.147],[-106.361,133.536],[-106.176,132.870],[-106.103,132.159]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path7,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path8=scale*[[-114.866,125.207],[-115.781,125.372],[-116.192,125.558],[-116.567,125.827],[-117.011,126.455],[-117.028,126.613],[-116.908,126.793],[-116.751,126.776],[-116.615,126.655],[-116.047,126.183],[-115.521,125.963],[-114.984,125.879],[-114.444,125.921],[-113.384,126.254],[-112.863,126.333],[-112.343,126.301],[-111.816,126.139],[-111.135,126.051],[-110.546,126.328],[-110.144,126.677],[-109.933,126.728],[-109.838,126.527],[-110.179,125.887],[-110.582,125.592],[-111.021,125.444],[-111.486,125.431],[-111.967,125.547],[-112.804,125.680],[-113.631,125.504],[-114.866,125.207]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path8,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
render(convexity=10) linear_extrude(height=featureHeight) polygon(points=path8);
path9=scale*[[-112.545,129.485],[-111.864,129.343],[-111.707,129.204],[-111.779,128.980],[-112.112,128.632],[-112.426,128.493],[-112.762,128.559],[-113.297,128.941],[-113.425,129.189],[-113.217,129.355],[-112.545,129.485]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path9,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
render(convexity=10) linear_extrude(height=featureHeight) polygon(points=path9);
path10=scale*[[-129.264,91.541],[-129.703,91.637],[-130.926,91.727],[-132.124,91.921],[-133.294,92.244],[-135.499,93.168],[-135.718,93.169]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path10,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path11=scale*[[-108.345,93.263],[-108.952,93.128],[-109.852,92.721],[-111.741,92.173],[-112.719,92.038],[-115.609,92.022]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path11,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path12=scale*[[-133.995,133.374],[-134.043,133.451],[-134.004,133.682],[-133.461,135.866],[-132.614,137.957],[-132.531,138.355],[-132.700,138.714],[-136.430,142.859],[-138.669,145.574],[-142.247,150.678],[-143.270,152.407],[-144.741,155.545],[-145.330,157.170],[-146.039,159.965],[-146.067,160.537],[-145.976,161.117],[-145.690,161.117],[-144.428,160.700],[-143.239,160.111],[-141.610,159.169],[-140.067,158.086],[-138.113,156.578],[-136.252,154.962],[-134.516,153.281],[-132.932,151.452],[-130.344,148.067],[-127.567,143.594],[-127.274,143.339],[-126.912,143.369],[-124.849,144.010],[-123.226,144.339],[-121.591,144.533],[-119.516,144.526],[-117.440,144.405],[-115.947,144.211],[-114.497,143.853],[-113.080,143.371],[-111.689,142.801],[-110.832,142.552],[-109.903,142.655],[-103.555,144.439],[-101.264,144.997],[-98.939,145.388],[-95.059,145.827],[-93.101,145.906],[-91.141,145.885],[-87.820,145.539],[-87.330,145.382],[-86.965,144.990],[-86.965,144.776],[-87.446,144.040],[-88.851,142.781],[-90.432,141.764],[-94.979,139.706],[-96.208,139.301],[-98.725,138.684],[-102.646,137.986],[-105.848,137.681],[-105.760,137.513],[-104.940,135.785],[-104.380,133.957],[-103.889,131.525],[-103.611,130.652],[-102.750,128.633],[-102.526,127.891],[-102.393,127.136],[-102.370,125.587],[-102.650,124.171],[-102.926,123.518],[-103.299,122.907],[-104.775,121.110],[-107.928,118.157],[-108.045,117.904],[-108.066,117.602],[-107.892,116.879],[-107.387,114.443],[-107.093,111.971],[-106.780,109.795],[-105.644,104.917],[-105.231,100.778],[-105.206,99.718],[-105.333,98.686],[-105.591,97.678],[-105.960,96.692],[-106.410,95.821],[-106.996,94.914],[-108.262,93.277],[-108.345,93.263],[-107.818,93.000],[-106.677,91.978],[-105.672,90.847],[-104.787,89.619],[-104.005,88.306],[-103.895,87.899],[-104.039,87.389],[-104.318,87.126],[-105.207,86.994],[-106.378,87.104],[-107.835,87.490],[-109.453,88.087],[-111.108,88.833],[-112.676,89.662],[-114.031,90.513],[-115.051,91.321],[-115.609,92.022],[-115.609,91.971],[-117.634,92.406],[-120.413,92.738],[-121.738,92.660],[-129.267,91.472],[-129.263,91.541],[-129.665,90.716],[-130.336,89.713],[-132.146,87.503],[-134.004,85.575],[-135.222,84.590],[-135.987,84.346],[-136.647,84.294],[-137.080,84.608],[-137.264,85.027],[-137.333,85.990],[-137.305,86.955],[-137.026,89.470],[-136.667,91.162],[-136.051,92.778],[-135.892,93.044],[-135.718,93.169],[-136.380,94.158],[-136.975,94.949],[-137.490,95.783],[-137.913,96.667],[-138.232,97.604],[-138.713,99.608],[-138.926,99.949],[-140.896,101.276],[-144.724,103.861],[-146.368,104.852],[-148.756,106.447],[-151.880,108.289],[-153.189,109.080],[-152.858,109.379],[-150.382,110.982],[-146.670,113.008],[-146.402,113.186],[-146.642,113.425],[-155.688,118.844],[-155.868,119.039],[-155.765,119.264],[-154.600,120.134],[-148.395,123.137],[-146.411,124.009],[-146.196,124.196],[-146.347,124.443],[-151.344,128.611],[-153.696,130.389],[-157.407,132.887],[-157.635,133.100],[-157.725,133.332],[-157.673,133.569],[-157.477,133.798],[-154.696,135.998],[-151.103,138.471],[-146.449,141.481],[-143.866,143.100],[-143.626,143.165],[-143.410,143.025],[-139.136,138.649],[-134.043,133.450]];
render(convexity=10) linear_extrude(height=(wallHeight)) ribbon(path12,thickness=min(maxWallWidth,max(0.200,minWallWidth)));
difference() {
 render(convexity=10) linear_extrude(height=wallFlareThickness) ribbon(path12,thickness=wallFlareWidth);
 translate([0,0,-0.01]) linear_extrude(height=wallFlareThickness+0.02) polygon(points=path12);
}
path13=scale*[[-133.539,120.906],[-136.787,119.963],[-140.745,118.667],[-141.148,118.511],[-141.310,118.349],[-141.247,118.128],[-140.977,117.798],[-136.955,113.380],[-136.738,112.982],[-137.033,112.190],[-137.364,111.899],[-141.342,110.389],[-143.490,109.452],[-143.692,109.268],[-143.572,109.021],[-138.638,104.264],[-138.548,104.595],[-137.759,107.843],[-136.756,111.058],[-134.885,116.087],[-133.539,120.906]];
render(convexity=10) linear_extrude(height=(wallHeight)) ribbon(path13,thickness=min(maxInsideWallWidth,max(0.200,minInsideWallWidth)));
intersection() {
 render(convexity=10) linear_extrude(height=insideWallFlareThickness) ribbon(path13,thickness=insideWallFlareWidth);
 translate([0,0,-0.01]) linear_extrude(height=insideWallFlareThickness+0.02) polygon(points=path13);
}
path14=scale*[[-133.551,120.900],[-134.207,128.041],[-134.295,131.400],[-134.216,132.681],[-134.031,133.565]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path14,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path15=scale*[[-102.758,128.576],[-103.205,128.338],[-103.518,128.018],[-103.887,127.252],[-104.059,126.405],[-104.030,125.253],[-103.869,124.884],[-103.119,123.885],[-102.845,123.677]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path15,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path16=scale*[[-123.075,133.132],[-122.993,132.626],[-122.749,132.253],[-122.349,132.021],[-121.803,131.938],[-121.356,132.029],[-120.982,132.283],[-120.724,132.658],[-120.625,133.111],[-120.705,133.667],[-120.943,134.110],[-121.307,134.406],[-121.770,134.519],[-122.287,134.421],[-122.700,134.133],[-122.974,133.691],[-123.075,133.132]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path16,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
render(convexity=10) linear_extrude(height=featureHeight) polygon(points=path16);
path17=scale*[[-109.349,133.059],[-109.109,132.359],[-108.818,132.068],[-108.391,132.020],[-108.005,132.178],[-107.830,132.528],[-107.860,133.475],[-107.985,133.774],[-108.183,133.996],[-108.421,134.124],[-108.665,134.140],[-108.928,134.024],[-109.147,133.792],[-109.295,133.464],[-109.349,133.059],[-109.349,133.059]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path17,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
render(convexity=10) linear_extrude(height=featureHeight) polygon(points=path17);
path18=scale*[[-93.894,145.942],[-96.735,139.097]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path18,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path19=scale*[[-139.356,157.566],[-140.131,147.621]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path19,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path20=scale*[[-138.631,104.247],[-138.859,99.818]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path20,thickness=min(maxFeatureThickness,max(0.200,minFeatureThickness)));
path21=scale*[[-106.941,90.411],[-103.973,87.535]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path21,thickness=min(maxFeatureThickness,max(0.008,minFeatureThickness)));
path22=scale*[[-108.559,89.318],[-105.206,87.032]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path22,thickness=min(maxFeatureThickness,max(0.008,minFeatureThickness)));
path23=scale*[[-135.517,88.520],[-137.030,84.671]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path23,thickness=min(maxFeatureThickness,max(0.008,minFeatureThickness)));
path24=scale*[[-133.723,87.776],[-135.711,84.494]];
render(convexity=10) linear_extrude(height=(featureHeight)) ribbon(path24,thickness=min(maxFeatureThickness,max(0.008,minFeatureThickness)));
}

translate([157.725*scale,-84.294*scale,0]) cookieCutter();
