// TeaClip Customizer
// (C) 2016 Markus H.
//          Based on Bag Clip - PLA Compatible by MasterFX
//          check out http://www.thingiverse.com/thing:330151
//
//          Total OpenSCAD rewrite
//          Sorry for the chaotic script, this is done in a HURRY :D

/* [CLIP] */
// Length (mm)
TOTAL_LENGTH = 92;  // [30:1:150]
// Height (mm)
BASE_HEIGHT = 10;   // [6:1:20]
// Width (mm)
BASE_WIDTH = 4.85;  // [3:0.05:10]
// Helper Tab (Easier opening)
HELPER_TAB = "yes"; // [yes,no]
// Gap (mm) (increase for thicker bags)
GAP = 0.4; // [0:0.1:0.8]
// Printing Angle
OPENING_ANGLE = 10; // [0:5:90]
// Minimum Tolerances
TOLERANCE = 0.3; // [0.2:0.05:0.6]

/* [TEXT] */
// Text Line 1 (Top)
TEXTLINE1="MERRY";
// Text Line 2 (Bottom, leave blank for onle line only)
TEXTLINE2="CHRISTMAS";

/* [FONT] */
// Font Style
FONTNAME="Alfa Slab One"; // [Alfa Slab One, Bevan, Passion One, Ultra]
// Font Size
FONTSIZE=8; // [4:0.5:16]
// Additional Font Spacing
FONTSPACING=0; // [0:0.1:10]

/* [OPTIONS] */
// Render Christmas Trees (Length > 70mm only!)
TREES="yes"; // [yes,no]
// Tree Scale Factor
TREESCALE=1.0; // [0.1:0.1:5]
// Tilt Text Backwards
TEXTSLOPE=10; // [0:1:15]

/* [HIDDEN] */
$fn=30;

BASE_LENGTH = TOTAL_LENGTH-7;

CLIP_LENGTH = 5;
CLIP_WIDTH = 1.5;
SLOT_SIZE = 0.7;
HOOK_NOSE = 3.5 ;

// Render Clip
translate([1.5-TOTAL_LENGTH/2,0.5+BASE_WIDTH,0])
{
  Clip_Part_A(-OPENING_ANGLE);
  Clip_Part_B(0);
}
  
difference() {
    rotate([90-TEXTSLOPE])
    {
      if (TREES=="yes") 
      scale(0.65*TREESCALE)
        translate([0,10,-3.5])
          treeLine(6);

      if (TREES=="yes") TreesNText(0.6);
      if (TREES=="no")  TreesNText(0);

    }

    translate([-50,-10,-10])
      cube([100,30,10]);
}

module TreesNText(TextDistance) 
{
  translate([0,0,-0.3-1+TextDistance])
  linear_extrude(3)
    translate([0,-0.5,0])
    scale([.8,.8,1])
    {
        if (TEXTLINE2 == "") {
          translate([0,FONTSPACING,0])
            text(TEXTLINE1,size=FONTSIZE,font=FONTNAME,valign="bottom",halign="center");
        } else {
          text(TEXTLINE2,size=FONTSIZE,font=FONTNAME,valign="bottom",halign="center");
          translate([0,FONTSIZE+FONTSPACING,0])
            text(TEXTLINE1,size=FONTSIZE,font=FONTNAME,valign="bottom",halign="center");
        }
    }
}

module Clip_Part_B(rotation)
{
    rotate(-rotation)
    translate([-1,(BASE_WIDTH*2)/1.8-(TOLERANCE/2),0])
    difference() 
    {
        union() 
        {
            // Hook
            translate([1+BASE_LENGTH-TOLERANCE+CLIP_LENGTH,-BASE_WIDTH*2,0])
                cube([CLIP_WIDTH/2+SLOT_SIZE+TOLERANCE/2,CLIP_WIDTH,BASE_HEIGHT]);
                
            // Rounded Corner
            difference() 
            {
                translate([1+BASE_LENGTH+CLIP_LENGTH+SLOT_SIZE,-BASE_WIDTH*2+(CLIP_WIDTH),0])
                    cylinder(d=CLIP_WIDTH*2,h=BASE_HEIGHT);
                
                translate([1+BASE_LENGTH+CLIP_LENGTH+SLOT_SIZE-CLIP_WIDTH/1.33,-BASE_WIDTH*2+(CLIP_WIDTH*1.77),-0.5])
                    cylinder(d=CLIP_WIDTH*1.66,h=BASE_HEIGHT+1.0);
            }

            translate([1+BASE_LENGTH+CLIP_LENGTH+SLOT_SIZE,-BASE_WIDTH*2+CLIP_WIDTH,0])
                cube([CLIP_WIDTH,BASE_WIDTH*2+TOLERANCE*3+GAP-CLIP_WIDTH,BASE_HEIGHT]);

            // Hook Nose
            translate([0,GAP,0])
            difference() 
            {
                // Cube+Round
                union() {
                    translate([1+BASE_LENGTH+CLIP_LENGTH-HOOK_NOSE+CLIP_WIDTH,TOLERANCE*3,0])
                        cube([HOOK_NOSE+SLOT_SIZE,HOOK_NOSE/1.5+TOLERANCE*2,BASE_HEIGHT]);
                    
                    translate([1+BASE_LENGTH+CLIP_LENGTH+(HOOK_NOSE/6)+SLOT_SIZE+1.2-HOOK_NOSE*1.55+CLIP_WIDTH+(HOOK_NOSE+CLIP_WIDTH)/2,HOOK_NOSE/1.5+TOLERANCE*2+TOLERANCE*2-.3,0])
                        cylinder(d=HOOK_NOSE/1.55,h=BASE_HEIGHT);
                }
              
                // Slope Cutot
                translate([1+BASE_LENGTH+CLIP_LENGTH-HOOK_NOSE*1.35+CLIP_WIDTH,HOOK_NOSE*1.35+TOLERANCE*2,BASE_HEIGHT/2])
                    rotate(45)
                    cube([HOOK_NOSE*2,HOOK_NOSE*2,BASE_HEIGHT+1.0],center=true);
                
            }
            
            // Cylinder
            translate([1,-(BASE_WIDTH*2)/1.8+(TOLERANCE/2),0])
                cylinder(h=BASE_HEIGHT,d=BASE_WIDTH*1.8+TOLERANCE,center=false);

            difference() 
            {
                translate([1,-BASE_WIDTH*2,0])
                    cube([BASE_LENGTH-TOLERANCE+CLIP_LENGTH,BASE_WIDTH,BASE_HEIGHT]);

                // Slot
                translate([1+BASE_LENGTH,-(BASE_WIDTH*2)+CLIP_WIDTH,-0.5])
                    cube([CLIP_LENGTH+SLOT_SIZE,SLOT_SIZE,BASE_HEIGHT+1.0]);
             
                translate([BASE_LENGTH/2+BASE_WIDTH+1.5, -BASE_WIDTH+(TOLERANCE/2), BASE_HEIGHT/2 ])
                    rotate([45,0,0])
                    cube([BASE_LENGTH-BASE_WIDTH+CLIP_LENGTH+TOLERANCE*2, 1.5+TOLERANCE, 1.5+TOLERANCE],center=true);
            }
        }
        
        // Cylinder Cutout
        translate([1,(-BASE_WIDTH*2)/1.8+(TOLERANCE/2),-0.5])
            cylinder(h=BASE_HEIGHT+1.0,d=(BASE_WIDTH*1.8)-(BASE_WIDTH/2)+TOLERANCE,center=false);

        // Cube/Cylinder Cutout
        color("Blue")    
        translate([1,-BASE_WIDTH/2+(TOLERANCE/2)+TOLERANCE/2,BASE_HEIGHT/2])
            cube([BASE_WIDTH*2.5,BASE_WIDTH+TOLERANCE*2,BASE_HEIGHT/2+TOLERANCE*3],center=true);

    }

}

module Clip_Part_A(rotation) 
{
    //translate([0,-1.5,0])
    rotate(-rotation)
    translate([-1,(BASE_WIDTH*2)/1.8-(TOLERANCE/2)+GAP,0])
    {
        // Base
        difference() 
        {
            translate([1.5+BASE_WIDTH+TOLERANCE*2, -BASE_WIDTH+TOLERANCE/2 ,  0])
                 cube([BASE_LENGTH-BASE_WIDTH+HOOK_NOSE+1-TOLERANCE*3,   BASE_WIDTH , BASE_HEIGHT]);

            translate([1.5+BASE_WIDTH+TOLERANCE*2+
                       BASE_LENGTH-BASE_WIDTH+HOOK_NOSE+1+TOLERANCE*3,
                        -BASE_WIDTH-TOLERANCE*3,
            BASE_HEIGHT/2])
                rotate(-45) 
                cube([HOOK_NOSE+BASE_WIDTH,HOOK_NOSE+BASE_WIDTH,BASE_HEIGHT+1.0], center=true);
        }

        
        if (HELPER_TAB=="yes")
        translate([BASE_LENGTH-BASE_WIDTH*1.5, TOLERANCE/2 , BASE_HEIGHT/1.2])
        rotate([90,0,0])    
            cylinder(r=min(BASE_WIDTH,BASE_HEIGHT)*1,h=BASE_WIDTH/3);


        // Base Lip
        translate([BASE_WIDTH+1.5+TOLERANCE, -BASE_WIDTH+TOLERANCE/2,  BASE_HEIGHT/2-1])
            rotate([45,0,0])
             cube([BASE_LENGTH-BASE_WIDTH, 1.5, 1.5]);

        // Cylinder to Base
        difference() 
        {
            translate([1.5/2,-BASE_WIDTH+TOLERANCE/2,BASE_HEIGHT/4])
                cube([BASE_WIDTH+1.5+TOLERANCE*2, BASE_WIDTH, BASE_HEIGHT/2]);

            translate([0,TOLERANCE/2,BASE_HEIGHT/2])
                rotate(-45)
                cube([BASE_WIDTH-2,BASE_WIDTH-2,BASE_HEIGHT*1.1], center=true);
        }

        // Cylinder
        translate([1,(-BASE_WIDTH*2)/1.8+(TOLERANCE/2)-GAP,BASE_HEIGHT/2])
            cylinder(h=BASE_HEIGHT,d=(BASE_WIDTH*1.7)-(BASE_WIDTH/2)-TOLERANCE,center=true);
    }
}

// Trees
path3374_0_points = [[125.840922,51.643838],[125.385047,48.501016],[124.816513,47.427045],[124.050043,46.640803],[122.010677,45.799809],[119.441716,45.714643],[113.414072,46.758239],[110.304923,47.360220],[107.365242,47.664468],[102.465474,47.741428],[97.533216,48.069096],[87.802402,48.569408],[90.573672,44.502276],[91.691947,42.555088],[91.358236,42.268698],[90.283705,42.382963],[85.475422,43.641018],[83.149881,42.285351],[80.676149,41.591874],[78.097996,41.366797],[75.459190,41.416331],[70.174697,41.564072],[67.616548,41.274699],[65.172822,40.484778],[63.819925,40.183680],[62.633263,40.270058],[61.594043,40.673659],[60.683473,41.324229],[59.173107,43.085267],[57.951820,44.991147],[56.869264,46.479845],[56.333028,46.892118],[55.775095,46.989336],[55.176673,46.701246],[54.518967,45.957595],[52.950532,42.822598],[52.064503,41.420581],[50.548681,40.748325],[48.559553,40.590728],[46.253609,40.732690],[41.317221,41.054879],[38.999754,40.804903],[36.991422,39.994078],[31.869756,40.634314],[27.085804,40.411840],[18.846212,38.959558],[18.625549,40.795452],[18.028687,42.296258],[17.105897,43.482823],[15.907451,44.375992],[14.483621,44.996612],[12.884677,45.365530],[9.362536,45.431641],[5.743200,44.741095],[2.428841,43.460661],[-0.178369,41.757109],[-1.676258,39.797208],[-5.908068,39.871614],[-10.028694,39.585034],[-17.979291,38.210521],[-33.018208,34.227328],[-34.140271,37.005406],[-35.813127,39.065850],[-37.933018,40.530293],[-40.396186,41.520370],[-45.937324,42.563954],[-51.606478,43.169668],[-56.197934,42.903967],[-60.759911,42.919388],[-65.436464,43.309157],[-70.371648,44.166498],[-70.707870,47.209449],[-71.519734,48.860472],[-72.668442,49.364252],[-74.015196,48.965476],[-75.421201,47.908831],[-76.747657,46.439004],[-78.606738,43.238548],[-83.650226,44.101134],[-88.793335,44.586315],[-99.371868,44.646338],[-103.801132,45.452803],[-105.137552,45.391118],[-105.956130,45.063854],[-106.307590,44.504286],[-106.242656,43.745689],[-105.066504,41.764507],[-102.833467,39.386507],[-99.949340,36.877889],[-93.850988,32.533588],[-91.669184,30.540146],[-91.306892,29.933242],[-91.349314,29.558116],[-92.405215,29.418902],[-94.350723,29.953908],[-96.699672,30.994538],[-98.965899,32.372196],[-100.663239,33.918285],[-101.146650,34.701804],[-101.305528,35.464208],[-105.929081,35.199669],[-109.247431,35.635742],[-110.182457,36.234891],[-110.509542,37.151251],[-110.134809,38.432176],[-108.964378,40.125018],[-114.103442,37.441076],[-115.465880,37.065102],[-116.233464,37.221568],[-116.563600,37.826809],[-116.613693,38.797156],[-116.503378,41.498498],[-120.594327,39.831571],[-123.781740,38.480960],[-124.815764,38.360355],[-125.358877,38.842127],[-125.322736,40.100711],[-124.618998,42.310538],[-128.376951,39.010615],[-129.655161,38.361649],[-130.566576,38.368285],[-131.136487,39.021722],[-131.390180,40.313164],[-131.050068,44.774868],[-131.448297,43.773795],[-131.997890,43.104634],[-133.460744,42.552763],[-135.257793,42.700686],[-137.208198,43.129835],[-139.131121,43.421640],[-140.845724,43.157533],[-141.568394,42.686210],[-142.171169,41.918946],[-142.926618,39.287308],[-146.108185,37.883312],[-147.249050,37.731184],[-148.154643,37.877586],[-149.454034,38.861833],[-150.394395,40.427758],[-151.363768,42.167065],[-152.750191,43.671456],[-153.721059,44.207966],[-154.941704,44.532636],[-156.460632,44.594429],[-158.326348,44.342308],[-162.364728,44.131017],[-166.095936,44.591072],[-169.725429,45.026090],[-173.458658,44.739688],[-174.682884,44.792909],[-175.813413,45.144637],[-177.825144,46.491815],[-181.073684,49.998445],[-182.437566,51.150691],[-183.082208,51.356221],[-183.712573,51.230754],[-184.336603,50.711341],[-184.962241,49.735031],[-186.250108,46.159918],[-190.801651,46.810737],[-195.204374,47.080667],[-199.591867,47.440580],[-204.097718,48.361348],[-208.883645,48.322407],[-212.845894,48.129732],[-213.770044,47.587248],[-213.590562,46.540135],[-212.008209,44.832995],[-208.723748,42.310428],[-202.911042,37.576519],[-200.356074,35.275888],[-198.543823,33.270247],[-197.855632,31.747677],[-198.052229,31.226319],[-198.672846,30.896259],[-201.376810,30.904072],[-206.348868,31.959198],[-207.202318,31.082048],[-207.313246,29.986111],[-206.812360,28.721116],[-205.830367,27.336786],[-202.945888,24.409027],[-199.705468,21.600638],[-197.154764,19.309426],[-196.464825,18.482074],[-196.339436,17.933193],[-196.909306,17.712509],[-198.305141,17.869746],[-204.097538,19.516888],[-204.653343,18.697611],[-204.617536,17.665019],[-203.204000,15.142832],[-200.722767,12.316203],[-198.039671,9.551007],[-196.020551,7.213120],[-195.530555,6.318752],[-195.531241,5.668415],[-196.130839,5.307843],[-197.437578,5.282770],[-202.605398,6.422058],[-202.955965,5.449347],[-202.846117,4.401478],[-201.587271,2.162005],[-197.307635,-2.319677],[-195.655226,-4.234917],[-195.250207,-5.039613],[-195.240009,-5.715111],[-195.710156,-6.240977],[-196.746173,-6.596774],[-200.857908,-6.716422],[-199.596894,-7.639318],[-198.425571,-8.916066],[-196.302428,-12.273859],[-192.587178,-20.405817],[-190.796797,-24.150942],[-188.919065,-26.996141],[-187.916461,-27.920481],[-186.854844,-28.426894],[-185.721820,-28.451066],[-184.504998,-27.928682],[-182.966280,-24.934005],[-180.512567,-21.817802],[-174.863064,-15.637069],[-172.668731,-12.780665],[-171.562316,-10.218985],[-171.573554,-9.081187],[-172.044545,-8.056093],[-173.037879,-7.156712],[-174.616148,-6.396052],[-169.749060,-2.961325],[-167.722245,-0.983261],[-166.344316,0.911283],[-165.898578,2.529320],[-166.113812,3.174339],[-166.668331,3.677859],[-168.936877,4.163912],[-172.987518,3.794488],[-167.323267,8.361547],[-165.182491,10.594913],[-163.802724,12.614965],[-163.409048,14.286799],[-163.652332,14.949978],[-164.226545,15.475514],[-166.480298,16.046205],[-170.395388,15.863968],[-169.222813,17.857851],[-167.880915,19.304438],[-166.406627,20.256582],[-164.836881,20.767135],[-163.208609,20.888951],[-161.558742,20.674883],[-158.341953,19.450505],[-155.481971,17.516824],[-153.274252,15.296663],[-152.014252,13.212847],[-151.831977,12.354200],[-151.997428,11.688198],[-150.799989,10.301569],[-150.803290,9.615251],[-151.548470,9.361185],[-152.576669,9.271312],[-153.429027,9.077573],[-153.646685,8.511909],[-152.770782,7.306260],[-150.342458,5.192568],[-147.415066,1.244119],[-145.364950,-1.668864],[-145.138637,-2.457295],[-145.695361,-2.651148],[-149.909548,-0.807502],[-149.083188,-2.116896],[-148.694087,-3.297033],[-148.394516,-5.572074],[-148.067474,-6.818246],[-147.344546,-8.237696],[-146.017446,-9.906060],[-143.877888,-11.898972],[-139.890168,-17.849435],[-137.851585,-20.269509],[-135.838176,-21.945045],[-133.891186,-22.595219],[-132.955485,-22.448037],[-132.051855,-21.939204],[-131.185451,-21.033619],[-130.361428,-19.696177],[-128.861148,-15.585312],[-127.431569,-11.571005],[-125.613273,-8.720420],[-123.629425,-7.013068],[-121.703191,-6.428458],[-120.057739,-6.946101],[-118.916234,-8.545507],[-118.501841,-11.206187],[-119.037728,-14.907652],[-120.202664,-15.630122],[-120.853313,-16.566809],[-121.049640,-17.696286],[-120.851613,-18.997127],[-119.512369,-22.027196],[-117.315318,-25.485605],[-112.266752,-33.001807],[-110.374715,-36.716779],[-109.796644,-38.488491],[-109.543828,-40.174452],[-108.054403,-41.622842],[-106.723699,-42.314105],[-105.530427,-42.334817],[-104.453294,-41.771552],[-103.471009,-40.710883],[-102.562283,-39.239385],[-100.880338,-35.410200],[-97.462332,-26.631155],[-95.385614,-23.066483],[-94.180807,-21.793370],[-92.836648,-20.975172],[-91.625897,-19.135141],[-91.695364,-17.702882],[-92.578190,-16.506595],[-93.807516,-15.374483],[-94.916484,-14.134748],[-95.438234,-12.615593],[-94.905908,-10.645220],[-92.852648,-8.051832],[-92.730257,-6.827855],[-92.278259,-6.143398],[-91.566601,-5.926756],[-90.665227,-6.106225],[-88.573117,-7.366676],[-86.561498,-9.351115],[-85.189936,-11.485907],[-84.919041,-12.430423],[-85.017999,-13.197414],[-85.556754,-13.715175],[-86.605254,-13.912001],[-88.233443,-13.716188],[-90.511268,-13.056032],[-87.170989,-18.975817],[-82.916263,-25.389463],[-78.662084,-32.134056],[-76.821136,-35.579547],[-75.323448,-39.046682],[-70.661731,-33.279985],[-66.044856,-26.921503],[-61.805230,-20.541460],[-58.275258,-14.710082],[-60.084373,-14.652874],[-61.230575,-14.190201],[-61.785120,-13.400521],[-61.819263,-12.362288],[-61.404261,-11.153960],[-60.611370,-9.853994],[-58.176943,-7.292972],[-55.086029,-5.306873],[-53.472530,-4.725561],[-51.908677,-4.523350],[-50.465727,-4.778696],[-49.214934,-5.570056],[-48.227556,-6.975885],[-47.574848,-9.074642],[-45.934197,-10.245281],[-45.999700,-10.567679],[-46.520861,-10.762069],[-51.138675,-10.968644],[-53.551093,-11.225708],[-54.429081,-11.516775],[-54.953363,-11.963473],[-55.022766,-12.601256],[-54.536120,-13.465578],[-51.489998,-16.015662],[-47.766331,-19.070707],[-45.077729,-21.663642],[-44.705960,-22.684522],[-45.294216,-23.467119],[-47.076251,-23.970515],[-50.285818,-24.153792],[-47.826570,-26.727118],[-45.405466,-29.842038],[-40.651654,-36.831574],[-35.972304,-43.392234],[-33.644277,-45.971058],[-31.315338,-47.793852],[-30.153809,-44.522982],[-28.190128,-41.042090],[-23.283054,-33.949454],[-21.053033,-30.587318],[-19.447604,-27.514377],[-18.823454,-24.855433],[-18.990822,-23.720212],[-19.537268,-22.735292],[-20.727289,-22.344853],[-21.227922,-21.647863],[-21.155234,-20.698686],[-20.625289,-19.551683],[-18.657887,-16.881660],[-16.254235,-14.072703],[-14.342852,-11.559720],[-13.861924,-10.550129],[-13.852257,-9.777622],[-14.429918,-9.296563],[-15.710970,-9.161316],[-20.847508,-10.145712],[-19.031603,-6.655720],[-17.164398,-3.926966],[-15.028325,-1.368475],[-12.901360,0.400174],[-11.928161,0.794690],[-11.061479,0.759404],[-10.336061,0.216869],[-9.786656,-0.910362],[-9.448009,-2.699736],[-9.354868,-5.228702],[-6.700933,-10.617893],[-5.927987,-13.005702],[-5.656951,-15.119585],[-5.987249,-16.907490],[-7.018300,-18.317364],[-8.849529,-19.297155],[-11.580358,-19.794812],[-8.435905,-23.438175],[-5.700660,-27.329158],[-1.082069,-35.623199],[3.026857,-44.215369],[7.377562,-52.644102],[8.963367,-52.246724],[10.357940,-51.498348],[11.586363,-50.440505],[12.673718,-49.114730],[14.525553,-45.825515],[16.114105,-41.962969],[19.303988,-33.846952],[21.306636,-30.258014],[23.848632,-27.424812],[26.182593,-25.543419],[27.509148,-23.862612],[27.981001,-22.367217],[27.750859,-21.042062],[26.971424,-19.871972],[25.795401,-18.841776],[22.864412,-17.140372],[25.316162,-10.344403],[28.295169,-2.690942],[30.093694,0.764235],[32.157594,3.602049],[34.531390,5.545255],[35.848412,6.094741],[37.259602,6.316608],[39.344144,4.183503],[41.843774,2.044384],[46.297476,-1.730920],[47.356140,-3.106616],[47.397555,-3.609494],[47.039074,-3.967350],[44.898573,-4.182876],[40.486932,-3.622952],[39.615067,-4.458103],[39.387174,-5.391193],[39.694842,-6.402646],[40.429661,-7.472887],[42.747103,-9.711432],[45.472214,-11.950227],[47.737701,-14.032669],[48.427059,-14.966320],[48.676278,-15.802157],[48.376947,-16.520605],[47.420655,-17.102088],[45.698990,-17.527032],[43.103542,-17.775862],[47.988221,-23.098973],[52.508069,-29.057838],[56.668946,-35.304525],[60.476712,-41.491102],[62.557740,-39.209071],[64.348132,-36.645440],[67.447387,-31.008385],[70.555230,-25.249956],[72.356357,-22.534607],[74.452412,-20.040172],[75.992473,-18.321901],[76.140487,-17.667069],[75.968021,-17.119300],[74.944233,-16.257546],[73.486281,-15.561817],[72.159341,-14.857290],[71.528586,-13.969143],[71.650896,-13.401580],[72.159192,-12.722554],[74.616332,-10.942702],[76.025497,-9.279289],[77.385414,-8.484991],[78.700354,-8.439983],[79.974586,-9.024441],[81.212380,-10.118541],[82.418005,-11.602460],[84.749831,-15.260455],[87.004221,-19.039836],[89.215332,-21.982010],[90.315333,-22.839585],[91.417323,-23.128386],[92.525573,-22.728589],[93.644352,-21.520372],[95.270568,-19.113846],[96.848624,-16.118310],[98.408214,-13.039376],[99.979027,-10.382655],[101.590757,-8.653761],[102.421244,-8.295253],[103.273095,-8.358306],[104.150021,-8.906122],[105.055733,-10.001902],[106.968362,-14.090162],[110.716281,-17.493581],[111.906533,-18.934794],[112.452622,-20.123375],[112.213282,-21.000103],[111.047244,-21.505752],[108.813240,-21.581100],[105.370002,-21.166922],[113.849674,-35.724872],[118.305529,-43.592759],[122.106002,-51.441062],[123.350999,-51.158851],[124.564748,-50.549144],[126.919223,-48.503668],[129.210869,-45.617498],[131.481129,-42.203495],[136.123256,-35.043445],[138.578008,-31.923124],[141.177142,-29.526422],[143.921661,-27.429038],[144.383669,-26.609041],[144.370248,-25.910423],[143.311345,-24.784073],[141.533396,-23.863489],[139.824844,-22.962170],[139.242980,-22.460453],[138.974132,-21.893614],[139.116855,-21.238342],[139.769704,-20.471322],[143.000002,-18.508792],[146.127844,-16.758400],[148.385379,-14.754268],[149.728612,-12.711188],[150.113545,-10.843954],[149.496180,-9.367361],[147.832521,-8.496202],[145.078571,-8.445271],[141.190332,-9.429362],[143.204648,-7.148116],[146.122435,-4.351279],[149.278943,-1.352964],[152.009422,1.532711],[153.649122,3.991632],[153.852195,4.962898],[153.533292,5.709682],[152.609319,6.192719],[150.997182,6.372746],[145.376042,5.666708],[145.071092,6.554405],[145.250829,7.490069],[146.782607,9.388018],[149.407857,11.126003],[152.563059,12.469470],[155.684693,13.183865],[158.209239,13.034636],[159.071505,12.562864],[159.573179,11.787228],[159.643821,10.678409],[159.212992,9.207088],[161.283913,7.098142],[161.588201,6.503890],[161.512378,6.148074],[160.542410,5.946613],[159.018035,6.083491],[157.583276,6.148437],[157.100760,6.025726],[156.882158,5.731182],[157.558705,4.421455],[160.256942,1.808988],[167.552045,-7.415082],[168.468927,-8.991307],[168.516253,-9.432799],[168.222814,-9.585718],[166.413586,-8.853362],[162.641122,-6.449292],[164.032317,-8.300570],[164.270046,-9.530185],[163.785004,-10.355809],[163.007890,-10.995113],[162.369399,-11.665767],[162.300228,-12.585442],[163.231073,-13.971810],[165.592632,-16.042542],[167.937584,-18.132483],[170.335520,-21.305533],[175.163894,-28.840680],[177.531107,-32.172637],[179.824854,-34.527421],[180.934299,-35.177414],[182.013523,-35.389963],[183.058575,-35.100683],[184.065502,-34.245192],[192.448627,-21.025517],[196.367816,-14.296346],[197.878787,-11.171551],[198.945712,-8.309332],[197.011103,-9.600227],[195.603059,-10.248579],[194.672385,-10.324647],[194.169885,-9.898692],[194.046363,-9.040973],[194.252623,-7.821751],[195.457705,-4.579835],[197.391565,-0.735024],[199.660636,3.150603],[203.630142,8.795988],[200.047163,7.567142],[197.460611,6.714643],[196.765861,6.948678],[196.590057,7.899782],[197.023145,9.775619],[198.155072,12.783848],[202.988277,17.900915],[208.657680,23.810085],[210.499993,26.230914],[210.944509,27.162500],[210.984201,27.852814],[210.553770,28.260317],[209.587919,28.343469],[205.788762,27.370558],[208.473479,30.823219],[208.763933,31.617906],[208.504119,31.920984],[206.786692,31.440779],[204.227212,30.159532],[201.731690,28.854170],[200.206138,28.301621],[200.090230,28.550441],[200.556568,29.278811],[203.688992,32.562668],[206.212344,34.532637],[208.825009,37.044867],[211.184103,39.720872],[212.946742,42.182163],[213.770044,44.050253],[213.722293,44.643570],[213.311126,44.946654],[211.227103,44.492879],[207.175092,42.310438],[204.397960,40.533760],[203.760542,40.417599],[203.511962,40.705797],[203.845531,42.164001],[204.727099,44.245820],[205.485097,46.288705],[205.607892,47.088501],[205.447957,47.630106],[204.921346,47.830704],[203.944112,47.607474],[200.301992,45.558258],[195.794896,43.473665],[194.501967,43.156575],[193.750510,43.305656],[193.466318,43.907935],[193.575187,44.950438],[194.675282,48.304218],[190.441636,44.992173],[188.665102,44.016701],[187.234081,43.669445],[186.237565,44.081290],[185.764544,45.383124],[185.904010,47.705831],[186.744952,51.180298],[185.050619,49.334958],[183.683186,48.511334],[182.485992,48.442079],[181.302379,48.859846],[178.349256,50.087054],[176.266428,50.361801],[173.570542,50.054178],[173.079646,47.524226],[171.690763,45.453783],[169.659856,43.943945],[167.242885,43.095805],[164.695812,43.010456],[162.274600,43.788993],[160.235209,45.532509],[159.438685,46.797726],[158.833602,48.342098],[157.936796,46.504749],[156.937401,45.164934],[155.847097,44.260557],[154.677564,43.729526],[152.147531,43.539119],[149.440742,44.096958],[146.650638,44.906290],[143.870658,45.470359],[141.194243,45.292410],[139.924072,44.769943],[138.714832,43.875688],[136.762412,43.533019],[135.243485,43.571329],[134.097954,43.932642],[133.265722,44.558981],[132.300768,46.374835],[131.867844,48.555082],[131.486173,50.635915],[130.674979,52.153524],[129.958068,52.556180],[128.953484,52.644102],[125.840912,51.643838],[125.840922,51.643838],[96.307622,39.720158],[95.692176,37.849473],[95.194120,37.238587],[94.842679,37.524841],[94.667080,38.345577],[94.960311,40.139858],[95.487594,40.388085],[96.307622,39.720158],[96.307622,39.720158],[-41.339638,36.096648],[-40.612170,34.143472],[-40.674112,33.601588],[-40.948509,33.303264],[-41.920676,33.298565],[-43.100690,33.851917],[-44.060573,34.685861],[-44.372345,35.522936],[-43.608027,36.085685],[-41.339638,36.096648],[-41.339638,36.096648],[-112.360238,31.987238],[-113.540740,31.516312],[-114.125686,31.636829],[-114.244210,32.120344],[-114.025448,32.738408],[-113.598534,33.262577],[-113.092604,33.464403],[-112.636794,33.115439],[-112.360238,31.987238],[-112.360238,31.987238],[-159.884938,30.351228],[-156.855485,28.305957],[-156.251674,27.676111],[-156.155113,27.269802],[-157.183671,27.012835],[-159.341005,27.305123],[-164.641398,28.617747],[-167.255078,29.368228],[-165.389674,30.370719],[-163.521471,31.580348],[-162.594779,31.929262],[-161.677537,31.929668],[-160.773129,31.448134],[-159.884938,30.351228],[-159.884938,30.351228],[109.436742,28.507428],[107.626198,27.111485],[106.488899,26.574068],[105.946873,26.665334],[105.922145,27.155441],[106.336741,27.814546],[107.112689,28.412807],[108.172014,28.720382],[109.436742,28.507428],[109.436742,28.507428],[41.667832,25.057548],[43.109377,23.580861],[43.195322,23.190898],[42.956587,22.994180],[41.800695,23.063458],[40.232932,23.554646],[38.844532,24.233697],[38.226727,24.866563],[38.970750,25.219196],[41.667832,25.057548],[41.667832,25.057548],[153.368302,25.389798],[154.067728,23.740668],[153.931358,23.287586],[153.555270,23.042203],[152.336952,23.054661],[150.918799,23.538300],[149.806833,24.253375],[149.507079,24.960145],[150.525561,25.418867],[153.368302,25.389798],[153.368302,25.389798],[-155.941168,23.529698],[-154.408955,21.782825],[-154.343263,21.362329],[-154.634514,21.189277],[-155.957846,21.421944],[-157.718953,22.153718],[-159.257836,23.057490],[-159.914499,23.806150],[-159.705748,24.020092],[-159.028942,24.072589],[-155.941168,23.529698],[-155.941168,23.529698],[-15.449898,19.019168],[-16.206119,17.655506],[-17.160269,17.054640],[-18.105351,17.029980],[-18.834370,17.394938],[-19.140330,17.962925],[-18.816235,18.547352],[-17.655090,18.961629],[-15.449898,19.019168],[-15.449898,19.019168],[35.054602,17.019818],[40.288377,13.993081],[42.505282,12.306426],[44.081502,10.774372],[44.736512,9.599511],[44.630899,9.209337],[44.189788,8.984434],[42.160806,9.131736],[38.369042,10.244008],[36.915819,11.729865],[35.178052,12.447369],[31.921555,12.795208],[30.939158,13.034492],[30.744886,13.723316],[31.606905,15.166153],[33.793382,17.667478],[35.054602,17.019818],[35.054602,17.019818],[-50.242128,16.357118],[-50.521568,15.932058],[-50.816928,15.964586],[-51.263886,16.730123],[-51.199965,17.309158],[-50.242128,16.357118],[-50.242128,16.357118],[108.294812,12.814478],[111.175612,9.544736],[110.956349,9.398329],[109.986214,9.824466],[106.860039,11.135067],[105.237356,11.389882],[103.930512,10.957938],[103.721570,12.354322],[103.852837,13.481459],[104.261992,14.307641],[104.886712,14.801162],[105.664677,14.930314],[106.533563,14.663389],[107.431048,13.968680],[108.294812,12.814478],[108.294812,12.814478],[-86.345098,12.848278],[-86.722550,12.246660],[-86.992158,12.160715],[-87.207845,12.848278],[-86.992158,13.535842],[-86.722550,13.449896],[-86.345098,12.848278],[-86.345098,12.848278],[74.952082,10.064428],[75.095506,9.380785],[74.901941,9.231505],[74.095867,9.857965],[73.717901,10.587656],[74.952082,10.064428],[74.952082,10.064428],[-15.039028,6.039818],[-14.666326,5.244822],[-14.665090,4.558272],[-15.512439,3.514540],[-17.051930,2.916678],[-18.754419,2.772745],[-20.090763,3.090797],[-20.456272,3.425585],[-20.531816,3.878892],[-19.548436,5.145086],[-16.611478,6.897438],[-15.912518,6.778188],[-15.039028,6.039818],[-15.039028,6.039818],[-15.039028,6.039818],[-51.083088,4.728768],[-48.646079,3.054761],[-48.448048,2.493355],[-48.777809,2.098607],[-50.563138,1.757863],[-53.086929,1.930085],[-55.434043,2.512829],[-56.689341,3.403652],[-56.621579,3.932579],[-55.937685,4.500110],[-52.263938,5.699758],[-51.083088,4.728768],[-51.083088,4.728768],[106.899992,0.273958],[109.933806,-2.031959],[111.543068,-3.864270],[111.969987,-5.195144],[111.456770,-5.996753],[110.245626,-6.241266],[108.578765,-5.900853],[106.698394,-4.947685],[104.846722,-3.353932],[104.630175,-2.478079],[103.961266,-2.419332],[102.008832,-3.362480],[101.096539,-3.669038],[100.474351,-3.402027],[100.327883,-2.213777],[100.842752,0.243378],[102.506995,2.953832],[103.114035,3.522783],[103.671074,3.626523],[104.935301,2.615292],[106.899992,0.273978],[106.899992,0.273958],[81.613422,-2.878732],[79.778213,-1.563192],[78.417813,-1.014189],[77.383264,-1.047675],[76.525607,-1.479603],[74.745137,-2.802599],[73.524406,-3.325573],[71.884732,-3.510802],[74.612061,0.375154],[75.719531,1.503862],[76.753487,2.026943],[77.786893,1.897311],[78.892709,1.067878],[81.613422,-2.878732],[81.613422,-2.878732],[-85.301158,0.406108],[-85.118660,-0.571866],[-85.554668,-0.731874],[-87.149473,0.324921],[-87.741907,1.003178],[-87.820120,1.422310],[-87.100931,1.313044],[-85.301158,0.406108],[-85.301158,0.406108],[-122.757068,-0.098432],[-123.337844,-3.572337],[-124.011218,-4.807036],[-124.342233,-4.779474],[-124.647922,-4.425859],[-125.118690,-3.052138],[-125.294256,-1.309203],[-125.045351,0.179614],[-124.721328,0.633937],[-124.242711,0.790981],[-123.593344,0.572831],[-122.757068,-0.098432],[-122.757068,-0.098432],[-57.114748,-0.142932],[-57.098442,-1.281563],[-57.848013,-1.751126],[-58.982852,-1.723492],[-60.122349,-1.370535],[-60.885896,-0.864128],[-60.892884,-0.376143],[-59.762705,-0.078453],[-57.114748,-0.142932],[-57.114748,-0.142932],[-57.114748,-0.142932]];
path3374_0_paths = [[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504,505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566,567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601,602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639,640,641,642,643,644,645,646,647,648,649,650,651,652,653,654,655,656,657,658,659,660,661,662,663,664,665,666,667,668,669,670,671,672,673,674,675,676,677,678,679,680,681,682,683,684,685,686,687,688,689,690,691,692,693,694,695,696,697,698,699,700,701,702,703,704,705,706,707,708,709,710],
				[711,712,713,714,715,716,717,718,719],
				[720,721,722,723,724,725,726,727,728,729,730],
				[731,732,733,734,735,736,737,738,739,740],
				[741,742,743,744,745,746,747,748,749,750,751,752,753,754,755],
				[756,757,758,759,760,761,762,763,764,765],
				[766,767,768,769,770,771,772,773,774,775,776],
				[777,778,779,780,781,782,783,784,785,786,787],
				[788,789,790,791,792,793,794,795,796,797,798,799],
				[800,801,802,803,804,805,806,807,808,809],
				[810,811,812,813,814,815,816,817,818,819,820,821,822,823,824,825,826,827],
				[828,829,830,831,832,833,834],
				[835,836,837,838,839,840,841,842,843,844,845,846,847,848,849,850],
				[851,852,853,854,855,856,857,858],
				[859,860,861,862,863,864,865],
				[866,867,868,869,870,871,872,873,874,875,876,877,878,879,880],
				[881,882,883,884,885,886,887,888,889,890,891,892,893],
				[894,895,896,897,898,899,900,901,902,903,904,905,906,907,908,909,910,911,912,913,914,915],
				[916,917,918,919,920,921,922,923,924,925,926,927,928,929,930],
				[931,932,933,934,935,936,937,938,939],
				[940,941,942,943,944,945,946,947,948,949,950,951,952],
				[953,954,955,956,957,958,959,960,961,962,963]];

module treeLine(h){
  scale([0.282, -0.282, 1])
  union()  {
    linear_extrude(height=h)
      polygon(path3374_0_points, path3374_0_paths);
  }
}
