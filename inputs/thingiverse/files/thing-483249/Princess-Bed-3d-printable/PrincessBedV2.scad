//----------------------------------------------------------------------------
//	Filename:	PrincessBedV2.scad
//	Author:		Robert H. Morrison
//	Date:		Friday, 10 Oct 2014
//
//	A conversion of the laser cut Princess Bed found on Thingiverse as
//	(http://www.thingiverse.com/thing:443720) to be 3d parted w/o support!
//  V2 now includes the engravings on the Head, Foot and Side boards.
//----------------------------------------------------------------------------

part = 8;  //[1:BED_Head,2:BED_Foot,4:BED_Bottom,8:Complete BED]

// Module names are of the form poly_<inkscape-path-id>().  As a result,
// you can associate a polygon in this OpenSCAD program with the corresponding
// SVG element in the Inkscape document by looking for the XML element with
// the attribute id="inkscape-path-id".

module offset_shell(thickness = 0.5) {
  difference() {
    render() {
      minkowski() {
        children();
        cube([2 * thickness, 2 * thickness, 2 * thickness], center=true);
      }
    }
    translate([0, 0, -5 * thickness]) scale([1, 1, 100])
      children();
  }
}

// fudge value is used to ensure that subtracted solids are a tad taller
// in the z dimension than the polygon being subtracted from.  This helps
// keep the resulting .stl file manifold.
fudge = 0.1;

module poly_boxinnerclosetab(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-168.307085,-83.267715],[-178.937005,-83.267715],[-178.937005,-108.070865],[-154.133855,-108.070865],[-154.133855,-97.440945],[-154.133855,-97.440945],[-139.960635,-97.440945],[-139.960635,-108.070865],[-125.787405,-108.070865],[-125.787405,-97.440945],[-111.614175,-97.440945],[-111.614175,-108.070865],[-97.440945,-108.070865],[-97.440945,-97.440945],[-83.267715,-97.440945],[-83.267715,-108.070865],[-69.094485,-108.070865],[-69.094485,-97.440945],[-54.921255,-97.440945],[-54.921255,-108.070865],[-40.748035,-108.070865],[-40.748035,-97.440945],[-26.574805,-97.440945],[-26.574805,-108.070865],[-12.401575,-108.070865],[12.401575,-108.070865],[26.574805,-108.070865],[26.574805,-97.440945],[40.748025,-97.440945],[40.748025,-108.070865],[54.921255,-108.070865],[54.921255,-97.440945],[69.094485,-97.440945],[69.094485,-108.070865],[83.267715,-108.070865],[83.267715,-97.440945],[97.440945,-97.440945],[97.440945,-108.070865],[111.614175,-108.070865],[111.614175,-97.440945],[125.787405,-97.440945],[125.787405,-108.070865],[139.960625,-108.070865],[139.960625,-97.440945],[154.133855,-97.440945],[154.133855,-97.440945],[154.133855,-108.070865],[178.937005,-108.070865],[178.937005,-83.267715],[168.307085,-83.267715],[168.307085,-83.267715],[168.307085,-69.094495],[178.937005,-69.094495],[178.937005,-54.921265],[168.307085,-54.921265],[168.307085,-40.748035],[178.937005,-40.748035],[178.937005,-26.574805],[168.307085,-26.574805],[168.307085,-12.401575],[178.937005,-12.401575],[178.937005,12.401575],[168.307085,12.401575],[168.307085,26.574795],[178.937005,26.574795],[178.937005,40.748025],[168.307085,40.748025],[168.307085,54.921255],[178.937005,54.921255],[178.937005,69.094485],[168.307085,69.094485],[168.307085,83.267715],[168.307085,83.267715],[178.937005,83.267715],[178.937005,108.070865],[154.133855,108.070865],[154.133855,97.440945],[154.133855,97.440945],[139.960625,97.440945],[139.960625,108.070865],[125.787405,108.070865],[125.787405,97.440945],[111.614175,97.440945],[111.614175,108.070865],[97.440945,108.070865],[97.440945,97.440945],[83.267715,97.440945],[83.267715,108.070865],[69.094485,108.070865],[69.094485,97.440945],[54.921255,97.440945],[54.921255,108.070865],[40.748025,108.070865],[40.748025,97.440945],[26.574805,97.440945],[26.574805,108.070865],[12.401575,108.070865],[-12.401575,108.070865],[-26.574805,108.070865],[-26.574805,97.440945],[-40.748035,97.440945],[-40.748035,108.070865],[-54.921255,108.070865],[-54.921255,97.440945],[-69.094485,97.440945],[-69.094485,108.070865],[-83.267715,108.070865],[-83.267715,97.440945],[-97.440945,97.440945],[-97.440945,108.070865],[-111.614175,108.070865],[-111.614175,97.440945],[-125.787405,97.440945],[-125.787405,108.070865],[-139.960635,108.070865],[-139.960635,97.440945],[-154.133855,97.440945],[-154.133855,97.440945],[-154.133855,108.070865],[-178.937005,108.070865],[-178.937005,83.267715],[-168.307085,83.267715],[-168.307085,83.267715],[-168.307085,69.094485],[-178.937005,69.094485],[-178.937005,54.921255],[-168.307085,54.921255],[-168.307085,40.748025],[-178.937005,40.748025],[-178.937005,26.574795],[-168.307085,26.574795],[-168.307085,12.401575],[-178.937005,12.401575],[-178.937005,-12.401575],[-168.307085,-12.401575],[-168.307085,-26.574805],[-178.937005,-26.574805],[-178.937005,-40.748035],[-168.307085,-40.748035],[-168.307085,-54.921265],[-178.937005,-54.921265],[-178.937005,-69.094495],[-168.307085,-69.094495],[-168.307085,-83.267715]]);
  }
}

module BottomBoard()
{
	poly_boxinnerclosetab(3);
}

module poly_path4556(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[60.251846,-108.593750],[55.176744,-107.990098],[50.280703,-106.794455],[42.658096,-104.093750],[39.143445,-43.918262],[37.724195,-25.418366],[36.275932,-13.017336],[35.481297,-8.722717],[34.607862,-5.495400],[33.631775,-3.182913],[32.529188,-1.632785],[31.276251,-0.692543],[29.849114,-0.209716],[26.376846,-0.006420],[29.849114,0.196901],[31.276251,0.679787],[32.529188,1.620145],[33.631775,3.170465],[34.607862,5.483237],[35.481297,8.710953],[36.275932,13.006101],[37.724195,25.408661],[39.143445,43.910839],[42.658096,104.093750],[47.814346,106.093750],[51.701202,107.196928],[55.776822,108.055976],[59.738391,108.535474],[63.283096,108.500000],[66.086031,107.912341],[68.033096,106.906250],[69.355166,105.427565],[70.283096,102.781250],[70.536132,100.764441],[70.529401,98.217057],[69.553546,91.487480],[66.989340,82.506351],[62.470596,71.187500],[58.912943,62.819543],[55.641289,54.253358],[49.903532,36.699985],[45.152431,18.874744],[41.283096,1.125000],[41.283096,-1.125000],[45.151976,-18.877405],[49.902182,-36.700240],[55.639720,-54.251080],[58.911865,-62.817494],[62.470596,-71.187500],[65.134578,-77.496013],[67.195360,-83.132113],[68.710132,-88.110031],[69.736088,-92.444000],[70.330420,-96.148250],[70.550320,-99.237012],[70.452981,-101.724519],[70.095596,-103.625000],[68.994422,-105.997027],[67.408096,-107.312500],[64.974514,-108.215040],[61.595596,-108.593750],[60.251846,-108.593750]]);
  }
}

module poly_path4445(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
	   linear_extrude(height=h)
		 polygon([[-76.404404,-125.062500],[-76.404404,-96.718750],[-72.741552,-96.561050],[-69.472884,-96.112776],[-66.547340,-95.411162],[-63.913861,-94.493444],[-59.318859,-92.158640],[-55.279404,-89.406250],[-55.279404,89.406250],[-59.318859,92.158640],[-63.913861,94.493444],[-66.547340,95.411162],[-69.472884,96.112776],[-72.741552,96.561050],[-76.404404,96.718750],[-76.404404,125.062500],[-72.385934,124.871582],[-68.841444,124.332031],[-65.702148,123.493652],[-62.899262,122.406250],[-58.027580,119.683594],[-53.676119,116.562500],[-49.294600,113.441406],[-44.332744,110.718750],[-41.462227,109.631348],[-38.240272,108.792969],[-34.598092,108.253418],[-30.466904,108.062500],[-30.466904,97.437500],[-30.466904,83.250000],[-19.841904,83.250000],[-19.841904,97.437500],[-19.841904,108.062500],[-5.654404,108.062500],[-5.654404,97.437500],[8.501846,97.437500],[8.501846,108.062500],[22.689346,108.062500],[22.689346,97.437500],[36.876846,97.437500],[36.876846,108.062500],[39.470469,109.198627],[46.044937,111.607345],[50.259488,112.820335],[54.790650,113.789163],[59.412222,114.326393],[63.898006,114.244587],[68.021800,113.356311],[69.877263,112.551172],[71.557404,111.474126],[73.033948,110.101744],[74.278619,108.410597],[75.263143,106.377254],[75.959244,103.978286],[76.338648,101.190264],[76.373080,97.989758],[76.034264,94.353338],[75.293925,90.257575],[74.123789,85.679039],[72.495581,80.594301],[67.751846,68.812500],[64.284480,60.653857],[61.088464,52.279100],[55.464759,35.060374],[50.789285,17.514585],[46.970596,0.000000],[50.788783,-17.517120],[55.463278,-35.060321],[61.086744,-52.276487],[64.283299,-60.651583],[67.751846,-68.812500],[70.528045,-75.346788],[72.725417,-81.258374],[74.377850,-86.575360],[75.519234,-91.325852],[76.183456,-95.537953],[76.404404,-99.239768],[76.215969,-102.459399],[75.652037,-105.224951],[74.746498,-107.564529],[73.533239,-109.506235],[72.046150,-111.078174],[70.319120,-112.308450],[68.386035,-113.225166],[66.280786,-113.856427],[61.689346,-114.375000],[57.395652,-114.157004],[53.069897,-113.466909],[45.067544,-111.288294],[39.172967,-109.074907],[36.876846,-108.062500],[36.876846,-97.437500],[22.689346,-97.437500],[22.689346,-108.062500],[8.501846,-108.062500],[8.501846,-97.437500],[-5.654404,-97.437500],[-5.654404,-108.062500],[-19.841904,-108.062500],[-19.841904,-97.437500],[-19.841904,-83.281250],[-30.466904,-83.281250],[-30.466904,-108.062500],[-34.598092,-108.253418],[-38.240272,-108.792969],[-41.462227,-109.631348],[-44.332744,-110.718750],[-49.294600,-113.441406],[-53.676119,-116.562500],[-58.027580,-119.683594],[-62.899262,-122.406250],[-65.702148,-123.493652],[-68.841444,-124.332031],[-72.385934,-124.871582],[-76.404404,-125.062500]]);
  }
}

module FootBoard()
{
	difference()
	{
		poly_path4445(3);
		translate([0,0,2.6])
			union()
			{
				offset_shell()
					poly_path4556(3);
			}
	}
}

module poly_path4449(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    difference()
    {
       linear_extrude(height=h)
         polygon([[-78.609375,-39.375000],[-87.159988,-38.897336],[-95.609890,-37.803215],[-103.998299,-36.265418],[-112.364434,-34.456731],[-129.186761,-30.717820],[-137.721391,-29.133163],[-146.390625,-27.968750],[-168.296875,-27.968750],[-178.921875,-27.968750],[-178.921875,-13.781250],[-168.296875,-13.781250],[-168.296875,0.406250],[-178.921875,0.406250],[-178.921875,14.562500],[-168.296875,14.562500],[-168.296875,28.750000],[-154.140625,28.750000],[-154.140625,39.375000],[-139.953125,39.375000],[-139.953125,28.750000],[-125.796875,28.750000],[-125.796875,39.375000],[-111.609375,39.375000],[-111.609375,28.750000],[-97.453125,28.750000],[-97.453125,39.375000],[-83.265625,39.375000],[-83.265625,28.750000],[-69.109375,28.750000],[-69.109375,39.375000],[-54.921875,39.375000],[-54.921875,28.750000],[-40.734375,28.750000],[-40.734375,39.375000],[-26.578125,39.375000],[-26.578125,28.750000],[-12.390625,28.750000],[12.390625,28.750000],[26.578125,28.750000],[26.578125,39.375000],[40.734375,39.375000],[40.734375,28.750000],[54.921875,28.750000],[54.921875,39.375000],[69.109375,39.375000],[69.109375,28.750000],[83.265625,28.750000],[83.265625,39.375000],[97.453125,39.375000],[97.453125,28.750000],[111.609375,28.750000],[111.609375,39.375000],[125.796875,39.375000],[125.796875,28.750000],[139.953125,28.750000],[139.953125,39.375000],[154.140625,39.375000],[154.140625,28.750000],[168.296875,28.750000],[168.296875,14.562500],[178.921875,14.562500],[178.921875,0.406250],[168.296875,0.406250],[168.296875,-13.781250],[178.921875,-13.781250],[178.921875,-27.968750],[168.296875,-27.968750],[146.390625,-27.968750],[139.473465,-28.856346],[132.646518,-30.032594],[119.184060,-32.902190],[105.844843,-35.879827],[92.470460,-38.267795],[85.720579,-39.022618],[78.902504,-39.368382],[71.996434,-39.217873],[64.982568,-38.483878],[57.841105,-37.079181],[50.552244,-34.916570],[43.096184,-31.908831],[35.453125,-27.968750],[32.283489,-25.950272],[29.746507,-23.906242],[27.813131,-21.846792],[26.454313,-19.782055],[25.641005,-17.722164],[25.344159,-15.677252],[25.534728,-13.657453],[26.183664,-11.672899],[27.261919,-9.733723],[28.740445,-7.850058],[32.782120,-4.289794],[38.076308,-1.073170],[44.390625,1.718750],[35.363794,3.614213],[25.900420,5.006036],[16.057148,5.863592],[5.890625,6.156250],[-6.366784,5.732020],[-18.135654,4.493721],[-29.313259,2.492936],[-39.796875,-0.218750],[-34.643776,-3.029192],[-30.456144,-6.150724],[-27.409835,-9.521843],[-26.369632,-11.281780],[-25.680706,-13.081051],[-25.365040,-14.911969],[-25.444614,-16.766846],[-25.941412,-18.637995],[-26.877416,-20.517728],[-28.274607,-22.398358],[-30.154967,-24.272196],[-32.540479,-26.131556],[-35.453125,-27.968750],[-41.162330,-30.994188],[-46.766021,-33.490564],[-52.272001,-35.493886],[-57.688074,-37.040162],[-63.022044,-38.165404],[-68.281715,-38.905618],[-73.474891,-39.296813],[-78.609375,-39.375000]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[-78.484375,-29.718750],[-69.313644,-29.324210],[-64.689596,-28.685903],[-60.009196,-27.703898],[-55.249522,-26.340936],[-50.387650,-24.559762],[-45.400659,-22.323118],[-40.265625,-19.593750],[-36.580439,-17.038563],[-35.140625,-15.500000],[-35.960031,-14.549184],[-37.977010,-12.729440],[-41.192984,-10.466851],[-45.609375,-8.187500],[-51.182201,-6.187053],[-57.411016,-4.627829],[-64.050055,-3.548767],[-70.853555,-2.988806],[-77.575751,-2.986885],[-83.970879,-3.581943],[-89.793175,-4.812918],[-94.796875,-6.718750],[-98.261702,-8.693913],[-100.703125,-10.468750],[-99.291155,-12.360632],[-98.389336,-14.506038],[-98.026188,-16.804769],[-98.230232,-19.156628],[-98.998039,-21.388970],[-100.262689,-23.342608],[-101.957459,-24.937537],[-104.015625,-26.093750],[-91.086091,-28.583380],[-84.742709,-29.376011],[-78.484375,-29.718750]]);
       translate([0, 0, -fudge])
         linear_extrude(height=h+2*fudge)
           polygon([[76.203125,-29.718750],[78.484375,-29.718750],[84.742709,-29.376011],[91.086091,-28.583380],[104.015625,-26.093750],[101.957459,-24.937537],[100.262689,-23.342608],[98.998039,-21.388970],[98.230232,-19.156628],[98.026188,-16.804769],[98.389336,-14.506038],[99.291155,-12.360632],[100.703125,-10.468750],[98.261703,-8.693913],[94.796875,-6.718750],[89.793175,-4.812918],[83.970879,-3.581943],[77.575751,-2.986885],[70.853555,-2.988806],[64.050055,-3.548767],[57.411016,-4.627829],[51.182201,-6.187053],[45.609375,-8.187500],[41.192984,-10.466851],[37.977010,-12.729440],[35.960031,-14.549184],[35.140625,-15.500000],[36.580439,-17.038563],[40.265625,-19.593750],[45.084678,-22.167354],[49.772984,-24.305855],[54.349221,-26.039949],[58.832069,-27.400335],[63.240204,-28.417710],[67.592307,-29.122773],[76.203125,-29.718750]]);
    }
  }
}

module poly_path4740(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[44.396975,1.730870],[50.776720,3.817215],[57.628088,5.433118],[64.780792,6.519207],[72.064549,7.016114],[79.309072,6.864467],[86.344078,6.004895],[92.999281,4.378030],[99.104395,1.924500],[104.009933,-0.793542],[107.785341,-3.429529],[110.506116,-5.949901],[112.247754,-8.321101],[113.085750,-10.509569],[113.095600,-12.481748],[112.352799,-14.204079],[110.932845,-15.643004],[108.911232,-16.764963],[106.363457,-17.536399],[103.365014,-17.923752],[99.991401,-17.893465],[96.318113,-17.411979],[92.420645,-16.445735],[88.374494,-14.961175],[84.255155,-12.924740]]);
  }
}

module poly_path4759(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-39.763875,-0.228780],[-46.267841,2.408650],[-53.485621,4.527306],[-61.190808,6.048250],[-69.156996,6.892545],[-77.157781,6.981255],[-84.966756,6.235442],[-92.357516,4.576169],[-95.825313,3.379318],[-99.103655,1.924500],[-104.009193,-0.793542],[-107.784601,-3.429529],[-110.505376,-5.949901],[-112.247014,-8.321101],[-113.085010,-10.509569],[-113.094860,-12.481748],[-112.352059,-14.204079],[-110.932105,-15.643004],[-108.910492,-16.764963],[-106.362717,-17.536399],[-103.364274,-17.923752],[-99.990661,-17.893465],[-96.317373,-17.411979],[-92.419905,-16.445735],[-88.373754,-14.961175],[-84.254415,-12.924740]]);
  }
}

module SideBoard()
{
	difference()
	{
		poly_path4449(3);

		difference()
		{
			union()
			{
				translate([0,0,2.6])
					union()
					{
						offset_shell()
							poly_path4759(3);
					}
					
				translate([0,0,2.6])
					union()
					{
						offset_shell()
							poly_path4740(3);
					}
			}
			
			translate([0,9.8,3.5])
				rotate([0,0,-1.3])
					cube([50,20,6], true);
		}
	}
}

module poly_path4493(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
    linear_extrude(height=h)
      polygon([[-22.000000,-106.750000],[-25.992716,-106.578630],[-30.691778,-105.883560],[-36.123076,-104.535772],[-42.312500,-102.406250],[-46.449958,-100.434993],[-50.262684,-97.916794],[-53.738275,-94.922357],[-56.864323,-91.522386],[-59.628425,-87.787586],[-62.018176,-83.788660],[-64.021169,-79.596313],[-65.625000,-75.281250],[-66.781543,-70.950677],[-67.478122,-66.723453],[-67.755501,-62.687763],[-67.654449,-58.931790],[-67.215731,-55.543719],[-66.480114,-52.611732],[-65.488365,-50.224015],[-64.281250,-48.468750],[-60.235280,-44.353819],[-56.740181,-41.312641],[-53.781241,-39.240143],[-51.343750,-38.031250],[-49.318901,-37.457487],[-47.425303,-37.373227],[-45.389366,-37.797666],[-42.937500,-38.750000],[-42.183232,-39.645117],[-40.437500,-42.593750],[-38.781301,-47.254339],[-37.437500,-52.656250],[-35.844319,-62.562187],[-35.406250,-66.968750],[-34.850763,-69.312586],[-33.486954,-71.196091],[-31.516386,-72.430769],[-29.140625,-72.828125],[-26.796789,-72.272638],[-24.913284,-70.908829],[-23.678606,-68.938261],[-23.281250,-66.562500],[-23.281250,-8.312500],[-23.703134,-6.165991],[-24.817396,-4.358092],[-26.485705,-3.044007],[-28.569732,-2.378938],[-30.754225,-2.495037],[-32.700750,-3.344223],[-34.236208,-4.811344],[-35.187500,-6.781250],[-36.023483,-5.092977],[-37.304013,-3.768903],[-38.922719,-2.889859],[-40.773231,-2.536675],[-42.642904,-2.767886],[-44.315714,-3.539011],[-45.680225,-4.776362],[-46.625000,-6.406250],[-48.445887,-9.923884],[-51.028398,-13.199049],[-54.253917,-16.168539],[-58.003825,-18.769152],[-62.159505,-20.937684],[-66.602339,-22.610930],[-71.213710,-23.725687],[-75.875000,-24.218750],[-80.421991,-24.061705],[-84.707767,-23.266421],[-88.639659,-21.830115],[-92.125000,-19.750000],[-95.138277,-17.005202],[-97.647979,-13.474112],[-99.552442,-9.002841],[-100.750000,-3.437500],[-100.812500,-3.000000],[-101.062500,-0.156250],[-101.062500,0.156250],[-100.906250,2.437500],[-100.843750,2.687500],[-100.781250,3.031250],[-99.630745,8.688235],[-97.763303,13.236849],[-95.279835,16.831100],[-92.281250,19.625000],[-88.803494,21.744365],[-84.875575,23.214391],[-80.587993,24.038160],[-76.031250,24.218750],[-71.352754,23.743366],[-66.719871,22.639781],[-62.253038,20.971926],[-58.072695,18.803735],[-54.299280,16.199139],[-51.053234,13.222072],[-48.454994,9.936465],[-46.625000,6.406250],[-45.684518,4.774318],[-44.323463,3.533693],[-42.653014,2.758310],[-40.784348,2.522103],[-38.933240,2.870106],[-37.312371,3.744409],[-36.028279,5.064533],[-35.187500,6.750000],[-34.233599,4.777237],[-32.694052,3.309468],[-30.742987,2.462180],[-28.554534,2.350859],[-26.468907,3.023083],[-24.802528,4.345101],[-23.693831,6.160408],[-23.281250,8.312500],[-23.281250,66.562500],[-23.438107,68.151345],[-23.991909,69.620964],[-24.904215,70.899311],[-26.136589,71.914341],[-27.590997,72.572921],[-29.140625,72.828125],[-30.703860,72.677218],[-32.199089,72.117466],[-33.496640,71.187202],[-34.492466,69.972786],[-35.143395,68.543532],[-35.406250,66.968750],[-35.844319,62.562187],[-37.437500,52.656250],[-38.781301,47.254339],[-40.437500,42.593750],[-42.183232,39.645136],[-42.937500,38.750000],[-45.389366,37.797666],[-47.425303,37.373228],[-49.318901,37.457488],[-51.343750,38.031250],[-53.781241,39.240143],[-56.740181,41.312641],[-60.235280,44.353819],[-64.281250,48.468750],[-65.488365,50.224015],[-66.480114,52.611732],[-67.215731,55.543719],[-67.654449,58.931790],[-67.755501,62.687763],[-67.478122,66.723453],[-66.781543,70.950677],[-65.625000,75.281250],[-64.021169,79.596313],[-62.018176,83.788660],[-59.628425,87.787586],[-56.864323,91.522386],[-53.738275,94.922357],[-50.262684,97.916794],[-46.449958,100.434993],[-42.312500,102.406250],[-37.741415,104.035184],[-33.575741,105.231027],[-26.409176,106.524430],[-20.709898,106.688430],[-16.375000,106.125000],[-13.959529,105.449085],[-12.218750,104.718750],[-12.218750,-104.750000],[-12.437500,-104.875000],[-16.163079,-106.104835],[-18.800145,-106.549599],[-22.000000,-106.750000]]);
  }
}

module poly_path4537(h)
{
  scale([25.4/90, -25.4/90, 1]) union()
  {
       linear_extrude(height=h)
         polygon([[107.125000,-125.062500],[103.106530,-124.871582],[99.562039,-124.332031],[96.422744,-123.493652],[93.619858,-122.406250],[88.748176,-119.683594],[84.396715,-116.562500],[80.015196,-113.441406],[75.053340,-110.718750],[72.182823,-109.631348],[68.960867,-108.792969],[65.318688,-108.253418],[61.187500,-108.062500],[61.187500,-83.281250],[50.562500,-83.281250],[50.562500,-97.437500],[50.562500,-108.062500],[36.375000,-108.062500],[36.375000,-97.437500],[22.218750,-97.437500],[22.218750,-108.062500],[8.031250,-108.062500],[8.031250,-97.437500],[-6.156250,-97.437500],[-6.156250,-108.062500],[-7.072308,-108.784570],[-9.911571,-110.383852],[-14.810674,-112.009959],[-18.075363,-112.567325],[-21.906250,-112.812500],[-26.545768,-112.615760],[-31.845250,-111.835852],[-37.823670,-110.356768],[-44.500000,-108.062500],[-49.400150,-105.739424],[-53.869832,-102.811252],[-57.904590,-99.360237],[-61.499964,-95.468633],[-64.651498,-91.218693],[-67.354734,-86.692671],[-69.605215,-81.972822],[-71.398481,-77.141397],[-72.730077,-72.280652],[-73.595543,-67.472839],[-73.990422,-62.800213],[-73.910258,-58.345026],[-73.350591,-54.189533],[-72.306964,-50.415987],[-70.774920,-47.106641],[-68.750000,-44.343750],[-64.427388,-39.929680],[-60.495633,-36.497204],[-56.871801,-33.987446],[-53.472956,-32.341529],[-50.216164,-31.500577],[-47.018489,-31.405714],[-43.796996,-31.998064],[-40.468750,-33.218750],[-38.845599,-34.259088],[-37.380505,-35.811586],[-36.066107,-37.796315],[-34.895047,-40.133343],[-32.953500,-45.544580],[-31.496986,-51.405854],[-29.803557,-61.920750],[-29.343750,-66.562500],[-29.343750,-8.312500],[-30.272327,-11.638897],[-31.357293,-14.556087],[-32.788706,-17.206330],[-33.618548,-18.172846],[-34.516062,-18.762423],[-35.474936,-18.871661],[-36.488857,-18.397160],[-37.551512,-17.235519],[-38.656588,-15.283338],[-39.797771,-12.437215],[-40.968750,-8.593750],[-43.274929,-13.156166],[-46.416155,-17.276422],[-50.265067,-20.911100],[-54.694301,-24.016780],[-59.576493,-26.550044],[-64.784281,-28.467474],[-70.190301,-29.725650],[-75.667190,-30.281154],[-81.087585,-30.090567],[-86.324122,-29.110471],[-91.249439,-27.297447],[-95.736172,-24.608076],[-99.656957,-20.998939],[-101.365319,-18.835891],[-102.884433,-16.426619],[-104.198378,-13.765696],[-105.291235,-10.847695],[-106.147082,-7.667189],[-106.750000,-4.218750],[-107.125000,0.000000],[-106.875000,3.406250],[-106.812500,3.750000],[-106.238942,7.244470],[-105.408574,10.468462],[-104.337503,13.427453],[-103.041836,16.126924],[-101.537678,18.572355],[-99.841137,20.769224],[-95.935328,24.439198],[-91.453259,27.180681],[-86.523782,29.037509],[-81.275748,30.053519],[-75.838008,30.272547],[-70.339411,29.738430],[-64.908810,28.495002],[-59.675055,26.586100],[-54.766996,24.055561],[-50.313486,20.947220],[-46.443374,17.304914],[-43.285512,13.172479],[-40.968750,8.593750],[-39.797771,12.437215],[-38.656588,15.283338],[-37.551512,17.235519],[-36.488857,18.397160],[-35.474936,18.871661],[-34.516062,18.762423],[-33.618548,18.172846],[-32.788706,17.206330],[-31.357293,14.556087],[-30.272327,11.638897],[-29.343750,8.312500],[-29.343750,66.562500],[-29.803557,61.920750],[-31.496986,51.405854],[-32.953500,45.544580],[-34.895047,40.133343],[-36.066107,37.796315],[-37.380505,35.811586],[-38.845599,34.259088],[-40.468750,33.218750],[-43.796996,31.998064],[-47.018489,31.405714],[-50.216164,31.500577],[-53.472956,32.341529],[-56.871801,33.987446],[-60.495633,36.497204],[-64.427388,39.929680],[-68.750000,44.343750],[-70.774920,47.106641],[-72.306964,50.415987],[-73.350591,54.189533],[-73.910258,58.345026],[-73.990422,62.800213],[-73.595543,67.472839],[-72.730077,72.280652],[-71.398481,77.141397],[-69.605215,81.972822],[-67.354734,86.692671],[-64.651498,91.218693],[-61.499964,95.468633],[-57.904590,99.360237],[-53.869832,102.811252],[-49.400150,105.739424],[-44.500000,108.062500],[-39.574745,109.814257],[-35.021761,111.114450],[-30.833527,112.009792],[-27.002520,112.546997],[-20.382101,112.733852],[-15.100330,112.048720],[-11.097034,110.865311],[-8.312038,109.557333],[-6.156250,108.062500],[-6.156250,97.437500],[8.031250,97.437500],[8.031250,108.062500],[22.218750,108.062500],[22.218750,97.437500],[36.375000,97.437500],[36.375000,108.062500],[50.562500,108.062500],[50.562500,97.437500],[50.562500,83.250000],[61.187500,83.250000],[61.187500,97.437500],[61.187500,108.062500],[65.318688,108.253418],[68.960867,108.792969],[72.182823,109.631348],[75.053340,110.718750],[80.015196,113.441406],[84.396715,116.562500],[88.748176,119.683594],[93.619858,122.406250],[96.422744,123.493652],[99.562039,124.332031],[103.106530,124.871582],[107.125000,125.062500],[107.125000,96.718750],[103.462148,96.561050],[100.193480,96.112776],[97.267935,95.411162],[94.634456,94.493444],[90.039455,92.158640],[86.000000,89.406250],[86.000000,-89.406250],[90.039455,-92.158640],[94.634456,-94.493444],[97.267935,-95.411162],[100.193480,-96.112776],[103.462148,-96.561050],[107.125000,-96.718750],[107.125000,-125.062500]]);
  }
}

module HeadBoard()
{
	difference()
	{
		poly_path4537(3);
		translate([0,0,2.6])
			union()
			{
				offset_shell()
					poly_path4493(3);
			}
	}
}

//----------------------------------------------------------------------------
//	B E D
//----------------------------------------------------------------------------
module PrincessBedV2()
{
	union()
	{
		translate([47.4975,0,8.6])
			rotate([0,-90,180])
				FootBoard();

		translate([0,27.5,11.1125])
			rotate([90,0,180])
				color("red")
					SideBoard();
			
		translate([0,-27.5,11.1125])
			rotate([90,0,0])
				color("green")
					SideBoard();
			
		translate([0,0,0])
			color("blue")
				BottomBoard();
			
		translate([-50.475,0,17.25])
			rotate([0,90,0])
				HeadBoard();	
	}
}

//----------------------------------------------------------------------------
//	T O P
//----------------------------------------------------------------------------
module PrincessBedV2_Top()
{
	translate([0,0,1.5])
		difference()
		{
			PrincessBedV2();
			translate([0,0,-23.5])
				cube([150,150,50], true);
		}
}

//----------------------------------------------------------------------------
//	B O T T O M
//----------------------------------------------------------------------------
module PrincessBedV2_Bottom()
{
	translate([0,0,1.5])
		rotate([0,180,0])
			intersection()
			{
				PrincessBedV2();
				translate([0,0,-23.5])
					cube([150,150,50], true);
			}
}

//----------------------------------------------------------------------------
//	F O O T
//----------------------------------------------------------------------------
module PrincessBedV2_Foot()
{
	translate([0,0,50.5])
		rotate([0,90,0])
			intersection()
			{
				translate([0,0,-3])
					PrincessBedV2_Top();
				translate([50,0,25])
					cube([100,100,50], true);
			}
}

//----------------------------------------------------------------------------
//	H E A D
//----------------------------------------------------------------------------
module PrincessBedV2_Head()
{
	translate([0,0,50.5])
		rotate([0,-90,0])
			intersection()
			{
				translate([0,0,-3])
					PrincessBedV2_Top();
				translate([-50,0,25])
					cube([100,100,50], true);
			}
}

if (part == 8)
	PrincessBedV2();
if (part == 4)
	PrincessBedV2_Bottom();
if (part == 2)
	PrincessBedV2_Foot();
if (part == 1)
	PrincessBedV2_Head();
