//Specify the height
Height = 25 ; // [1:1:500]
//Specify the inner diameter
InnerDiameter = 6 ; // [5:1:6]

2060_ProfileCorner ();

module 2060_ProfileCorner() {
    color ("silver")
    difference () {
        union () {
            translate ([0,0,0]) cube ([20,40,Height]);
            translate ([0,0,0]) cube ([40,20,Height]);
        }
        translate ([10,10,-1]) cylinder(d=InnerDiameter,h=+Height+2);
        translate ([10,30,-1]) cylinder(d=InnerDiameter,h=+Height+2);
        translate ([30,10,-1]) cylinder(d=InnerDiameter,h=+Height+2);

        translate ([0,0,0]) 2020_ProfileCutOut (Height=Height);
        translate ([20,0,0]) 2020_ProfileCutOut (Height=Height);
        translate ([0,0,0]) mirror ([1,0,0]) rotate ([0,0,90]) 2020_ProfileCutOut (Height=Height);
        translate ([0,20,0]) mirror ([1,0,0]) rotate ([0,0,90]) 2020_ProfileCutOut (Height=Height);
        translate ([0,40,0]) mirror ([0,1,0]) 2020_ProfileCutOut (Height=Height);
        translate ([40,20,0]) rotate ([0,0,-90]) mirror ([0,1,0]) 2020_ProfileCutOut (Height=Height);
        translate ([20,40,0]) rotate ([0,0,-90]) mirror ([0,1,0]) 2020_ProfileCutOut (Height=Height);
        translate ([20,20,0]) mirror ([0,1,0]) 2020_ProfileCutOut (Height=Height);

    }
}
module 2020_ProfileCutOut () {    
    union () {
        translate ([10-3.25,-0.5,-1]) cube ([6.5,6,Height+2]);
        hull () {
            translate ([10-6.25,1.35,-1]) cube ([12.5,1,Height+2]);
            translate ([10-3,5,-1]) cube ([6,1,Height+2]);
        }
    }
}