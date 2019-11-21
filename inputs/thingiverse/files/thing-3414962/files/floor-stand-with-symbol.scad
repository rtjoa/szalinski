text = " Taiwan";
font = "Arial Black";
font_size = 5;
line_spacing = 7;

stand_width = 40;
stand_height = 80;
stand_thickness = 4;
joint_spacing = 1;

symbol_source = "DEFAULT"; // [DEFAULT, PNG, UNICODE]

/* [FOR PNG SYMBOL] */
symbol_png = ""; // [image_surface:100x100]

/* [FOR UNICODE SYMBOL] */
symbol_unicode = "X";  
symbol_font = "Webdings";
symbol_font_size = 20;

/**
* shape_taiwan.scad
*
* Returns shape points of Taiwan.
* They can be used with xxx_extrude modules of dotSCAD.
* The shape points can be also used with the built-in polygon module. 
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-shape_taiwan.html
*
**/

function shape_taiwan(h) = [[3.857235,6.240775],[3.790195,6.257785],[3.735955,6.262885],[3.628068,6.245875],[3.595808,6.260195],[3.554288,6.323865],[3.516978,6.457102],[3.507678,6.536102],[3.511878,6.582842],[3.539168,6.637082],[3.489808,6.669342],[2.782860,6.839047],[2.721800,6.861117],[2.697210,6.888317],[2.684410,6.902717],[2.628400,6.942717],[2.610630,6.962087],[2.610630,6.996957],[2.625870,7.021547],[2.642880,7.043527],[2.642880,7.055487],[2.610620,7.065677],[2.563960,7.060577],[2.522270,7.048787],[2.502810,7.041087],[2.448490,7.156471],[2.293188,7.371234],[2.224378,7.425554],[2.056442,7.442484],[1.886737,7.405094],[1.739014,7.328794],[1.637949,7.238004],[1.588680,7.149744],[1.556592,7.070744],[1.544632,7.055504],[1.514903,7.041104],[1.485258,7.018954],[1.536576,6.972504],[1.588252,6.929094],[1.630956,6.862814],[1.665236,6.770334],[1.630956,6.862814],[1.613483,6.803874],[1.577574,6.837214],[1.539493,6.891164],[1.485255,6.873934],[1.438512,6.873934],[1.403813,6.866234],[1.374084,6.851744],[1.280683,6.772824],[1.206821,6.745704],[0.723984,6.656594],[0.586451,6.607414],[0.515200,6.570944],[0.458435,6.521674],[0.393838,6.479224],[0.108666,6.388434],[-0.002506,6.292504],[-0.110307,6.166930],[-0.278327,5.897845],[-0.312266,5.804525],[-0.322462,5.760475],[-0.319942,5.740765],[-0.359780,5.728045],[-0.398773,5.694105],[-0.431113,5.649215],[-0.443073,5.605085],[-0.453170,5.545625],[-0.477762,5.514295],[-0.504966,5.481955],[-0.527025,5.437905],[-0.511698,5.403035],[-0.499737,5.375915],[-0.499737,5.348715],[-0.511683,5.324125],[-0.544022,5.280075],[-0.630518,5.105233],[-0.652506,5.021183],[-0.709523,4.994063],[-0.721317,4.965173],[-0.751047,4.878513],[-0.807895,4.819223],[-0.849502,4.763133],[-0.835106,4.679163],[-0.945350,4.701233],[-1.031930,4.676643],[-1.103181,4.624763],[-1.166852,4.558563],[-1.187240,4.521253],[-1.206789,4.479813],[-1.236433,4.447553],[-1.339268,4.417823],[-1.364617,4.376213],[-1.388443,4.280373],[-1.477465,4.119932],[-1.514775,4.034192],[-1.526736,3.933212],[-1.556382,3.871222],[-1.873894,3.521621],[-1.923078,3.437571],[-1.967211,3.284795],[-2.110553,3.038618],[-2.152244,2.849458],[-2.187028,2.750918],[-2.238738,2.708638],[-2.248098,2.656758],[-2.433130,2.442837],[-2.474820,2.403927],[-2.489980,2.361477],[-2.496810,2.206174],[-2.517270,2.159514],[-2.595258,2.098284],[-2.613115,2.055834],[-2.622375,2.009260],[-2.647053,1.987280],[-2.681835,1.972793],[-2.719147,1.945587],[-2.765889,1.901371],[-2.807410,1.827678],[-2.895759,1.580743],[-2.960103,1.462665],[-3.001707,1.342230],[-3.033963,1.299783],[-3.142610,1.194507],[-3.162234,1.149449],[-3.186829,1.041731],[-3.211421,0.994987],[-3.297915,0.928032],[-3.309876,0.906048],[-3.325036,0.864443],[-3.421048,0.738702],[-3.437974,0.692212],[-3.474525,0.558807],[-3.544093,0.411083],[-3.625533,0.283068],[-3.694342,0.142925],[-3.724072,-0.047077],[-3.716342,-0.135425],[-3.674737,-0.317847],[-3.659482,-0.475761],[-3.623015,-0.539348],[-3.610290,-0.588533],[-3.625545,-0.628538],[-3.649371,-0.659782],[-3.657031,-0.687068],[-3.610289,-0.709975],[-3.610289,-0.738780],[-3.640019,-0.795629],[-3.575422,-0.918676],[-3.640019,-1.128469],[-3.654343,-1.140261],[-3.679021,-1.147841],[-3.679021,-1.147841],[-3.625532,-1.189442],[-3.595888,-1.204600],[-3.583163,-1.251343],[-3.605151,-1.243763],[-3.647598,-1.287811],[-3.684065,-1.344743],[-3.681625,-1.371861],[-3.721377,-1.382049],[-3.745972,-1.409251],[-3.797852,-1.544257],[-3.804582,-1.581567],[-3.817307,-1.611212],[-3.849563,-1.655259],[-3.876767,-1.709581],[-3.866501,-1.758935],[-3.847139,-1.808119],[-3.834343,-1.866652],[-3.853967,-1.906657],[-3.896328,-1.918449],[-3.935323,-1.940517],[-3.945517,-2.002504],[-3.903153,-2.051688],[-3.836870,-2.108458],[-3.836870,-2.108458],[-3.914521,-2.125253],[-3.924856,-2.167465],[-3.802098,-2.217177],[-3.780039,-2.241687],[-3.795366,-2.285987],[-3.841941,-2.302917],[-3.901401,-2.310517],[-3.945534,-2.332497],[-3.945534,-2.332497],[-3.909015,-2.389842],[-3.812282,-2.425988],[-3.748697,-2.453108],[-3.735901,-2.490418],[-3.610322,-2.512488],[-3.514395,-2.526978],[-3.497373,-2.605978],[-3.536452,-2.699208],[-3.610312,-2.751008],[-3.550853,-2.812998],[-3.521966,-2.867318],[-3.474548,-3.171944],[-3.462683,-3.201754],[-3.421078,-3.278054],[-3.410884,-3.312924],[-3.391356,-3.332374],[-3.371827,-3.347614],[-3.361728,-3.367234],[-3.366698,-3.403534],[-3.391374,-3.458024],[-3.391374,-3.504684],[-3.376047,-3.573324],[-3.304796,-3.728795],[-3.228491,-3.847546],[-3.186887,-3.933196],[-3.164732,-4.022386],[-3.181754,-4.086056],[-3.214010,-4.157226],[-3.189418,-4.228476],[-3.137705,-4.293156],[-2.997562,-4.423698],[-2.916122,-4.514578],[-2.856746,-4.625749],[-2.834591,-4.738605],[-2.834591,-4.738605],[-2.844781,-4.765724],[-2.642820,-4.921195],[-2.608122,-4.921195],[-2.580835,-4.911005],[-2.556243,-4.908305],[-2.512194,-4.928765],[-2.477327,-4.950745],[-2.403550,-5.014415],[-2.332216,-5.061155],[-2.176913,-5.134845],[-2.110630,-5.179905],[-2.100531,-5.199445],[-2.086040,-5.258065],[-2.068183,-5.268085],[-2.051256,-5.273285],[-2.001988,-5.302935],[-1.876413,-5.401475],[-1.844157,-5.445525],[-1.778044,-5.595775],[-1.693992,-5.701809],[-1.666872,-5.746109],[-1.359635,-6.536942],[-1.368995,-6.583512],[-1.406305,-6.638002],[-1.415565,-6.684662],[-1.415565,-6.849145],[-1.423225,-6.901025],[-1.423225,-6.930755],[-1.415565,-6.969915],[-1.329997,-7.110732],[-1.349454,-7.218450],[-1.346924,-7.253150],[-1.289990,-7.299890],[-1.239206,-7.315220],[-1.201810,-7.277830],[-1.196750,-7.176849],[-1.073620,-7.206579],[-0.953101,-7.260899],[-0.849593,-7.339819],[-0.778259,-7.442484],[-0.775729,-7.354134],[-0.795186,-7.214159],[-0.797786,-7.086059],[-0.736641,-7.029129],[-0.685014,-6.990139],[-0.645009,-6.898509],[-0.620417,-6.785653],[-0.637343,-5.770625],[-0.612751,-5.521921],[-0.590692,-5.435341],[-0.443136,-5.179899],[-0.371802,-4.923616],[-0.341989,-4.733445],[-0.290360,-4.642825],[-0.167230,-4.487353],[-0.128151,-4.411053],[-0.046711,-4.203955],[-0.014539,-4.162345],[0.027066,-4.142975],[0.191803,-3.960385],[0.441265,-3.795649],[0.515127,-3.726079],[0.588904,-3.632849],[0.620320,-3.581049],[0.640788,-3.531699],[0.643228,-3.487569],[0.633124,-3.391729],[0.640794,-3.351889],[0.689979,-3.293359],[0.903900,-3.113378],[0.923353,-3.070928],[1.083626,-2.845217],[1.116050,-2.753417],[1.162624,-2.554067],[1.233959,-2.423440],[1.261161,-2.335180],[1.278091,-2.300310],[1.310347,-2.266370],[1.384209,-2.212130],[1.416381,-2.179870],[1.490243,-2.027009],[1.504640,-1.879352],[1.502120,-1.724049],[1.526711,-1.549375],[1.558967,-1.455890],[1.598972,-1.379418],[1.706690,-1.236159],[1.741473,-1.160444],[1.982428,0.226167],[2.056374,0.376416],[2.181947,0.989965],[2.277877,1.253155],[2.329587,1.501858],[2.334687,1.601070],[2.347407,1.654466],[2.401727,1.743656],[2.421177,1.797978],[2.418777,1.847247],[2.406057,1.869143],[2.383907,1.883630],[2.361757,1.918497],[2.334727,1.999938],[2.332127,2.071360],[2.354197,2.137470],[2.467980,2.304731],[2.512030,2.492208],[2.556250,2.585528],[2.593560,2.622838],[2.699678,2.699228],[2.711468,2.721378],[2.699678,2.753638],[2.721748,2.784968],[2.792998,2.841898],[2.891448,2.975135],[2.980638,3.060784],[3.000088,3.098174],[3.000088,3.115185],[2.987368,3.137164],[2.972968,3.159234],[2.960248,3.174564],[2.945758,3.201684],[2.953458,3.221135],[2.967858,3.240755],[2.978048,3.267785],[2.984848,3.363795],[2.997568,3.412974],[3.017018,3.447754],[3.034118,3.489355],[3.027318,3.595473],[3.031518,3.644743],[3.140079,3.767706],[3.233479,3.824636],[3.273319,3.861105],[3.265719,3.903556],[3.238519,3.945166],[3.226729,3.989295],[3.233429,4.029045],[3.325149,4.080845],[3.339549,4.166585],[3.317479,4.267581],[3.278399,4.344051],[3.305599,4.363502],[3.347119,4.376222],[3.375256,4.386492],[3.411090,4.397932],[3.398688,4.425132],[3.325137,4.425408],[3.226687,4.487398],[3.172367,4.583238],[3.169767,4.706357],[3.191917,4.767497],[3.194317,4.829397],[3.142607,5.066241],[3.140007,5.179086],[3.147807,5.297090],[3.172397,5.415827],[3.206337,5.519432],[3.253837,5.593292],[3.541528,5.940365],[3.625578,6.014315],[3.945534,6.172153],[3.913274,6.211063],[3.857235,6.240775]] / 15 * h;

/**
* hollow_out.scad
*
* Hollows out a 2D object. 
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-hollow_out.html
*
**/

module hollow_out(shell_thickness) {
    difference() {
        children();
        offset(delta = -shell_thickness) children();
    }
}

/**
* hull_polyline2d.scad
*
* Creates a 2D polyline from a list of `[x, y]` coordinates. 
* As the name says, it uses the built-in hull operation for each pair of points (created by the circle module). 
* It's slow. However, it can be used to create metallic effects for a small $fn, large $fa or $fs.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/hull_polyline2d.html
*
**/

module hull_polyline2d(points, width) {
    half_width = width / 2;
    leng = len(points);
    
    module hull_line2d(index) {
        point1 = points[index - 1];
        point2 = points[index];

        hull() {
            translate(point1) 
                circle(half_width);
            translate(point2) 
                circle(half_width);
        }

        // hook for testing
        test_line_segment(index, point1, point2, half_width);
    }

    module polyline2d_inner(index) {
        if(index < leng) {
            hull_line2d(index);
            polyline2d_inner(index + 1);
        }
    }

    polyline2d_inner(1);
}

// override it to test
module test_line_segment(index, point1, point2, radius) {

}

/**
* pie.scad
*
* Creates a pie (circular sector). You can pass a 2 element vector to define the central angle. Its $fa, $fs and $fn parameters are consistent with the circle module.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-pie.html
*
**/

function __shape_pie(radius, angle) =
    let(
        frags = __frags(radius),
        a_step = 360 / frags,
        leng = radius * cos(a_step / 2),
        angles = __is_vector(angle) ? angle : [0:angle],
        m = floor(angles[0] / a_step) + 1,
        n = floor(angles[1] / a_step),
        edge_r_begin = leng / cos((m - 0.5) * a_step - angles[0]),
        edge_r_end = leng / cos((n + 0.5) * a_step - angles[1]),
        shape_pts = concat(
            [[0, 0], __ra_to_xy(edge_r_begin, angles[0])],
            m > n ? [] : [
                for(i = [m:n]) 
                    let(a = a_step * i) 
                    __ra_to_xy(radius, a)
            ],
            angles[1] == a_step * n ? [] : [__ra_to_xy(edge_r_end, angles[1])]
        )
    ) shape_pts;
    
function __frags(radius) = $fn > 0 ? 
            ($fn >= 3 ? $fn : 3) : 
            max(min(360 / $fa, radius * 6.28318 / $fs), 5);

function __is_vector(value) = !(value >= "") && len(value) != undef;

function __ra_to_xy(r, a) = [r * cos(a), r * sin(a)];
 
module pie(radius, angle) {
    polygon(__shape_pie(radius, angle));
}

/**
* sub_str.scad
*
* Returns a new string that is a substring of the given string.
* 
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-sub_str.html
*
**/ 

function sub_str(t, begin, end, result = "") =
    end == undef ? sub_str(t, begin, len(t)) : (
        begin == end ? result : sub_str(t, begin + 1, end, str(result, t[begin]))
    );

/**
* split_str.scad
*
* Splits the given string around matches of the given delimiting character.
* It depends on the sub_str function so remember to include sub_str.scad.
*
* @copyright Justin Lin, 2017
* @license https://opensource.org/licenses/lgpl-3.0.html
*
* @see https://openhome.cc/eGossip/OpenSCAD/lib-split_str.html
*
**/ 
   
function _split_t_by(idxs, t, ts = [], i = -1) = 
    i == -1 ? _split_t_by(idxs, t, [sub_str(t, 0, idxs[0])], i + 1) : (
        i == len(idxs) - 1 ? concat(ts, sub_str(t, idxs[i] + 1)) : 
            _split_t_by(idxs, t, concat(ts, sub_str(t, idxs[i] + 1, idxs[i + 1])), i + 1)
    );        
 
function split_str(t, delimiter) = 
    len(search(delimiter, t)) == 0 ? 
        [t] : _split_t_by(search(delimiter, t, 0)[0], t);      



module no_bug() {
    $fn = 48;
    r = 10;
    color("black") linear_extrude(stand_thickness / 4) rotate(25) translate([0, -r * 0.175]) union() {
        difference() {
           union() {
                translate([-r, 0]) square([r * 2, r]);
                circle(r);
            }
            hull_polyline2d(points = [[0, r / 2], [0, r]], width = 2);    
        }
        translate([0, r * 1.15]) 
            pie(radius = r / 1.5, angle = [0, 180]);
        rotate(45) 
            hull_polyline2d(points = [[0, -1.5 * r], [0, 1.75 * r]], width = 2);
        rotate(-45) 
            hull_polyline2d(points = [[0, -1.5 * r], [0, 1.75 * r]], width = 2);
        rotate(90) 
            hull_polyline2d(points = [[0, -1.5 * r], [0, 1.5 * r]], width = 2);
    }
    color("red") linear_extrude(stand_thickness / 3) union() {
        hollow_out(shell_thickness = font_size / 2) 
            circle(2 * r);
                rotate(-45) 
        hull_polyline2d(points = [[0, -1.8 * r], [0, 1.8 * r]], width = font_size / 2);
    }
}        
        
module floor_stand_with_symbol(text, font, font_size, symbol_png, symbol_unicode, symbol_font, symbol_font_size, width, height, thickness, joint_spacing, line_spacing) {
    half_w = width / 2;
    half_h = height / 2;
    half_th = thickness / 2;
    half_sc = joint_spacing / 2;

    $fn = 24;

    points = [
        [half_w, -half_h], [width / 2.25, half_h], 
        [-width / 2.25, half_h], [-half_w, -half_h]
    ];

    module multiLine(lines, size = 10, font = "Arial", halign = "left", valign = "baseline", line_spacing = 15, direction = "ltr", language = "en", script = "latin"){
        to = len(lines) - 1;
        inc = line_spacing;
        offset_y = inc * to / 2;
        union(){
            for (i = [0 : to]) {
                translate([0 , -i * inc + offset_y, 0]) 
                    text(lines[i], size, font = font, valign = valign, halign = halign, direction = direction, language = language, script = script);
            }
        }
    }

    module board_base() {
        difference() {
            polygon(points);
            translate([0, -half_h, 0]) 
                scale([0.6, 0.1]) 
                    polygon(points);
        }
    }

    module content() {
        //color("black") 
        translate([0, 0, half_th]) 
            union() {
                color("black") linear_extrude(half_th / 2) 
                    union() {
                        hollow_out(shell_thickness = font_size / 4) 
                            offset(half_w / 10) 
                                scale([0.75, 0.675]) 
                                    polygon(points);
                                
                        translate([0, -half_h / 3, 0]) 
                            multiLine(split_str(text, " "), size = font_size, font = font, line_spacing = line_spacing, valign = "center", halign = "center");
                        
                    } 
                
                if(symbol_source == "DEFAULT") {
                    color("green") translate([0, half_h / 5, 0]) 
                        scale([0.6, 0.6, 1]) 
                            linear_extrude(half_th / 2) polygon(shape_taiwan(half_h * 1.5));
                }
                else if(symbol_source == "UNICODE") {                
                    color("black") linear_extrude(half_th / 2)             
                        translate([0, half_h / 5, 0]) 
                                    text(symbol_unicode, font = symbol_font, size = symbol_font_size, valign = "center", halign = "center");
                } 
                else {
                    symbol_png_size = 100;
                    symbol_png_scale = 0.25; 
          
                    color("black") translate([0, half_h / 5, half_th / 4]) 
                        scale([symbol_png_scale, symbol_png_scale, 1])
                            difference() {       
                                cube([symbol_png_size * 0.99, symbol_png_size  * 0.99, stand_thickness / 4], center = true);                        
                                translate([0, 0, -50])
                                    scale([1, 1, 100]) 
                                        surface(symbol_png, center = true); 

                            }
                    
                }
            }
    }

    module joint_top() {
        linear_extrude(thickness / 4 + half_sc, scale = 0.1) 
                                circle(thickness / 4 + half_sc);
    }

    module stick() {
        linear_extrude(thickness * 0.75) 
                square([width / 12, half_w], center = true);    
    }
    
    module slot_df() {
        translate([0, -half_h - thickness, -half_th]) 
            stick();    
    }

    module board1() {
        difference() {
            union() {
                linear_extrude(thickness, center = true) 
                    difference() {
                        translate([0, -half_h, 0]) 
                            board_base();
                        square([width / 1.5, height / 3], center = true);
                    } 
                rotate([0, 90, 0]) 
                    linear_extrude(width / 2.25 * 2, center = true) 
                        circle(thickness / 2);
            }
            rotate([0, 90, 0]) 
                linear_extrude(width / 1.5, center = true) 
                    circle(thickness, $fn = 24);
                
            // joint            
            translate([half_w / 1.5 , 0, 0])         
                rotate([0, 90, 0]) 
                    joint_top();

            translate([-half_w / 1.5 , 0, 0])  
                rotate([0, -90, 0]) 
                    joint_top();
                        
            slot_df();        
        }
    }

    module board2() {
        difference() {
            union() {
                linear_extrude(thickness, center = true) 
                    union() {
                        difference() {
                            translate([0, -half_h, 0]) 
                                board_base();
                            square([width, height / 3], center = true);
                            

                        }
                        translate([0, -height / 12 - joint_spacing / 4, 0]) 
                            difference() {
                                square([width / 1.5 - joint_spacing, height / 6 + joint_spacing / 2], center = true);
                                square([width / 1.5 - thickness * 2, height / 6], center = true);
                            }
                    }
                rotate([0, 90, 0]) 
                    linear_extrude(width / 1.5 - joint_spacing, center = true) 
                        circle(half_th, $fn = 24);

                // joint
                translate([half_w / 1.5 - half_sc, 0, 0]) 
                    rotate([0, 90, 0]) 
                        joint_top();

                translate([-half_w / 1.5 + half_sc, 0, 0]) 
                    rotate([0, -90, 0]) 
                        joint_top();                
            }
            
            slot_df();
        }
    }

    module ground_df() {
        translate([0, 0, -height - half_th]) 
                linear_extrude(thickness) 
                    square(width, center = true);
    }

    // stick
    translate([width, 0, 0]) 
        stick();

    translate([0, 0, thickness / 2]) 
    rotate([-80, 0, 0]) 
    difference() {
        rotate([80, 0, 0]) union() {
            color("yellow") board1();
            translate([0, -height / 1.8, 0]) content();
        }
        ground_df();
    }

    translate([0, 0, thickness / 2]) 
    rotate([80, 0, 0]) 
    difference() {
        rotate([-80, 0, 0]) rotate(180) union() {
            color("yellow") board2();
            translate([0, -height / 1.8, 0]) content();
        }
        ground_df();
    }
}

floor_stand_with_symbol(text, font, font_size, symbol_png, symbol_unicode, symbol_font, symbol_font_size, stand_width, stand_height, stand_thickness, joint_spacing, line_spacing);

