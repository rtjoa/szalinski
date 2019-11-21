// Require OpenSCAD 2016.XX for rotate_extrude(angle)
//   http://download.opensuse.org/repositories/home:/t-paul/Debian_8.0/amd64/
//
// Require the bezier library:
//   http://www.thingiverse.com/thing:2170645
include <bezier.scad>

// The shape precision.
//   Change it to a high value (180) for rendering.
//   Change it to a low value (45) while developing.
//     This will create a rough shape, easy to manage.
precision = 180;

// Precalculated Kappa constant, used to make circle using bezier
//   http://www.whizkidtech.redprince.net/bezier/circle/kappa/
kappa = 0.552285; // (4/3) * (sqrt(2) - 1)

// Parametrised values (in mm).
//   Some combinaison of values are not possible.
//   Feel free to play with those, to create the bottle you are looking for.

// Thickness of the bottle walls. Thicker means more solid bottle, but require more plastic.
wallThickness = 4;
// The height between the base to the beginning of the handle.
//   This value doesn't represent the complete height of the bottle (for simplicity).
bottleHeight = 120;
// The diameter of the "donnut" base.
bottleDiameter = 130;
// The diameter of the tube aka bottle handle.
tubeDiameter = 30;

// Calculated values.
//   Those are pre-calculated to save computation time and simplify the code.
handleRadius= 1 / (2 * sin(45)) * bottleHeight / 2;

tubeHoleDia = tubeDiameter - wallThickness * 2;

outerCircleDia = (bottleDiameter - tubeHoleDia)/2;
innerCircleDia = outerCircleDia - wallThickness*2;


// A 2D shape representing an a disk.
//   This create a tube when extruded.
module tube2d() {
	difference() {
		circle(d = tubeDiameter, $fn = precision);
		circle(d = tubeHoleDia, $fn = precision);
	}
}

// The part of the tube (aka bottle handle) that is strait.
module tubeHandle(returnHole = false) {
	z = sqrt((handleRadius*handleRadius)/2);
	x = handleRadius - z;

	translate([x, 0, z]) {
		rotate([0, 45, 0]) {
			linear_extrude(handleRadius * 2) {
				if (returnHole) {
					circle(d = tubeHoleDia, $fn = precision);
				} else {
					tube2d();
				}
			}
		}
	}	
}

// The complete pipe, from the bottom (inside the bottle) to the top (curved handle).
module tube() {
	// Secion 1 (bottom part, inside bottle)
	rotate([90, 0, 0]) {
		translate([handleRadius, 0, 0]) {
			rotate_extrude(angle=-45, $fn = precision) {
				translate([-handleRadius, 0, 0]) {
					tube2d();
				}
			}
		}
	}

	// Section 2 (middle part, strait tube handle)
	tubeHandle();

	// Section 3 (top part, long curved pipe)
	translate([0, 0, bottleHeight]) {
		rotate([90, 0, 0]) {
			translate([handleRadius, 0, 0]) {
				rotate_extrude(angle=-225, $fn = precision) {
					translate([-handleRadius, 0, 0]) {
						tube2d();
					}
				}
			}
		}
	}
}


// Nicely curved bottle shape, created using the bezier library.
// NOTE: The shape has a hole in its wall to allow the pipe to go through.
module bottleBezier(flat = false) {
	bottomBezierHandle = 35;

	outerKappa = outerCircleDia/2 * kappa;
	innerKappa = innerCircleDia/2 * kappa;

	flatHeight = flat ? outerCircleDia/5 : 0;

	difference() {
		rotate_extrude(angle=360, $fn = precision) {
			// [point 1, bezier 1-2, bezier 2-1, point 2]
			BezPolygon([
				// Outter bottle curves
				//   From the top right corner to the bottom right corner,
				//   defining the curve of the bottle.

				// Point on the side (outer)
				[
					[tubeDiameter/2, bottleHeight], [tubeDiameter/2, bottleHeight/2],
					[bottleDiameter/2, bottleHeight/2], [bottleDiameter/2, 0]
				],

				// Point at the bottom (outer)
				[
					[bottleDiameter/2, 0], [bottleDiameter/2, -outerKappa],
					[(bottleDiameter + tubeHoleDia)/4 + outerKappa, -outerCircleDia/2 + flatHeight], [(bottleDiameter + tubeHoleDia)/4, -outerCircleDia/2 + flatHeight]
				],

				// Point that join with the tube (outer)
				[
					[(bottleDiameter + tubeHoleDia)/4, -outerCircleDia/2 + flatHeight], [(bottleDiameter + tubeHoleDia)/4 - outerKappa, -outerCircleDia/2 + flatHeight],
					[tubeHoleDia/2, -outerKappa], [tubeHoleDia/2, 0]
				],


				// Inner, flat bit (which unite with the tube)
				//   This part is automatically added by linking the last point
				//   of the outter curve with to the first point of the
				//   inner curve of the bottle.
				//   This line is added by the continuity of the polygon (implicit).

				// Inner bottle curves
				//   From the inner bottom right corner to the inner top right corner,
				//   following the outter curve (the handles are lowered so the wall tickness is about right).

				// Point that join with the tube (inner)
				[
					[tubeDiameter/2, 0], [tubeDiameter/2, -innerKappa],
					[(bottleDiameter + tubeHoleDia)/4 - innerKappa, -innerCircleDia/2 + flatHeight], [(bottleDiameter + tubeHoleDia)/4, -innerCircleDia/2 + flatHeight]
				],
				
				// Point at the bottom (inner)
				[
					[(bottleDiameter + tubeHoleDia)/4, -innerCircleDia/2 + flatHeight], [(bottleDiameter + tubeHoleDia)/4 + innerKappa, -innerCircleDia/2 + flatHeight],
					[bottleDiameter/2 - wallThickness, -innerKappa], [bottleDiameter/2 - wallThickness, 0]
				],

				// Point on the side (inner)
				[
					[bottleDiameter/2 - wallThickness, 0], [bottleDiameter/2 - wallThickness, (bottleHeight - wallThickness)/2],
					[tubeHoleDia/2, (bottleHeight - wallThickness)/2], [tubeHoleDia/2, bottleHeight]
				]

				// Top flat bit (which unite with the pipe handle)
				//   This part is automatically added by linking the last point
				//   of the inner curve with to the first point of the
				//   outter curve of the bottle (the first point added in this polygon).
				//   This line is added by the OpenSCAD API to close the polygon (implicit).
				//     https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/Using_the_2D_Subsystem#polygon
				//     "A closed shape is created by returning from the last point specified to the first."
			], precision);
		};
		tubeHandle(true);
	}
}


// Join all parts to create a Klein bottle.
// NOTE: You can switch between bottleConic and bottleBezier to create a different bottle shape.
module bottle() {
	union() {
		tube();
		bottleBezier(true);
	};
}

module halfBottle() {
	difference() {
		bottle();
		translate([0, bottleDiameter/2, 0]) {
			cube([bottleDiameter *2, bottleDiameter, bottleHeight * 3], center = true);
		}
	}
}

bottle();
//halfBottle();
