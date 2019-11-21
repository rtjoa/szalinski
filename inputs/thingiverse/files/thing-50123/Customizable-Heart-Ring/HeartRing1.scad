//Customizable Heart Ring

//CUSTOMIZER VARIABLES

//(US Ring Sizes)
ring_size = 18.14;//[11.63:0,11.84:0.25,12.04:0.5,12.24:0.75,12.45:1,12.65:1.25,12.85:1.5,13.06:1.75,13.26:2,13.46:2.25,13.67:2.5,13.87:2.75,14.07:3,14.27:3.25,14.48:3.5,14.68:3.75,14.88:4,15.09:4.25,15.29:4.5,15.49:4.75,2215.9:5.25,16.1:5.5,16.31:5.75,16.51:6,16.71:6.25,16.92:6.5,17.12:6.75,17.32:7,17.53:7.25,17.73:7.5,17.93:7.75,18.14:8,18.34:8.25,18.54:8.5,18.75:8.75,18.95:9,19.15:9.25,19.35:9.5,19.56:9.75,19.76:10,19.96:10.25,20.17:10.5,20.37:10.75,20.57:11,20.78:11.25,20.98:11.5,21.18:11.75,21.39:12,21.59:12.25,21.79:12.5,22:12.75,22.2:13,22.4:13.25,22.61:13.5,22.81:13.75,23.01:14,23.22:14.25,23.42:14.5,23.62:14.75,23.83:15,24.03:15.25,24.23:15.5,24.43:15.75,24.64:16]

ring_thickness = 1.6;//[1.6:Normal,2.4:Thick]

ring_width = 8;//[6:12]

num_of_hearts = 9; //[3:11]

//CUSTOMIZER VARIABLES END




module ring() {

difference() {
			cylinder(r=inner_radius+ring_thickness,h=ring_width,$fn = 100,center = true);
			cylinder(r=inner_radius,h=ring_width+1,$fn = 100,center = true);
}

}

module heart (w,h) {
scale (v=[w/171,w/171,1])
translate([0,-78,0])
rotate (a=45, v=[0,0,1])
linear_extrude(height = h,convexity =10, twist =0 )
{
polygon(points=[[0,0],[100,0],[100,50],[50,100],[0,100]], paths=[[0,1,2,3,4]]);
translate([100,50,0])
circle(r=50);
translate([50,100,0])
circle(r=50);
}
}

module circleofhearts ()
{
for (i=[0:num_of_hearts]) {
rotate(a=i*360/num_of_hearts,v=[0,0,1]) {
translate ([0,inner_radius+ring_thickness,0])
rotate(a=90,v=[1,0,0])
heart(heart_size,2*ring_thickness);
}
}

}

//Main Part Here
inner_radius = ring_size/2;
pi = 3.1415;

heart_size = min(ring_width*0.8, 2*inner_radius*pi/num_of_hearts);

translate ([0,0,ring_width/2])
difference () {
ring();
circleofhearts ();
}

