// mathgrrl hinge/snap polyhedra

//////////////////////////////////////////////////////
// parameters

/* [Size] */

// Type of polyhedron
polyhedron = 3; //[1:Tetrahedron,2:Cube,3:Octahedron,4:Dodecahedron,5:Icosahedron]

// Side length (recommend 30 for triangle faces, 24 for square faces, 20 for pentagon faces)
length = 26;

// Width of the border edge
border = 3; 

// Thickness of the side pieces (height when printing)
height = 3;

/* [Clearances] */

// Clearance between hinge cones and holes
clearance = .55;	

// Clearance between hinge and sides
gap = .55; 				

// Clearance between snap tines (should decrease this to at most .3 for icosahedron)
space = .55;

// Parameters that the user does not get to specify
$fn=24;
hinge_radius = height/2;
cone_height = 1.5*hinge_radius; 
corner = 0*1;      	// space between hinge and corner
fudge = .01*1;			// to preserve mesh integrity
jump = 2*hinge_radius+2*gap;

//////////////////////////////////////////////////////
// render

if (polyhedron==1) tetrahedron_net();
if (polyhedron==2) cube_net();
if (polyhedron==3) octahedron_net();
if (polyhedron==4) dodecahedron_net();
if (polyhedron==5) icosahedron_net();

//////////////////////////////////////////////////////
// module for tetrahedron

module tetrahedron_net(){
	// center triangle
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// next triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// next next triangle
	translate([	0,
						2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=2,side=3,sides=3);	
	}
	
	// next next next triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						3*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
}

//////////////////////////////////////////////////////
// module for cube

module cube_net(){
	// center square
	poly_maker(sides=4);
	attach(type=1,side=1,sides=4);
	attach(type=1,side=2,sides=4);
	attach(type=1,side=3,sides=4);
	attach(type=1,side=4,sides=4);
	
	// west square
	translate([	(length+2*hinge_radius+2*gap)/sqrt(2),
						-(length+2*hinge_radius+2*gap)/sqrt(2),
						0]) 
		union(){
			poly_maker(sides=4);	
			attach(type=2,side=2,sides=4);
			attach(type=2,side=3,sides=4);
			attach(type=2,side=4,sides=4);
		}
	
	// north square
	translate([	-(length+2*hinge_radius+2*gap)/sqrt(2),
						-(length+2*hinge_radius+2*gap)/sqrt(2),
						0]) 
		union(){
			poly_maker(sides=4);	
			attach(type=2,side=1,sides=4);
			attach(type=2,side=2,sides=4);
			attach(type=2,side=3,sides=4);
		}
	
	// east square
	translate([	-(length+2*hinge_radius+2*gap)/sqrt(2),
						(length+2*hinge_radius+2*gap)/sqrt(2),
						0]) 
		union(){
			poly_maker(sides=4);	
			attach(type=2,side=1,sides=4);
			attach(type=2,side=2,sides=4);
			attach(type=2,side=4,sides=4);
		}
	
	// south square
	translate([	(length+2*hinge_radius+2*gap)/sqrt(2),
						(length+2*hinge_radius+2*gap)/sqrt(2),
						0]) 
		union(){
			poly_maker(sides=4);	
			attach(type=2,side=1,sides=4);
			attach(type=2,side=3,sides=4);
			attach(type=1,side=4,sides=4);
		}
	
	// souther square
	translate([	2*(length+2*hinge_radius+2*gap)/sqrt(2),
						2*(length+2*hinge_radius+2*gap)/sqrt(2),
						0]) 
		union(){
			poly_maker(sides=4);	
			attach(type=2,side=1,sides=4);
			attach(type=2,side=3,sides=4);
			attach(type=2,side=4,sides=4);
		}
}

//////////////////////////////////////////////////////
// module for octahedron

module octahedron_net(){
	// center triangle
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// A triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// B triangle
	translate([	0,
						2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// BX triangle
	translate([	-2*(length/tan(180/3)+jump)*cos(180/3),
						2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=2,sides=3);	
		attach(type=2,side=3,sides=3);	
	}
	
	// C triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						3*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=1,sides=3);	
		attach(type=1,side=2,sides=3);	
	}
	
	// CX triangle
	translate([	3*(length/tan(180/3)+jump)*cos(180/3),
						3*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(4*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=3,sides=3);	
	}
	
	// D triangle
	translate([	0,
						4*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(4*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
	
	// E triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						5*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(5*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=3,sides=3);	
	}
}

//////////////////////////////////////////////////////
// module for dodecahedron

module dodecahedron_net(){
	// 1center hexagon
	union(){
		poly_maker(sides=5);
		attach(type=1,side=1,sides=5);
		attach(type=1,side=2,sides=5);
		attach(type=1,side=3,sides=5);
		attach(type=1,side=4,sides=5);
		attach(type=1,side=5,sides=5);
	}
	
	// 1A hexagon
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);
		attach(type=1,side=4,sides=5);
		attach(type=2,side=5,sides=5);
	}
	
	// 1B hexagon
	rotate(-72,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);	
		attach(type=2,side=4,sides=5);	
		attach(type=2,side=5,sides=5);			
	}
	
	// 1C hexagon
	rotate(-2*72,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);		
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);	
		attach(type=2,side=4,sides=5);	
		attach(type=2,side=5,sides=5);	
			}
	
	// 1D hexagon
	rotate(-3*72,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);		
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);	
		attach(type=2,side=4,sides=5);	
		attach(type=2,side=5,sides=5);	
	}
	
	// 1E hexagon
	rotate(-4*72,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);		
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);	
		attach(type=2,side=4,sides=5);	
		attach(type=2,side=5,sides=5);	
	}
	
	// 2center hexagon
	translate([	2*(length/tan(36)+jump)*cos(36)+2*length/(2*tan(36))+jump,
						2*(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=1,side=1,sides=5);	
		attach(type=1,side=2,sides=5);	
		attach(type=1,side=3,sides=5);
		attach(type=1,side=4,sides=5);
		attach(type=1,side=5,sides=5);
	}
	
	// 2A hexagon
	translate([	2*(length/tan(36)+jump)*cos(36)+2*length/(2*tan(36))+jump,
						2*(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);
		attach(type=2,side=4,sides=5);
		attach(type=2,side=5,sides=5);
	}
	
	// 2B hexagon
	translate([	2*(length/tan(36)+jump)*cos(36)+2*length/(2*tan(36))+jump,
						2*(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(-72,[0,0,1])
	rotate(36,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);
		attach(type=2,side=4,sides=5);
		attach(type=2,side=5,sides=5);
	}
	
	// 2C hexagon
	translate([	2*(length/tan(36)+jump)*cos(36)+2*length/(2*tan(36))+jump,
						2*(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(-2*72,[0,0,1])
	rotate(36,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);
		attach(type=2,side=4,sides=5);
		attach(type=2,side=5,sides=5);
	}
	
	// 2D hexagon
	translate([	2*(length/tan(36)+jump)*cos(36)+2*length/(2*tan(36))+jump,
						2*(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(-3*72,[0,0,1])
	rotate(36,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);
		attach(type=2,side=5,sides=5);
	}
	
	// 2E hexagon
	translate([	2*(length/tan(36)+jump)*cos(36)+2*length/(2*tan(36))+jump,
						2*(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(-4*72,[0,0,1])
	rotate(36,[0,0,1])
	translate([	(length/tan(36)+jump)*cos(36),
						(length/tan(36)+jump)*sin(36),
						0]) 
	rotate(36,[0,0,1])
	union(){
		poly_maker(sides=5);
		attach(type=2,side=1,sides=5);	
		attach(type=2,side=3,sides=5);
		attach(type=2,side=4,sides=5);
		attach(type=2,side=5,sides=5);
	}
}

//////////////////////////////////////////////////////
// module for icosahedron

module icosahedron_net(){
	
	// 1lower triangle
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// 1A triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// 1B triangle
	translate([	0,
						2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=2,side=3,sides=3);	
	}
	
	// 1C triangle
	translate([	(length/tan(180/3)+jump)*cos(180/3),
						3*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
	
	// 2lower triangle
	translate([	3*(length/tan(180/3)+jump)*cos(180/3),
						-(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// 2A triangle
	translate([	4*(length/tan(180/3)+jump)*cos(180/3),
						0*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// 2B triangle
	translate([	3*(length/tan(180/3)+jump)*cos(180/3),
						1*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
	}
	
	// 2C triangle
	translate([	4*(length/tan(180/3)+jump)*cos(180/3),
						2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
	
	// 3lower triangle
	translate([	6*(length/tan(180/3)+jump)*cos(180/3),
						-2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// 3A triangle
	translate([	7*(length/tan(180/3)+jump)*cos(180/3),
						-1*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// 3B triangle
	translate([	6*(length/tan(180/3)+jump)*cos(180/3),
						0*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
	}
	
	// 3C triangle
	translate([	7*(length/tan(180/3)+jump)*cos(180/3),
						1*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
	
	// 4lower triangle
	translate([	9*(length/tan(180/3)+jump)*cos(180/3),
						-3*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// 4A triangle
	translate([	10*(length/tan(180/3)+jump)*cos(180/3),
						-2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// 4B triangle
	translate([	9*(length/tan(180/3)+jump)*cos(180/3),
						-1*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
	}
	
	// 4C triangle
	translate([	10*(length/tan(180/3)+jump)*cos(180/3),
						0*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
	
	// 5lower triangle
	translate([	12*(length/tan(180/3)+jump)*cos(180/3),
						-4*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);
		attach(type=2,side=2,sides=3);
		attach(type=1,side=3,sides=3);
	}
	
	// 5A triangle
	translate([	13*(length/tan(180/3)+jump)*cos(180/3),
						-3*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=2,sides=3);	
		attach(type=1,side=3,sides=3);	
	}
	
	// 5B triangle
	translate([	12*(length/tan(180/3)+jump)*cos(180/3),
						-2*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(2*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=1,side=2,sides=3);	
	}
	
	// 5C triangle
	translate([	13*(length/tan(180/3)+jump)*cos(180/3),
						-1*(length/tan(180/3)+jump)*sin(180/3),
						0]) 
	rotate(3*180/3,[0,0,1])
	union(){
		poly_maker(sides=3);
		attach(type=2,side=1,sides=3);	
		attach(type=2,side=2,sides=3);	
	}
}

//////////////////////////////////////////////////////
// module for hinge

module hinge(){

	rad = hinge_radius;
	clr = clearance;
	len = (length-2*corner)/3; 
	con = cone_height;

	rotate(90,[0,1,0]) rotate(-90,[1,0,0]) 
	translate([-rad,-rad-gap+fudge,0])
		union(){
	
			// left outside hinge = (cylinder+box)-cone
			difference(){
				union(){
					translate([0,0,corner]) cylinder(h=len-clr,r=rad);
					translate([-rad,0,corner]) cube([2*rad,rad+gap+.1,len-clr]);
				}
				translate([0,0,corner+len-con-clr+fudge]) cylinder(h=con,r1=0,r2=rad);
			}

			// inside hinge = cylinder+box+cone+cone
			union(){
				translate([0,0,corner+len]) cylinder(h=len,r=rad);
				translate([-rad,-rad-gap-.1,corner+len]) cube([2*rad,rad+gap+.1,len]);
				translate([0,0,corner+len-con]) cylinder(h=con,r1=0,r2=rad);
				translate([0,0,corner+2*len]) cylinder(h=con,r1=rad,r2=0);
			}

			// right outside hinge = (cylinder+box)-cone
			difference(){
				union(){
					translate([0,0,corner+2*len+clr]) cylinder(h=len-clr,r=rad);
					translate([-rad,0,corner+2*len+clr]) cube([2*rad,rad+gap+.1,len-clr]);
				}
				translate([0,0,corner+2*len+clr-fudge]) cylinder(h=con,r1=rad,r2=0);	
			}

		}
}

//////////////////////////////////////////////////////
// module for snap

module snap(sides){

radius = length/(2*sin(180/sides)); 
snapwidth = radius*sin(180/sides)/3;

//build snaps for first side at the origin and move into positions
for(i=[0:2]){	

	//for i^th snap translate 2*i snapwidths over from origin
	translate([0-fudge,2*i*snapwidth,0-fudge]) 

		//rounded box for snap made from a box and cylinder
		union(){

			//cube part of snap shape at the origin
			cube([height/2+gap+fudge,snapwidth-space+fudge,height+fudge]);

			//round part of snap shape at the origin
			//move cylinder to the end of the box
			translate([height/2+gap,snapwidth-space+fudge,height/2])

				//rotate cylinder to match box orientation
				rotate(90,[0,1,0]) 
					rotate(90,[1,0,0]) 

						//cylinder of the correct size to match box
						cylinder(	
							r=height/2,
							h=snapwidth-space,
							$fn=16  //number of sides
						);
					}
			}

}

//////////////////////////////////////////////////////
// module for polygon shape
//shape is made up of n=sides wedges that are rotated around

module poly_maker(sides){

	radius = length/(2*sin(180/sides)); 
	inside = radius-border/(cos(180/sides));

	translate([0,0,height/2])

	//subtract the smaller polygon from the larger polygon
	difference(){

		//extrude to thicken the polygon
		linear_extrude(height=height,center=true){ 

			//rotate the wedge n=sides times at angle of 360/n each time
			for(i=[0:sides]){

				//rotation is around the z-axis [0,0,1]
				rotate(i*360/sides,[0,0,1])	

					//make triangular wedge with angle based on number of sides
					polygon(

						//the three vertices of the triangle
						points = [[0-.05,0-.05], //tweaks fix CGAL errors
									 [radius,0-.01],
									 [radius*cos(360/sides)-.01,radius*sin(360/sides)+.01]],

						//the order to connect the three vertices above
						paths = [[0,1,2]]
					);
			}
		}
		//extrude to thicken the center polygon that will be the hole
		linear_extrude(height=height+2,center=true){ 

			//rotate the wedge n=sides times at angle of 360/n each time			
			for(i=[0:sides]){

				//rotation is around the z-axis [0,0,1]
				rotate(i*360/sides,[0,0,1])	

					//make triangular wedge with angle based on number of sides
					polygon(

						//the three vertices of the triangle
						points =	[[0-.1,0-.1], //tweaks fix CGAL errors
									 [inside,0-.01],
									 [inside*cos(360/sides)-.01,inside*sin(360/sides)+.01]],

						//the order to connect the three vertices above
						paths = [[0,1,2]]
					);
			}
		}
	}
}

//////////////////////////////////////////////////////
// module for attaching hinges or snaps to shape
// type=1 for hinges, type=2 for snaps

module attach(type,side,sides){

	radius = length/(2*sin(180/sides)); 

	//rotation is around the z-axis [0,0,1]
	rotate(side*360/sides,[0,0,1]) 	

		//translate the attachment to the first side
		translate([radius,0,0+fudge]) 

			//rotate the attachment to correct angle for first side
			rotate(180/sides) 

				union(){
					if (type==1) hinge();
					if (type==2) snap(sides);
				}

}