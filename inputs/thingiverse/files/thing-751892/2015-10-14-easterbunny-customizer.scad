//**********************************************
//               my Parametric Easter Bunny
//  (C) 2015  Henning Stoecklein  (hestoeck@gmx.de)
//       Version 14-OCT-2015 optimized for CUSTOMIZER
//
//   Source code and printed objects based on it
//   may be used freely for private purposes only.
//**********************************************

//************ begin of customizable variables **********
// Body Shape
bodyfat  = 0.75 ;	// [0.68:Very slim, 0.75:Slim, 0.85:Medium, 0.93:Fat, 1.0:Very fat]

// Head Size
headsize = 1.1 ;	// [0.9:Small, 1.0:Standard, 1.1:Big, 1.2:Baby look]

// Head up/down direction
headnick = 15 ; // [-15:25]

// Head right/left direction
headyaw  = 0 ; // [-40:40]

// Head sidewards bending
headroll = 0 ; 	// [-20:20]

// Ear length 
earlen    = 0.9 ; // [0.7:Very short, 0.8:Short, 0.9:Medium, 1.0:Long, 1.1:Very long]

// Ear Spread Angle
earspread = 5 ; // [0:30]

// Ear shape 
eartype    = "FLEX" ; // ["FLEX":Curved, "STD":Straight]

// Eye size
eyeradius  = 0.9; // [0.68:Very small, 0.75:Small, 0.8:Medium, 0.9:Big, 1.0:Baby Eyes]

// Neck Size
neckradius = 1.5;	// [0:None, 1.5:Small, 2.0:Standard, 2.9:Big]

// Seat depth water level
seatlevel  = 1;	// [-3:6]

// Tail Size
tailradius  = 2; // [0.8:Very tiny, 1.2:Tiny, 2:Medium, 2.5:Big, 3:Very big]

// Body wall thickness
bodywall  = 0.7; // [0.5:Ultra thin, 0.7:Thin, 0.9:Standard, 1.1:Thick, 1.2:Ultra thick]

//************** end of customizable area ************
//  change lines below only if you know what you're doing...

module hase()
{
  // Körper 
  difference() {
    union() {
      translate ([14.8,0,1]) sphere (r=tailradius, $fn=20, center=true) ;		// tail
  	translate ([-2.5,0,14]) rotate ([headroll,-headnick, headyaw])
		scale ([headsize,  headsize, headsize]) kopf() ;					// head
  	translate ([-2.5,0,13.5]) rotate ([0,-headnick,0]) hals() ;  				// neck

      scale ([1,bodyfat,1]) { 											// body
        hull () {
          translate ([5,0,0]) sphere (r=10, $fn=75, center=true) ;
          translate ([1,0,6]) sphere (r=5, $fn=40, center=true) ;
        }
      }
    }
    scale ([1,bodyfat,1])   							// make body and neck hollow
	  translate ([5,0,0]) sphere (r=10-bodywall, $fn=50, center=true) ;
    translate ([0.3,0,-5+14]) rotate ([0,-15-8,0]) 
	   scale ([1,bodyfat,1]) cylinder (r=2.0, h=6, $fn=20, center=true) ;
  }
}

module halbkugel(rad)								// inner ball half of eye background
{
   difference() {
      sphere (r=rad, $fn=25, $center=true) ;
      translate ([0,25,0]) cube ([50, 50, 50], center=true) ;
   }
}

module flexohrsection(dir, shift, rot, rad1, rad2)		// do 1 slice of the flex ear
{
   height = 1.2;
   translate ([0,dir*shift,0]) rotate ([-rot*dir,0,0])
     difference() {
        translate ([0,0,0])  cylinder (r1=rad1, r2=rad2,h=height, $fn=30, center=true) ;
        translate ([-1,0,0]) cylinder (r1=rad1-0.5, r2=rad2-0.5, h=height+0.1, $fn=30, center=true) ;
        translate ([-5.5,0,0]) cube ([10,20,height+1], center=true) ;
     }
}

module flexohr(dir)								// do the complete flex ear
{
      translate ([0,0,00]) flexohrsection(dir, 0.02, 0, 2.0, 2.03);
      translate ([0,0,01]) flexohrsection(dir, 0.05, 2, 2.03, 2.1);
      translate ([0,0,02]) flexohrsection(dir, 0.12, 7, 2.1, 2.2);
      translate ([0,0,03]) flexohrsection(dir, 0.27, 10, 2.2, 2.33);
      translate ([0,0,04]) flexohrsection(dir, 0.45, 12.5, 2.30, 2.43);
      translate ([0,0,05]) flexohrsection(dir, 0.7, 16.3, 2.43, 2.5);
      translate ([0,0,06]) flexohrsection(dir, 1.02, 19.5, 2.5, 2.56);
      translate ([0,0,07]) flexohrsection(dir, 1.40, 20.5, 2.57, 2.6);
      translate ([0,0,08]) flexohrsection(dir, 1.8, 21.5, 2.61, 2.59);
      translate ([0,0,09]) flexohrsection(dir, 2.2, 21.7, 2.60, 2.47);
      translate ([0,0,10]) flexohrsection(dir, 2.6, 22, 2.48, 2.27);
      translate ([0,0,11]) flexohrsection(dir, 3.0, 22, 2.28, 2.06);
      translate ([0,0,12]) flexohrsection(dir, 3.4, 22, 2.08, 1.77);
      translate ([0,0,13]) flexohrsection(dir, 3.8, 22, 1.8, 1.46);
      translate ([0,0,14]) flexohrsection(dir, 4.2, 22, 1.5, 1.05);
      translate ([0,0,15]) flexohrsection(dir, 4.6, 22, 1.1, 0.55);
      translate ([0,dir*4.7,15.3]) sphere (r=0.62, $fn=20, center=true);
}


module ohrsection(rad1, rad2)						// do 1 slice of the standard ear
{
   height = 1;
   difference() {
      cylinder (r1=rad1, r2=rad2,h=height, $fn=30, center=true) ;
      translate ([-1,0,0]) cylinder (r1=rad1-0.5, r2=rad2-0.5, h=height+0.1, $fn=30, center=true) ;
      translate ([-5.5,0,0]) cube ([10,20,height+1],center=true) ;
   }
}

module ohr()										// do the complete standard ear
{
      translate ([0,0,00]) ohrsection(2.0, 2.03);
      translate ([0,0,01]) ohrsection(2.03, 2.1);
      translate ([0,0,02]) ohrsection(2.1, 2.2);
      translate ([0,0,03]) ohrsection(2.2, 2.33);
      translate ([0,0,04]) ohrsection(2.33, 2.43);
      translate ([0,0,05]) ohrsection(2.43, 2.5);
      translate ([0,0,06]) ohrsection(2.5, 2.56);
      translate ([0,0,07]) ohrsection(2.56, 2.6);
      translate ([0,0,08]) ohrsection(2.6, 2.6);
      translate ([0,0,09]) ohrsection(2.6, 2.5);
      translate ([0,0,10]) ohrsection(2.5, 2.3);
      translate ([0,0,11]) ohrsection(2.3, 2.08);
      translate ([0,0,12]) ohrsection(2.08, 1.8);
      translate ([0,0,13]) ohrsection(1.8, 1.5);
      translate ([0,0,14]) ohrsection(1.5, 1.1);
      translate ([0,0,15]) ohrsection(1.1, 0.6);
      translate ([0,0,15.3]) sphere (r=0.62, $fn=20, center=true);
}

module minko_ohr()		// do not use without number cruncher CPU...
{
   minkowski() {
      ohr() ;
      sphere (r=0.2, $fn=7, center=true) ;
   }
}

module schnauze(dia)		// do the nose "Y"
{
    translate ([0,0,-2]) rotate ([0,0,0]) cylinder (r=dia, h=4, $fn=15, center=true) ;
    translate ([0,-1.5,1.1]) rotate ([60,0,0]) cylinder (r=dia, h=4, $fn=15, center=true) ;
    translate ([0,+1.5,1.1]) rotate ([-60,0,0]) cylinder (r=dia, h=4, $fn=15, center=true) ;
}

module hals()				// do the neck
{
  difference() {			// absolute position like the head
      translate ([1.2,0,-4.5]) scale ([1.3,0.9,1]) cylinder (r=neckradius, h=4, $fn=30, center=true) ;
      translate ([1.2,0,-5]) rotate ([0,-6,0]) scale ([1.1,0.8,1]) 
			cylinder (r=neckradius*2/2.75, h=6.1, $fn=20, center=true) ;
  }
}

module kopf()			// do the head
{
  difference() {			// double diff to allow half domes as eye background
    union() {
      difference() {
        union() {
           hull () {  
            scale ([1.3,0.85,1]) sphere (r=4.9, $fn=50, center=true) ;
            translate ([-2.0,0,0]) scale ([1.3,0.85,1]) sphere (r=3.8, $fn=50, center=true) ;
            translate ([0.73,0,-2-0.5*headnick/15]) scale ([1.3,0.9,1]) sphere (r=3.8, $fn=50, center=true) ;
          } // hull
       } // union

       // Hohlkopf 
       scale ([1.3,0.85,1]) sphere (r=4.4, $fn=30, center=true) ;

       // Schnauzen-Y abziehen
       translate ([-6.7,0,-0.5]) rotate ([0,-10,0]) scale ([0.5,0.5,0.5]) schnauze(0.5) ;
     } // diff

     // Innenseite der Augen
     translate ([-1.5,-3.5,1.1]) rotate([10,0,169]) halbkugel(eyeradius*1.5) ;
     translate ([-1.5, 3.5,1.1]) rotate([10,0, 11]) halbkugel(eyeradius*1.5) ;
   } // union

   // Augen vertieft
   translate ([-1.5,3.8,1.2]) sphere (r=eyeradius, $fn=15, center=true) ;
   translate ([-1.5,-3.8,1.2]) sphere (r=eyeradius, $fn=15, center=true) ;
  } // diff

  if (eartype == "FLEX")
  {
    // Flex-Ohren 
    translate ([3.3,-2.2,2.6]) rotate ([35,10,75-earspread]) scale ([0.8,0.8,earlen]) flexohr(-1) ;
    translate ([3.3,+2.2,2.6]) rotate ([-35,10,-75+earspread]) scale ([0.8,0.8,earlen]) flexohr(1) ;
  } else
  {
     // Gerade Ohren 
     translate ([2.5,-2.2,1.2]) rotate ([5,6,10+earspread]) scale ([0.8,0.8,earlen]) ohr() ;
     translate ([2.5,+2.2,1.2]) rotate ([-5,6,-10-earspread]) scale ([0.8,0.8,earlen]) ohr() ;
  }
}

module sitzhase() 			// do the complete bunny with flat seated body
{
  difference() {
    hase();
    translate ([0,0,seatlevel-17]) cube ([100,100,20], center=true) ;		
//    translate ([0,50,0]) cube ([100,100,100], center=true) ; 		// Cutaway for body debugging...
//    translate ([0,0,24.7]) cube ([100,100,20], center=true) ; 	// Cutaway for head debugging...
  }
}

//ohr() ;								// single ear for debugging
//translate ([0, 8, 0]) flexohr() ;		// single flex ear for debugging

sitzhase() ;							// bunny alive!
