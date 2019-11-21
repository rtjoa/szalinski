use <write/Write.scad> // use <Write.scad>
// preview[view:south, tilt:top]


//write/orbitron.dxf
// CUSTOMIZING

/* [Text] */ //Choose to add text
//Do you want to add text?
show_text="yes"; //[yes,no]
//Text Font
text_font="knewave.dxf";//[knewave.dxf:Knewave, Letters.dxf:Letter, orbitron.dxf:Orbitron, BlackRose.dxf:BlackRose, braille.dxf:Braille]
//What do you want the text to say at first text?
text_itself1="MONEY BANK";
//Rotation of text (in degrees)
textRotate = 0; //[-90:90]

//Text size(height)
text_size = 8; //[8:11]
//Spacing between adjacent letters
//text_spacing=1.5;

//default uploaded image height 10
//image_height = 0; //[-50:50]
  
// Load a 100x100 pixel image. (images will be automatically stretched to fit) Simple, high contrast images like logos work best.
//image_file = "image-surface.dat"; // [image_surface:100x100]
  
//whether embossed(outwards) or engraved(inwards) text
text_allignment="embossed"; //[embossed,engraved]
// Load a 100x100 pixel image. (images will be automatically stretched to fit) Simple, high contrast images like logos work best.
//image_file = "image-surface.dat"; // [image_surface:100x100]

// END CUSTOMIZER
//
// ASSEMBLE BUILDING
//
if(text_allignment=="embossed"){
    union(){
		poly(1);
		if (show_text=="yes") {
		textPart();
		}//end-of-show_text
	}
}
if(text_allignment=="engraved"){
	render()	
difference(){		
		poly(1);
		if (show_text=="yes") {
		textPart1();
		}//end-of-show_text
	}
}
module textPart(){
 rotate(textRotate,[1,0,0]){
	translate([35,0,0.8])
	color("salmon")
	//rotate(-90,[0,1,0])
	rotate(90,[0,0,1])
	rotate(90,[1,0,0])
	write(text_itself1,t=2,bold=0,h=text_size,font=text_font,space=1.3, center = true);

  }
}

module textPart1(){
 rotate(textRotate,[1,0,0]){
	translate([34.2,0,0.8])
	color("salmon")
	//rotate(-90,[0,1,0])
	rotate(90,[0,0,1])
	rotate(90,[1,0,0])
	write(text_itself1,t=2,bold=0,h=text_size,font="Letters.dxf",space=1.3, center = true);

  }
}




module poly(scale) {polyhedron(
 points=[[-2.839590e+001,-5.203150e+001,3.543960e+001],[-3.419596e+001,-5.203150e+001,3.550398e+001],[-3.419596e+001,5.203152e+001,3.550395e+001],[-3.419596e+001,5.203152e+001,3.550395e+001],[-2.839590e+001,5.203152e+001,3.543957e+001],[-2.839590e+001,-5.203150e+001,3.543960e+001],[-3.419596e+001,-5.777379e+001,3.550397e+001],[-2.839590e+001,-5.777380e+001,3.543959e+001],[-2.844324e+001,-5.777379e+001,-3.550396e+001],[-2.844324e+001,-5.777379e+001,-3.550396e+001],[-3.422849e+001,-5.777380e+001,-3.550318e+001],[-3.419596e+001,-5.777379e+001,3.550397e+001],[-2.844324e+001,-5.203151e+001,-2.866945e+001],[-2.839590e+001,-5.203150e+001,3.543960e+001],[-2.839590e+001,5.203152e+001,3.543957e+001],[-2.839590e+001,5.203152e+001,3.543957e+001],[-2.844324e+001,5.203149e+001,-2.866949e+001],[-2.844324e+001,-5.203151e+001,-2.866945e+001],[-3.422849e+001,-5.203152e+001,-3.550318e+001],[-3.419596e+001,-5.203150e+001,3.550398e+001],[-3.419596e+001,-5.777379e+001,3.550397e+001],[-3.419596e+001,-5.777379e+001,3.550397e+001],[-3.422849e+001,-5.777380e+001,-3.550318e+001],[-3.422849e+001,-5.203152e+001,-3.550318e+001],[-2.839590e+001,-5.777380e+001,3.543959e+001],[-3.419596e+001,-5.777379e+001,3.550397e+001],[-3.419596e+001,-5.203150e+001,3.550398e+001],[-3.419596e+001,-5.203150e+001,3.550398e+001],[-2.839590e+001,-5.203150e+001,3.543960e+001],[-2.839590e+001,-5.777380e+001,3.543959e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-3.419596e+001,5.203152e+001,3.550395e+001],[-3.419596e+001,-5.203150e+001,3.550398e+001],[-3.419596e+001,-5.203150e+001,3.550398e+001],[-3.422849e+001,-5.203152e+001,-3.550318e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-2.844324e+001,-5.777379e+001,-3.550396e+001],[-2.839590e+001,-5.777380e+001,3.543959e+001],[2.840958e+001,-5.777380e+001,3.543959e+001],[2.840958e+001,-5.777380e+001,3.543959e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[-2.844324e+001,-5.777379e+001,-3.550396e+001],[-2.839590e+001,-5.203150e+001,3.543960e+001],[-2.844324e+001,-5.203151e+001,-2.866945e+001],[2.843619e+001,-5.203150e+001,-2.866945e+001],[2.843619e+001,-5.203150e+001,-2.866945e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[-2.839590e+001,-5.203150e+001,3.543960e+001],[3.420258e+001,-5.777379e+001,3.550397e+001],[3.422850e+001,-5.777379e+001,-3.550318e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[2.840958e+001,-5.777380e+001,3.543959e+001],[3.420258e+001,-5.777379e+001,3.550397e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[3.422850e+001,-5.777379e+001,-3.550318e+001],[3.420258e+001,-5.777379e+001,3.550397e+001],[3.420258e+001,-5.777379e+001,3.550397e+001],[3.420258e+001,-5.203151e+001,3.550398e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[2.840958e+001,-5.777380e+001,3.543959e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[3.420258e+001,-5.203151e+001,3.550398e+001],[3.420258e+001,-5.203151e+001,3.550398e+001],[3.420258e+001,-5.777379e+001,3.550397e+001],[2.840958e+001,-5.777380e+001,3.543959e+001],[-2.839590e+001,-5.777380e+001,3.543959e+001],[-2.839590e+001,-5.203150e+001,3.543960e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[2.840958e+001,-5.777380e+001,3.543959e+001],[-2.839590e+001,-5.777380e+001,3.543959e+001],[-3.419596e+001,5.777380e+001,3.550394e+001],[-3.422849e+001,5.777377e+001,-3.550317e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[-3.419596e+001,5.777380e+001,3.550394e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-3.422849e+001,5.777377e+001,-3.550317e+001],[-3.419596e+001,5.777380e+001,3.550394e+001],[-3.419596e+001,5.777380e+001,3.550394e+001],[-3.419596e+001,5.203152e+001,3.550395e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[-2.839590e+001,5.203152e+001,3.543957e+001],[-3.419596e+001,5.203152e+001,3.550395e+001],[-3.419596e+001,5.203152e+001,3.550395e+001],[-3.419596e+001,5.777380e+001,3.550394e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[3.420258e+001,5.203151e+001,3.550395e+001],[3.420258e+001,-5.203151e+001,3.550398e+001],[3.420258e+001,-5.203151e+001,3.550398e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[3.420258e+001,5.777379e+001,3.550394e+001],[2.840958e+001,5.777380e+001,3.543956e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[3.422850e+001,5.777377e+001,-3.550317e+001],[3.420258e+001,5.777379e+001,3.550394e+001],[2.843619e+001,5.203149e+001,-2.866949e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[2.840958e+001,-5.203151e+001,3.543960e+001],[2.843619e+001,-5.203150e+001,-2.866945e+001],[2.843619e+001,5.203149e+001,-2.866949e+001],[3.422850e+001,5.203148e+001,-3.550317e+001],[3.420258e+001,5.203151e+001,3.550395e+001],[3.420258e+001,5.777379e+001,3.550394e+001],[3.420258e+001,5.777379e+001,3.550394e+001],[3.422850e+001,5.777377e+001,-3.550317e+001],[3.422850e+001,5.203148e+001,-3.550317e+001],[2.840958e+001,5.777380e+001,3.543956e+001],[3.420258e+001,5.777379e+001,3.550394e+001],[3.420258e+001,5.203151e+001,3.550395e+001],[3.420258e+001,5.203151e+001,3.550395e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[2.840958e+001,5.777380e+001,3.543956e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[3.420258e+001,-5.203151e+001,3.550398e+001],[3.420258e+001,5.203151e+001,3.550395e+001],[3.420258e+001,5.203151e+001,3.550395e+001],[3.422850e+001,5.203148e+001,-3.550317e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[2.840958e+001,5.777380e+001,3.543956e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[-2.839590e+001,5.203152e+001,3.543957e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[-2.839590e+001,5.777381e+001,3.543956e+001],[2.840958e+001,5.777380e+001,3.543956e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[2.843619e+001,5.203149e+001,-2.866949e+001],[-2.844324e+001,5.203149e+001,-2.866949e+001],[-2.844324e+001,5.203149e+001,-2.866949e+001],[-2.839590e+001,5.203152e+001,3.543957e+001],[2.840958e+001,5.203151e+001,3.543957e+001],[-2.844324e+001,5.203149e+001,-2.866949e+001],[2.843619e+001,5.203149e+001,-2.866949e+001],[2.843619e+001,-5.203150e+001,-2.866945e+001],[2.843619e+001,-5.203150e+001,-2.866945e+001],[-2.844324e+001,-5.203151e+001,-2.866945e+001],[-2.844324e+001,5.203149e+001,-2.866949e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[-3.422849e+001,-5.203152e+001,-3.550318e+001],[-3.422849e+001,-5.777380e+001,-3.550318e+001],[-3.422849e+001,-5.777380e+001,-3.550318e+001],[-2.844324e+001,-5.777379e+001,-3.550396e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-3.422849e+001,-5.203152e+001,-3.550318e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[-2.845462e+001,5.203151e+001,-3.550317e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001],[-3.422849e+001,5.777377e+001,-3.550317e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-3.422849e+001,5.203149e+001,-3.550317e+001],[-2.845462e+001,5.203151e+001,-3.550317e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[3.422850e+001,-5.777379e+001,-3.550318e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[2.843833e+001,-5.203151e+001,-3.550318e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[3.422850e+001,5.203148e+001,-3.550317e+001],[2.843833e+001,5.203148e+001,-3.550317e+001],[2.843833e+001,5.203148e+001,-3.550317e+001],[2.843833e+001,-5.203151e+001,-3.550318e+001],[3.422850e+001,-5.203151e+001,-3.550318e+001],[3.422850e+001,5.203148e+001,-3.550317e+001],[3.422850e+001,5.777377e+001,-3.550317e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[2.843833e+001,5.203148e+001,-3.550317e+001],[3.422850e+001,5.203148e+001,-3.550317e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[2.843833e+001,-5.203151e+001,-3.550318e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[-2.844324e+001,-5.777379e+001,-3.550396e+001],[2.843619e+001,-5.777379e+001,-3.550396e+001],[2.843833e+001,-5.203151e+001,-3.550318e+001],[2.843833e+001,5.203148e+001,-3.550317e+001],[-2.845462e+001,5.203151e+001,-3.550317e+001],[-2.845462e+001,5.203151e+001,-3.550317e+001],[-2.845462e+001,-5.203151e+001,-3.550318e+001],[2.843833e+001,-5.203151e+001,-3.550318e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001],[-2.845462e+001,5.203151e+001,-3.550317e+001],[2.843833e+001,5.203148e+001,-3.550317e+001],[2.843833e+001,5.203148e+001,-3.550317e+001],[2.843619e+001,5.777377e+001,-3.550396e+001],[-2.844324e+001,5.777379e+001,-3.550396e+001] ],
triangles=[[0,1,2],[3,4,5],[6,7,8],[9,10,11],[12,13,14],[15,16,17],[18,19,20],[21,22,23],[24,25,26],[27,28,29],[30,31,32],[33,34,35],[36,37,38],[39,40,41],[42,43,44],[45,46,47],[48,49,50],[51,52,53],[54,55,56],[57,58,59],[60,61,62],[63,64,65],[66,67,68],[69,70,71],[72,73,74],[75,76,77],[78,79,80],[81,82,83],[84,85,86],[87,88,89],[90,91,92],[93,94,95],[96,97,98],[99,100,101],[102,103,104],[105,106,107],[108,109,110],[111,112,113],[114,115,116],[117,118,119],[120,121,122],[123,124,125],[126,127,128],[129,130,131],[132,133,134],[135,136,137],[138,139,140],[141,142,143],[144,145,146],[147,148,149],[150,151,152],[153,154,155],[156,157,158],[159,160,161],[162,163,164],[165,166,167],[168,169,170],[171,172,173],[174,175,176],[177,178,179],[180,181,182],[183,184,185],[186,187,188],[189,190,191],[192,193,194],[195,196,197],[198,199,200],[201,202,203]]);}

object1(1);

