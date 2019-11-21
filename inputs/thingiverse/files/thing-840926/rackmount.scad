// Creates 19 inch rackmount parts.
// See also: https://en.wikipedia.org/wiki/19-inch_rack
// NOTE: many of the models generated by this may be too large to print without splitting
// TODO: Threads in the screw strips somehow
// TODO: support for four-post racks
//
// This is licensed under Creative Commons/Attribution/Share-Alike.
// For the "attribution", please provide a conspicuous link back to:
// 	http://www.thingiverse.com/thing:840926

/* [Main] */
// What to create. (NOTE: not all settings apply to all goals)
goal=0; // [0:rack mountable box,1:rack box lid,2:face plate cover,3:screw strip,4:rack,5:demo]

// How many units tall. One unit is approximately 1.75in(44.5mm) high.
units=1;

// How thick the faceplate/container will be (mm)
containerThickness=2;

// There is no set standard, but common unit depths are 600, 800, and 1010 (mm)
depth=600;

screwType=12; // [10:#10-32,12:#12-24]

/* [Advanced] */

// Thickness for the mounting ears (mm)
mountThickness=3;

// Thickness for the screw strips (mm)
screwStripThickness=5;

rearVents=1; // [0:no,1:yes]

sideVents=1; // [0:no,1:yes]

bottomVents=0; // [0:no,1:yes]

// Usually not recommended. (for dust reasons)
topVents=0; // [0:no,1:yes]

threaded=0; // [0:guess,1:yes,2:no]

top_screw_dia=2;

top_screw_countersink_dia=4.5;

top_screw_post_dia=5;

top_screw_spacing=75;

/* [hidden] */
rackHeightPerUnit=44.50;
rackTotalWidth=482.6;
rackMachineHeightMargin=0.787; // Each machine is undersized this amount on top to allow for insertion.
screwStripWidth=15.875;
mountingHoleVerticalMargin=6.350; // the vertical margin, top and bottom within a unit
mountingHoleVerticalSpacing=15.875; // the vertical spacing between holes within a unit (gives 3 holes per unit).

function screwOutsideHoleSize(numberScrewDia)=(numberScrewDia*0.013)+0.060;
function in2mm(in)=in*25.4;

// if gap is not specified, use 1/3 the hole dia
module hexgrid(l,w,hole_dia=5.5,gap=-1){
	gap=gap>0?gap:hole_dia*2.0/3.0;
	r=hole_dia/2;
	union() for(y=[0:(hole_dia+gap)*1.5:l]){
		for(x=[0:hole_dia+gap:w]){
			translate([x,y,0]) rotate([0,0,180/6]) circle(r=r,$fn=6);
			translate([x+r+gap/2,y+r+gap*2,0]) rotate([0,0,180/6]) circle(r=r,$fn=6);
		}
	}
}


module rackMountableBoxLid(depth=600,wall_thickness=2,topVents=false){
	width=rackTotalWidth-screwStripWidth*2-10-wall_thickness*2-1; // inset from the sides a little
	depth=depth-wall_thickness*2-1;
	vent_hole_size=10;
	vent_inset=10;
	numScrewsDeep=floor((depth-top_screw_post_dia)/top_screw_spacing);
	screwDeepInset=(depth/top_screw_spacing-numScrewsDeep)*top_screw_spacing/2;
	countersink_angle=45;
	countersink_depth=((top_screw_countersink_dia)-(top_screw_dia))/tan(countersink_angle);
	difference(){
		union(){
			translate([-width/2,0,0]) linear_extrude(wall_thickness) difference(){
				square([width,depth]);
				if(topVents) translate([vent_inset,vent_inset,0]) hexgrid(depth-vent_inset*2,width-vent_inset*2,vent_hole_size);
			}
			// add some material so we're not subtracting from a vent hole
			linear_extrude(wall_thickness) for(y=[screwDeepInset+top_screw_post_dia:top_screw_spacing:depth]){
				translate([ top_screw_post_dia-width/2,y,0]) circle(r=top_screw_post_dia,$fn=12);
				translate([-top_screw_post_dia+width/2,y,0]) circle(r=top_screw_post_dia,$fn=12);
			}
		}
		for(y=[screwDeepInset+top_screw_post_dia:top_screw_spacing:depth]){
			translate([ top_screw_post_dia-width/2,y,0]) union() {
				cylinder(r2=top_screw_countersink_dia,r1=top_screw_dia,h=countersink_depth,$fn=20);
				if(countersink_depth<wall_thickness){
					cylinder(r=top_screw_dia,h=wall_thickness,$fn=20);
				}
			}
			translate([-top_screw_post_dia+width/2,y,0]) union() {
				cylinder(r2=top_screw_countersink_dia,r1=top_screw_dia,h=countersink_depth,$fn=20);
				if(countersink_depth<wall_thickness){
					cylinder(r=top_screw_dia,h=wall_thickness,$fn=20);
				}
			}
		}
		
	}
}

// Standard depths are 600, 800, and 1010
module rackMountableBox(units=1,depth=600,wall_thickness=2,mountThickness=3,screwType=12,rearVents=true,sideVents=true,bottomVents=false){
	width=rackTotalWidth-screwStripWidth*2-10; // inset from the sides a little
	height=rackHeightPerUnit-rackMachineHeightMargin;
	post_height=height-wall_thickness;
	numScrewsDeep=floor((depth-top_screw_post_dia)/top_screw_spacing);
	screwDeepInset=(depth/top_screw_spacing-numScrewsDeep)*top_screw_spacing/2;
	vent_hole_size=10;
	vent_inset=10;
	rotate([90,0,180]) rackmountPlate(units,wall_thickness,mountThickness,screwType);
	// bottom
	translate([-width/2,0,0]) linear_extrude(wall_thickness) difference(){
		square([width,depth]);
		if(bottomVents) translate([vent_inset,vent_inset,0]) hexgrid(depth-vent_inset*2,width-vent_inset*2,vent_hole_size);
	}
	linear_extrude(post_height) for(y=[screwDeepInset+top_screw_post_dia:top_screw_spacing:depth]){
		translate([ top_screw_post_dia-width/2,y,0]) difference() { circle(r=top_screw_post_dia,$fn=12); circle(r=top_screw_dia,$fn=20); }
		translate([-top_screw_post_dia+width/2,y,0]) difference() { circle(r=top_screw_post_dia,$fn=12); circle(r=top_screw_dia,$fn=20); }
	}
	// right side
	translate([wall_thickness-width/2,0,0]) rotate([0,-90,0]) linear_extrude(wall_thickness) difference(){
		square([height,depth]);
		if(sideVents) translate([vent_inset,vent_inset,0]) hexgrid(depth-vent_inset*2,height-vent_inset*2,vent_hole_size);
	}
	// left side
	translate([width/2,0,0]) rotate([0,-90,0]) linear_extrude(wall_thickness) difference(){
		square([height,depth]);
		if(sideVents) translate([vent_inset,vent_inset,0]) hexgrid(depth-vent_inset*2,height-vent_inset*2,vent_hole_size);
	}
	// back side
	translate([width/2,depth,0]) rotate([90,0,0]) rotate([0,0,90]) linear_extrude(wall_thickness) difference(){
		square([height,width]);
		if(sideVents) translate([vent_inset,vent_inset,0]) hexgrid(width-vent_inset*2,height-vent_inset*2,vent_hole_size);
	}
}

module rackmountPlate(units=1,plate_thicnkess=1,mountThickness=3,screwType=12){
	rackCenter2ScrewCenter=(rackTotalWidth-screwStripWidth)/2;
	translate([rackCenter2ScrewCenter,0,0]) screwStrip(units,mountThickness,false,screwType);
	translate([-rackCenter2ScrewCenter,0,0]) screwStrip(units,mountThickness,false,screwType);
	translate([-rackTotalWidth/2+screwStripWidth,rackMachineHeightMargin,0]) cube([rackTotalWidth-screwStripWidth*2,units*rackHeightPerUnit-rackMachineHeightMargin*2,plate_thicnkess]);
}

// screwType is either 12 (for #12-24) or 10 (for #10-32)
module screwStrip(units=2,screwStripThickness=5,threaded=true,screwType=12){
	total_len=units*rackHeightPerUnit;
	threaded=false; // TODO: remove me!
	linear_extrude(screwStripThickness) difference(){
		translate([-screwStripWidth/2,0,0]) square([screwStripWidth,units*rackHeightPerUnit]);
		if(threaded){
			//screwHole(scew="#12",tpi=24); // #12-24 or #10-32
		}else{
			r=in2mm(screwOutsideHoleSize(screwType))/2;
			for(u=[0:units-1]){
				for (h=[mountingHoleVerticalMargin:mountingHoleVerticalSpacing:rackHeightPerUnit-mountingHoleVerticalMargin]){
					z=u*rackHeightPerUnit+h;
					translate([0,z,0]) circle(r=r);
				}
			}
		}
	}
}

// FYI: a "full height" cabinet is 42 units high, or a little over six feet. 
module rack(units=3,faceFrameWidth=10,faceFrameRecess=10,box_thickness=2,box_back=true,screwStripThickness=5,threaded=true,screwType=12){
	rackCenter2ScrewCenter=(rackTotalWidth-screwStripWidth)/2;
	translate([rackCenter2ScrewCenter,0,0]) screwStrip(units,screwStripThickness,threaded,screwType);
	translate([-rackCenter2ScrewCenter,0,0]) screwStrip(units,screwStripThickness,threaded,screwType);
}

if(goal==0){ // rack mountable box
	rackMountableBox(units=units,depth=depth,wall_thickness=containerThickness,mountThickness=mountThickness,screwType=screwType,rearVents=(rearVents==1),sideVents=(sideVents==1),bottomVents=(bottomVents==1));
}else if(goal==1){ // rack mountable box lid
	rackMountableBoxLid(depth=depth,wall_thickness=containerThickness,topVents=(topVents==1));
}else if(goal==2){ // face plate cover
	rackmountPlate(units=units,plate_thicnkess=containerThickness,mountThickness=mountThickness,screwType=screwType);
}else if(goal==3){ // screw strip
	screwStrip(units=units,screwStripThickness=screwStripThickness,threaded=(threaded!=2),screwType=screwType);
}else if(goal==4){ // rack
	rack(units=units,faceFrameWidth=10,faceFrameRecess=10,box_thickness=containerThickness,box_back=true,screwStripThickness=screwStripThickness,threaded=(threaded!=2),screwType=screwType);
}else if(goal==5){ // demo
	translate([0,30,-2*rackHeightPerUnit]) rotate([90,0,0]) rack(units=5,faceFrameWidth=10,faceFrameRecess=10,box_thickness=2,box_back=true,screwStripThickness=5,threaded=true,screwType=12);

	translate([0,-30,0]) rotate([90,0,0]) rackmountPlate(units=1,plate_thicnkess=2,mountThickness=4,screwType=12);
	translate([0,60,1.66*rackHeightPerUnit]) rackMountableBoxLid(depth=600,wall_thickness=2);
	rackMountableBox(units=1,depth=600,wall_thickness=2,mountThickness=4,screwType=12,rearVents=true,sideVents=true,bottomVents=true);
}

