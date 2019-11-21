

use <utils/build_plate.scad>


//set your build plate
build_plate_selector = 0; //[0:Replicator 2,1: Replicator,2:Thingomatic,3:Manual]

//if set to "manual" set the  build plate x dimension
build_plate_manual_x = 100; //[100:400]

//if set to "manual" set the  build plate y dimension
build_plate_manual_y = 100; //[100:400]

build_plate(build_plate_selector,build_plate_manual_x,build_plate_manual_y);








//Size of the internal donut.
internal_diameter=20; 			

//Size of the Shaft hole.
hole_diameter=5.75;  				

//Donut height.
height=4;								

//Resolution of the donut.
res = 100;		//[1:100]






//Number of Cogs.
cogs=17;			

//Total length of the cog. 
cog_length=4;		

//Width of the cogs base. 
cog_base_width=2;	

//Height of the cogs base. 
cog_base_height=4; 

//Width of the tip.
cog_tip_width=1;    

//Height of the tip.
tip_height=3;	 

//Amount of the cog length, which lacks angle, aka height of the cogbase.
no_angle = 3; 



module cog(){

	union(){									
		difference(){										

			translate ([0,0,0]){
				cylinder(height,internal_diameter/2,internal_diameter/2, $fn = res, center=true) ;
			}

			translate ([0,0,0]){
				cylinder(height+2,hole_diameter/2,hole_diameter/2, $fn = res, center=true);

			}
		}
	}





	for ( i = [0 : (cogs-1)] ){			//the spikes
		hull(){
    		rotate( i * 360 / cogs, [0, 0, 1])
    			translate([internal_diameter/2,0,0]){
    				cube ([no_angle*2,cog_base_width,cog_base_height],center=true);
						translate([cog_length,0,0]) {
							cube ([.1,cog_tip_width,tip_height],center=true);		
						}
				}


		}
	}
}


translate([0,0,height/2]){
	color([0,0.6,0.8]){
		cog(); 
	}
}

