$fn = 45;

DRAWER_HEIGHT = 25;
CABINET_WIDTH = 100; // adjustable from ~30-200
CABINET_DEPTH = 80;  // adjustable from ~50-200

// drawer 5, 4 sectons
difference() {
    translate([0,0,0]) cube([CABINET_WIDTH - 6, CABINET_DEPTH - 3, DRAWER_HEIGHT]);
    translate([2,2,2]) cube([CABINET_WIDTH - 10, CABINET_DEPTH - 7, DRAWER_HEIGHT]); 
    translate([(CABINET_WIDTH / 2) - 2, 3, -1]) sphere(2);
}

// dividers
    difference() {
        translate([(CABINET_WIDTH / 2) - 4, 2,0]) cube([2, CABINET_DEPTH - 7, DRAWER_HEIGHT]);
        translate([(CABINET_WIDTH / 2) - 2, 3, -1]) sphere(2);
    }
    translate([0,CABINET_DEPTH / 2 - 4,0]) cube([CABINET_WIDTH - 7, 2,DRAWER_HEIGHT -2]);

// pull handle
translate([(CABINET_WIDTH / 2) - 12,-9,(DRAWER_HEIGHT / 3)]) cube([20, 10, 2]);
translate([(CABINET_WIDTH / 2) - 12,-9,(DRAWER_HEIGHT / 3) -1]) cube([20, 2, 4]);

