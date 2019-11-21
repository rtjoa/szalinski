////GRIPPER
// for robotic arms
// by Kalium


teeth=20; //number of teeth
mm_per_tooth=5; 
thickness=5;
hole=3.2;
L1=30;
L2=30;
L3=10;
L4=60;
L5=20;
L6=5;
m=7;
servo_t=13.5;
servo_w1=29.5;
servo_w2=40.5;
servo_w3=41;
servo_h=12.5;
servo_d=12;
servo_a=13.5;
servo_r1=4.2;
servo_r2=2.6;

//don't modify the following values:
hl=m/2;
d =0.1+pitch_radius(mm_per_tooth,teeth);
$fn=30;
cw1=4*d;
cw2=(d/2-servo_d+servo_w3)*2+2;
vector=[cw1,cw2];
cover_width=min(vector);

//lower cover
translate([0,0,-thickness*4])color("Green")
difference(){
union(){    
hull(){
 translate([-thickness,d,thickness/2])cube([2*d,cover_width,thickness],center=true);
  translate([L2,L3,0])  cylinder(r=hl+1,h=thickness);
translate([L2,d*2-L3,0])  cylinder(r=hl+1,h=thickness);    
}
translate([-2-(2*d+3)/2-thickness/2,d,(thickness*3+servo_h-3)/2])
cube([thickness,cover_width,thickness*3+servo_h-3],center=true);

}
//starting difference
translate([0,0,-thickness/2]){
 cylinder(r=hole/2,h=thickness*2);
 translate([0,d*2,0]) cylinder(r=hole/2,h=thickness*2);
  translate([L2,L3,0])  cylinder(r=hole/2,h=thickness*2);
translate([L2,d*2-L3,0])  cylinder(r=hole/2,h=thickness*2);    
}
translate([0,-(servo_w3-servo_w1)/2+servo_d,0])cube([servo_t,servo_w1,4*thickness],center=true);
translate([0,-(servo_w3-servo_w1)/2+servo_d,-servo_h/2+thickness-2])cube([servo_t,servo_w3,servo_h],center=true);
translate([d+m/2,d,-(servo_h-3)/2])cylinder(r=hole/2,h=(servo_h+thickness)*2,$fn=30,center=true); 
//holes for arm attachment
translate([-d-thickness*2,d-17/2,servo_h+thickness/2])rotate([0,90,0])cylinder(r=0.5,h=thickness*3,$fn=30,center=true); 
translate([-d-thickness*2,d+17/2,servo_h+thickness/2])rotate([0,90,0])cylinder(r=0.5,h=thickness*3,$fn=30,center=true); 
//hole for wrist servo screw
translate([-d-thickness*2,d,servo_h+thickness/2])rotate([0,90,0])cylinder(r=4,h=thickness*3,$fn=30,center=true); 
}

//upper cover
translate([0,0,thickness*2])color("Silver")
difference(){
union(){    
hull(){
 cylinder(r=hl+1,h=thickness);
 translate([0,d*2,0]) cylinder(r=hl+1,h=thickness);
  translate([L2,L3,0])  cylinder(r=hl+1,h=thickness);
translate([L2,d*2-L3,0])  cylinder(r=hl+1,h=thickness);    
}
translate([d+m/2,d,-(servo_h-3+thickness)/2])cylinder(r=m/2,h=servo_h-3+thickness,$fn=30,center=true);
}
//starting difference
translate([0,0,-thickness/2]){
cylinder(r=3,h=thickness*2,$fn=15);
 translate([0,d*2,0]) cylinder(r=hole/2,h=thickness*2);
  translate([L2,L3,0])  cylinder(r=hole/2,h=thickness*2);
translate([L2,d*2-L3,0])  cylinder(r=hole/2,h=thickness*2);
    }    
translate([d+m/2,d,-(servo_h-3)/2])cylinder(r=hole/2,h=(servo_h+thickness)*2,$fn=30,center=true);    
}


//gear1
difference(){
union(){
     rotate([0,0, 360/teeth])   gear(mm_per_tooth,teeth,thickness,1);
    hull(){
        cylinder(r=hl,h=thickness,center=true);
translate([0,-L1,0]) cylinder(r=hl,h=thickness,center=true);        
        }
    }
//starting difference        
cylinder(r=4,h=thickness*2,center=true,$fn=15);        
translate([0,-L1,0]) cylinder(r=hole/2,h=thickness*2,center=true,$fn=15);
//hole for servo arm    
translate([0,0,-thickness+1])hull(){
    cylinder(r=servo_r1,h=thickness,center=true);
translate([0,-servo_a,0])cylinder(r=servo_r2,h=thickness,center=true);    
}    

translate([0,-servo_a,0]) cylinder(r=0.5,h=thickness*2,center=true,$fn=10); //hole for servo screw HS-70MG    
}

            
//lever1
        translate([L2,L3,0]){
difference(){
union(){    
    hull(){
        cylinder(r=hl,h=thickness,center=true);
translate([0,-L1,0]) cylinder(r=hl,h=thickness,center=true);        
        }
translate([0,0,-(servo_h-3+thickness)/2])cylinder(r=m/2,h=servo_h-3,$fn=30,center=true);                        
    }
cylinder(r=hole/2,h=thickness*2+servo_h*2,center=true,$fn=15);        
translate([0,-L1,0]) cylinder(r=hole/2,h=thickness*2,center=true,$fn=15);               
    }
}


//gripper1
color("Teal")
difference(){
hull(){
translate([0,-L1,0]) cylinder(r=hl,h=thickness*3,center=true);
translate([L2,L3-L1,0])  cylinder(r=hl,h=thickness*3,center=true);   
translate([L2+L5,L3-L1+L6,0]) cube([1,1,thickness*3],center=true);           
translate([L2+L4,L3-L1+L6-hl+0.5,0]) cube([1,m,thickness*3],center=true);       
 }
 //difference
translate([0,-L1,0]) cylinder(r=hole/2,h=thickness*2*3,center=true,$fn=15);                
 translate([L2,L3-L1,0]) cylinder(r=hole/2,h=thickness*2*3,center=true,$fn=15);                
translate([L2/2,-L1+L3,0]) cube([L2+m+4,L1,thickness+1],center=true);
}

//gear2
translate([ 0,  2*d, 0]){
        difference(){    
union(){
 rotate([0,0,(-teeth/2-1/2)*360/teeth])    gear(mm_per_tooth,teeth,thickness,1);
    hull(){
        cylinder(r=hl,h=thickness,center=true);
translate([0,L1,0]) cylinder(r=hl,h=thickness,center=true);        
        }
translate([0,0,-(servo_h-3+thickness)/2])cylinder(r=m/2,h=servo_h-3,$fn=30,center=true);        
    }
//starting difference        
cylinder(r=hole/2,h=thickness*2+servo_h*2,center=true,$fn=15);        
translate([0,L1,0]) cylinder(r=hole/2,h=thickness*2,center=true,$fn=15);               
}
            

//lever2
        translate([L2,-L3,0]){ 
difference(){
union(){    
    hull(){
        cylinder(r=hl,h=thickness,center=true);
translate([0,L1,0]) cylinder(r=hl,h=thickness,center=true);        
        }    
translate([0,0,-(servo_h-3+thickness)/2])cylinder(r=m/2,h=servo_h-3,$fn=30,center=true);                
    }        
cylinder(r=hole/2,h=thickness*2+servo_h*3,center=true,$fn=15);        
translate([0,L1,0]) cylinder(r=hole/2,h=thickness*2,center=true,$fn=15);               
    }
}


}//end of translate right part

translate([-1,-L1/2-5,30]) rotate([0,0,90]) color([1,0,0]) text("L1",size=5);
translate([L2/2,-L1-10,30]) rotate([0,0,90]) color([1,0,0]) text("L2",size=5);
translate([L2,-L1+L3/2-5,30]) rotate([0,0,90]) color([1,0,0]) text("L3",size=5);
translate([L3+L4,-L1-10,30]) rotate([0,0,90]) color([1,0,0]) text("L4",size=5);
translate([L2+L5/2,-L1+L3-8,30]) rotate([0,0,90]) color([1,0,0]) text("L5",size=5);
translate([L2+L5,-L1+L3+1,30]) rotate([0,0,90]) color([1,0,0]) text("L6",size=5);
translate([hl/2,L1/2+2*d+1+7,30]) rotate([0,0,90]) color([1,0,0]) text("m",size=5);

translate([L2+L3+L4+10,-L1,30])rotate([0,0,90])color([1,0,0])text(str("Maximum grip width: ",(d+L1-L3-L6)*2," mm"));

translate([L2+L3+L4+10+20,-L1,30])rotate([0,0,90])color([1,0,0])
{
    if ((L1<(L2-m))||(L3>m)) {text("Minimum grip width: 0"); }
    else 
    {translate([0,-20,0])text(str("Maximum angle: ",acos(m/L1)," degrees"));
      if ((m-L3-L6)<0) text("Minimum grip width: 0");
          else text(str("Minimum grip width: ",(m-L3-L6)," mm"));
        }
    
}    



translate([0,-L1,30])color([1,0,0]) square([1,L1]);
translate([0,-L1,30])color([1,0,0]) square([L2,1]);
translate([L2,-L1,30])color([1,0,0]) square([1,L3]);
translate([L2,-L1,30])color([1,0,0]) square([L4,1]);
translate([L2,-L1+L3,30])color([1,0,0]) square([L5,1]);
translate([L2+L5,-L1+L3,30])color([1,0,0]) square([1,L6]);
translate([-hl,L1/2+2*d+1+5,30])color([1,0,0]) square([m,1]);


/// END OF GRIPPER



//////////////////////////////////////////////////////////////////////////////////////////////
// Public Domain Parametric Involute Spur Gear (and involute helical gear and involute rack)
// version 1.1
// by Leemon Baird, 2011, Leemon@Leemon.com
//http://www.thingiverse.com/thing:5505
//
// This file is public domain.  Use it for any purpose, including commercial
// applications.  Attribution would be nice, but is not required.  There is
// no warranty of any kind, including its correctness, usefulness, or safety.
// 
// This is parameterized involute spur (or helical) gear.  It is much simpler and less powerful than
// others on Thingiverse.  But it is public domain.  I implemented it from scratch from the 
// descriptions and equations on Wikipedia and the web, using Mathematica for calculations and testing,
// and I now release it into the public domain.
//
//		http://en.wikipedia.org/wiki/Involute_gear
//		http://en.wikipedia.org/wiki/Gear
//		http://en.wikipedia.org/wiki/List_of_gear_nomenclature
//		http://gtrebaol.free.fr/doc/catia/spur_gear.html
//		http://www.cs.cmu.edu/~rapidproto/mechanisms/chpt7.html
//
// The module gear() gives an involute spur gear, with reasonable defaults for all the parameters.
// Normally, you should just choose the first 4 parameters, and let the rest be default values.
// The module gear() gives a gear in the XY plane, centered on the origin, with one tooth centered on
// the positive Y axis.  The various functions below it take the same parameters, and return various
// measurements for the gear.  The most important is pitch_radius, which tells how far apart to space
// gears that are meshing, and adendum_radius, which gives the size of the region filled by the gear.
// A gear has a "pitch circle", which is an invisible circle that cuts through the middle of each
// tooth (though not the exact center). In order for two gears to mesh, their pitch circles should 
// just touch.  So the distance between their centers should be pitch_radius() for one, plus pitch_radius() 
// for the other, which gives the radii of their pitch circles.
//
// In order for two gears to mesh, they must have the same mm_per_tooth and pressure_angle parameters.  
// mm_per_tooth gives the number of millimeters of arc around the pitch circle covered by one tooth and one
// space between teeth.  The pitch angle controls how flat or bulged the sides of the teeth are.  Common
// values include 14.5 degrees and 20 degrees, and occasionally 25.  Though I've seen 28 recommended for
// plastic gears. Larger numbers bulge out more, giving stronger teeth, so 28 degrees is the default here.
//
// The ratio of number_of_teeth for two meshing gears gives how many times one will make a full 
// revolution when the the other makes one full revolution.  If the two numbers are coprime (i.e. 
// are not both divisible by the same number greater than 1), then every tooth on one gear
// will meet every tooth on the other, for more even wear.  So coprime numbers of teeth are good.
//
// The module rack() gives a rack, which is a bar with teeth.  A rack can mesh with any
// gear that has the same mm_per_tooth and pressure_angle.
//
// Some terminology: 
// The outline of a gear is a smooth circle (the "pitch circle") which has mountains and valleys
// added so it is toothed.  So there is an inner circle (the "root circle") that touches the 
// base of all the teeth, an outer circle that touches the tips of all the teeth,
// and the invisible pitch circle in between them.  There is also a "base circle", which can be smaller than
// all three of the others, which controls the shape of the teeth.  The side of each tooth lies on the path 
// that the end of a string would follow if it were wrapped tightly around the base circle, then slowly unwound.  
// That shape is an "involute", which gives this type of gear its name.
//
//////////////////////////////////////////////////////////////////////////////////////////////

//An involute spur gear, with reasonable defaults for all the parameters.
//Normally, you should just choose the first 4 parameters, and let the rest be default values.
//Meshing gears must match in mm_per_tooth, pressure_angle, and twist,
//and be separated by the sum of their pitch radii, which can be found with pitch_radius().
module gear (
	mm_per_tooth    = 3,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth = 11,   //total number of teeth around the entire perimeter
	thickness       = 6,    //thickness of gear in mm
	hole_diameter   = 3,    //diameter of the hole in the center, in mm
	twist           = 0,    //teeth rotate this many degrees from bottom of gear to top.  360 makes the gear a screw with each thread going around once
	teeth_to_hide   = 0,    //number of teeth to delete to make this only a fraction of a circle
	pressure_angle  = 28,   //Controls how straight or bulged the tooth sides are. In degrees.
	clearance       = 0.0,  //gap between top of a tooth on one gear and bottom of valley on a meshing gear (in millimeters)
	backlash        = 0.0   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
) {
	pi = 3.1415926;
	p  = mm_per_tooth * number_of_teeth / pi / 2;  //radius of pitch circle
	c  = p + mm_per_tooth / pi - clearance;        //radius of outer circle
	b  = p*cos(pressure_angle);                    //radius of base circle
	r  = p-(c-p)-clearance;                        //radius of root circle
	t  = mm_per_tooth/2-backlash/2;                //tooth thickness at pitch circle
	k  = -iang(b, p) - t/2/p/pi*180; {             //angle to where involute meets base circle on each side of tooth
		difference() {
			for (i = [0:number_of_teeth-teeth_to_hide-1] )
				rotate([0,0,i*360/number_of_teeth])
					linear_extrude(height = thickness, center = true, convexity = 10, twist = twist)
						polygon(
							points=[
								[0, -hole_diameter/10],
								polar(r, -181/number_of_teeth),
								polar(r, r<b ? k : -180/number_of_teeth),
								q7(0/5,r,b,c,k, 1),q7(1/5,r,b,c,k, 1),q7(2/5,r,b,c,k, 1),q7(3/5,r,b,c,k, 1),q7(4/5,r,b,c,k, 1),q7(5/5,r,b,c,k, 1),
								q7(5/5,r,b,c,k,-1),q7(4/5,r,b,c,k,-1),q7(3/5,r,b,c,k,-1),q7(2/5,r,b,c,k,-1),q7(1/5,r,b,c,k,-1),q7(0/5,r,b,c,k,-1),
								polar(r, r<b ? -k : 180/number_of_teeth),
								polar(r, 181/number_of_teeth)
							],
 							paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]]
						);
			cylinder(h=2*thickness+1, r=hole_diameter/2, center=true, $fn=50);
		}
	}
};	
//these 4 functions are used by gear
function polar(r,theta)   = r*[sin(theta), cos(theta)];                            //convert polar to cartesian coordinates
function iang(r1,r2)      = sqrt((r2/r1)*(r2/r1) - 1)/3.1415926*180 - acos(r1/r2); //unwind a string this many degrees to go from radius r1 to radius r2
function q7(f,r,b,r2,t,s) = q6(b,s,t,(1-f)*max(b,r)+f*r2);                         //radius a fraction f up the curved side of the tooth 
function q6(b,s,t,d)      = polar(d,s*(iang(b,d)+t));                              //point at radius d on the involute curve

//a rack, which is a straight line with teeth (the same as a segment from a giant gear with a huge number of teeth).
//The "pitch circle" is a line along the X axis.
module rack (
	mm_per_tooth    = 3,    //this is the "circular pitch", the circumference of the pitch circle divided by the number of teeth
	number_of_teeth = 11,   //total number of teeth along the rack
	thickness       = 6,    //thickness of rack in mm (affects each tooth)
	height          = 120,   //height of rack in mm, from tooth top to far side of rack.
	pressure_angle  = 28,   //Controls how straight or bulged the tooth sides are. In degrees.
	backlash        = 0.0   //gap between two meshing teeth, in the direction along the circumference of the pitch circle
) {
	assign(pi = 3.1415926)
	assign(a = mm_per_tooth / pi) //addendum
	assign(t = a*cos(pressure_angle)-1)         //tooth side is tilted so top/bottom corners move this amount
		for (i = [0:number_of_teeth-1] )
			translate([i*mm_per_tooth,0,0])
				linear_extrude(height = thickness, center = true, convexity = 10)
					polygon(
						points=[
							[-mm_per_tooth * 3/4,                 a-height],
							[-mm_per_tooth * 3/4 - backlash,     -a],
							[-mm_per_tooth * 1/4 + backlash - t, -a],
							[-mm_per_tooth * 1/4 + backlash + t,  a],
							[ mm_per_tooth * 1/4 - backlash - t,  a],
							[ mm_per_tooth * 1/4 - backlash + t, -a],
							[ mm_per_tooth * 3/4 + backlash,     -a],
							[ mm_per_tooth * 3/4,                 a-height],
						],
						paths=[[0,1,2,3,4,5,6,7]]
					);
};	

//These 5 functions let the user find the derived dimensions of the gear.
//A gear fits within a circle of radius outer_radius, and two gears should have
//their centers separated by the sum of their pictch_radius.
function circular_pitch  (mm_per_tooth=3) = mm_per_tooth;                     //tooth density expressed as "circular pitch" in millimeters
function diametral_pitch (mm_per_tooth=3) = 3.1415926 / mm_per_tooth;         //tooth density expressed as "diametral pitch" in teeth per millimeter
function module_value    (mm_per_tooth=3) = mm_per_tooth / pi;                //tooth density expressed as "module" or "modulus" in millimeters
function pitch_radius    (mm_per_tooth=3,number_of_teeth=11) = mm_per_tooth * number_of_teeth / 3.1415926 / 2;
function outer_radius    (mm_per_tooth=3,number_of_teeth=11,clearance=0.1)    //The gear fits entirely within a cylinder of this radius.
	= mm_per_tooth*(1+number_of_teeth/2)/3.1415926  - clearance;              

//////////////////////////////////////////////////////////////////////////////////////////////

