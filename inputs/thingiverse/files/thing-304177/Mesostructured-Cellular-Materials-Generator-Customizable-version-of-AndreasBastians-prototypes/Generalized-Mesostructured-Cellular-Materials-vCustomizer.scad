//preview[view:north,tilt:top]

/////////////////////////////////////////////////////////////////////
/////////          *Customizer variables*          //////////////////
/////////////////////////////////////////////////////////////////////

/* [Basics] */
//What color do you want to render in?
primary_color="blue"; //[black,silver,gray,white,maroon,red,purple,fuchsia,green,lime,olive,yellow,navy,blue,te

//Roughly how wide of a sheet do you want to generate (the design will make a sheet slightly bigger)?
width=30;

//Roughly how tall of a sheet do you want to generate (the design will make a sheet slightly bigger)?
height=20;

//Choose triangular or square node structure
base_shape=3; //[3:Triangle,4:Square]

//Choose the size of the mesh
side_length=3;

//How thick do you want the sheet to be (in mm)?
thickness=4;

//How many turns do you want in the pattern lines?
turns=7;

//How wide should the pattern lines be (best to use multiples of .4 mm, assuming .4mm extrusion width)?
line_width=.4;

//Render a rectangle of the size above for reference?  This sheet will NOT be included in the final part generated by customizer!
render_size_reference=0; //[1:yes,0:no]

//Use this variable if the curves make contact with each other.  Higher numbers create more spacing between adjacent curves.
space_adjustment=.25;


///////////////////////////

side=side_length;
spaca=space_adjustment;

tht=360/base_shape/2;
p2p=2*side/sin(tht);

rows=ceil(width/(2*p2p*sin(tht))+.5*(base_shape-2*floor(base_shape/2)));
columns=ceil(height/(2*p2p*sin(tht)));

echo("rows wide = ",rows,", columns tall = ",columns);

color(primary_color)mesostructure(r=rows,c=columns,
		base_shape=base_shape,
		side_length=side_length,
		line_width=line_width,
		turns=turns,
		thickness=thickness,
		spaca=spaca);

if(render_size_reference==1){
	%color("black")
	translate([0,0,.51])
	cube([width,height,1],center=true);
}




///////TEST NET///////////
//for(i=[0,1])for(j=[0,1]){
//	translate([15*(-1+2*i),15*(-1+2*j)])net(r=2,c=2,base_shape=3+i,turns=turns+j);
//}

///////TEST ROW/////
//for(i=[0,1])for(j=[0,1]){
//	translate([20*(-1+2*i),10*(-1+2*j)])row(n=3,base_shape=3+i,turns=turns+j);
//}

///////TEST UNIT/////
//for(i=[0,1])for(j=[0,1]){
//	translate([10*(-1+2*i),10*(-1+2*j)])unit(base_shape=3+i,turns=turns+j);
//}

/////TEST SQUIG////
//for(i=[0,1])for(j=[0,1]){
//	translate([6*(-1+2*i),6*(-1+2*j)])squig(base_shape=3+i,turns=turns+j);
//}



/////////////////////////////////////////////////////////
/////////////////FINAL BUILD CODE////////////////////////
/////////////////////////////////////////////////////////
module mesostructure(r=2,c=3,
	base_shape=3,
	side_length=3,
	line_width=.4,
	turns=6,
	height=5,
	spaca=.5,
	res=12){

	linear_extrude(height=thickness)
	net(r=r,c=c,
		base_shape=base_shape,
		side_length=side_length,
		line_width=line_width,
		turns=turns,
		spaca=spaca,
		res=res);

}




/////////////////////////////////////////////////////////
/////////////////////////NET CODE////////////////////////
/////////////////////////////////////////////////////////
module net(r=2,c=3,
	base_shape=3,
	side_length=3,
	line_width=.4,
	turns=6,
	spaca=.5,
	res=12){

	tht=360/base_shape/2;
	p2p=2*side_length/sin(tht);
	
	if(base_shape==3){
		translate([0,-p2p*(1+cos(tht))*(c-1)/2])
		for(i=[0:c-1]){
			translate([p2p*sin(tht)*(i-2*floor(i/2)),p2p*(1+cos(tht))*i])row(n=r,
					base_shape=base_shape,
					side_length=side_length,
					line_width=line_width,
					turns=turns,
					spaca=spaca,
					res=res);
		}
	}

	echo(c);

	if(base_shape==4){
		translate([0,2*p2p*sin(tht)*(.5-c/2)])
		for(i=[0:c-1]){
			translate([0,2*p2p*sin(tht)*i])row(n=r,
					base_shape=base_shape,
					side_length=side_length,
					line_width=line_width,
					turns=turns,
					spaca=spaca,
					res=res);
		}
	}
}





/////////////////////////////////////////////////////////
/////////////////////////ROW CODE////////////////////////
/////////////////////////////////////////////////////////

module row(n=5,
	base_shape=3,
	side_length=3,
	line_width=.4,
	turns=6,
	spaca=.5,
	res=12){

	tht=360/base_shape/2;
	p2p=2*side_length/sin(tht);

	if(base_shape==3){
		translate([-2*p2p*sin(tht)*(n-.5)/2,0])
		for(i=[0:n-1]){
				translate([2*p2p*sin(tht)*i,0])
				rotate([0,0,-tht/2])unit(base_shape=base_shape,
					side_length=side_length,
					line_width=line_width,
					turns=turns,
					spaca=spaca,
					res=res);
		}
	}

	if(base_shape==4){
		translate([-2*p2p*sin(tht)*(n-1)/2,0])
		for(i=[0:n-1]){
				translate([2*p2p*sin(tht)*i,0])
				rotate([0,0,tht])
				unit(base_shape=base_shape,
					side_length=side_length,
					line_width=line_width,
					turns=turns,
					spaca=spaca,
					res=res);
		}
	}

//translate([p2p*(1+cos(tht)),-p2p*sin(tht),0])

}






/////////////////////////////////////////////////////////
/////////////////////////UNIT CODE///////////////////////
/////////////////////////////////////////////////////////

module unit(base_shape=3,
	side_length=3,
	line_width=.4,
	turns=6,
	spaca=.5,
	res=12){

	for(i=[0:base_shape-1])rotate([0,0,360/base_shape*i])
	squig(base_shape=base_shape,
		side_length=side_length,
		line_width=line_width,
		turns=turns,
		spaca=spaca,
		res=res);

}






/////////////////////////////////////////////////////////
/////////////////////////SQUIG CODE//////////////////////
/////////////////////////////////////////////////////////

module squig(base_shape=3,
	side_length=3,
	line_width=.4,
	turns=6,
	spaca=.5,
	res=12){

	spacing=(side_length+line_width)/4;
	space_mult=spaca/floor(turns/2);
	tht=360/base_shape/2;
	p2p=2*side_length/sin(tht);
	seg=p2p/turns;
	span=2*side_length/cos(tht);
	line=min(line_width,seg/2);
	rt=seg/2;
	eo=turns-2*(floor(turns/2)); //0 for even, 1 for odd

	s1=[1,1];
	s2=[-1,-1+2*eo];

	//if turns is even, I want to scale [1,1] and [-1,-1]
	//if turns is odd, I want to scale [1,1] and [-1,1]
	
	//echo("eo=",eo);

	translate([seg*turns/2,0])for(k=[s1,s2])scale(k)translate([-seg*turns/2,0])union(){
		
		circle(r=line/2,$fn=res);
		translate([0,-line/2])square([rt,line]);
		
		translate([rt,-rt])qring(r=rt,line=line,res=res);
		
		difference(){
			for(i=[1:(turns-1)/2]){
				scale([1,(1-2*(i-2*floor(i/2)))])
				translate([	seg*i+rt,0]){
					translate([0,span/turns*(i+.5)-spacing*(1+i*space_mult)])
						halfring(r=rt,line=line,res=res);
					for(j=[1,-1])translate([j*rt,(span/turns*(i+.5)-spacing*(1+i*space_mult))/2])
						union(){
							square([line,(span/turns*(i+.5)-spacing*(1+i*space_mult))],center=true);
							for(k=[1,-1])translate([0,(span/turns*(i+.5)-spacing*(1+i*space_mult))/2*k])circle(r=line/2,$fn=res);
						}
				}
				
			}
			translate([0,-rt])square([seg+line,rt*2]);
		}
	}
}





/////////////////////////////////////////////////////////
/////////////////////////RING CODES//////////////////////
/////////////////////////////////////////////////////////

module qring(r,line,res=10){
	difference(){
		ring(r=r,line=line,res=res);
		translate([0,-(r+line)*2])square((r+line)*4,center=true);
		translate([-(r+line)*2,0])square((r+line)*4,center=true);
	}
}


module halfring(r,line,res=10){
	difference(){
		ring(r=r,line=line,res=res);
		translate([0,-(r+line)*2])square((r+line)*4,center=true);
	}
}

module ring(r,line,res=10){

	difference(){
			circle(r=r+line/2,$fn=res);
			circle(r=r-line/2,$fn=res);
	}


}