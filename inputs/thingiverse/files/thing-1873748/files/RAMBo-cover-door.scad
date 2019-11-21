// PRUSA iteration3
// RAMBo cover door
// GNU GPL v3
// Josef Průša <iam@josefprusa.cz> and contributors
// http://www.reprap.org/wiki/Prusa_Mendel
// http://prusamendel.org
// updated by MilanNXT for rambo1.0 electronics

// 2016-11-5 additional Width parameter (x = 0 is for original size)
x = 15;

module body()
{
cube( [ 105.5 , 87.5 + x , 1 ] );  // updated by MilanNXT
cube( [ 105.5 , 2 , 20 ] );  
cube( [ 2 , 87.5 + x, 20 ] );  // updated by MilanNXT

// corner reinforcement
translate( [ 98 , 1 , 0 ] ) cube( [ 7.5 , 5 , 20 ] );   
translate( [ 0.5 , 0.5 , 0 ] ) cube( [ 5 , 6.5 , 20 ] );  
translate( [ 1 , 0 , 0 ] ) cube( [ 10 , 87.5 + x , 6 ] );  // updated by MilanNXT
translate( [ 99.5 , 0 , 0 ] ) cube( [ 6 , 87.5 + x, 7 ] );  // updated by MilanNXT
translate( [ 10 , 0 , 0 ] ) cube( [ 6 , 5 , 6 ] );  

// screw thread body
translate( [ 54 , 2 , 0 ] ) cube( [ 9.5 , 6 , 20 ] );  

// rounded side
translate( [ 0 , 87.5 + x , 4.5 ] ) rotate([0,90,0]) cylinder( h = 105.5, r = 4.5, $fn=30); // updated by MilanNXT

// upper hinge reinforcement
translate( [ 0.5 , 69 + x , -9 ] ) rotate([20,0,0]) cube( [ 26 , 20 , 10 ] );  // updated by MilanNXT
    
// door closing
translate( [ 4 , 3.5 , 16.8 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30);  
translate( [ 102 , 3.5 , 16.8 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.8, r2= 3.5, $fn=30); 

}

module ventilation_holes()
    {
     for ( i = [0 : 9] ){
      translate([46   + (i*5.5), 10.5, -1]) cube([3,19,10]);
      translate([47.5 + (i*5.5),10.5,-1]) cylinder( h = 10, r = 1.5, $fn=30);
      translate([47.5 + (i*5.5),29.5,-1]) cylinder( h = 10, r = 1.5, $fn=30);
    }
}

module cutouts()
{
// door closing screw
translate( [ 58.5 , 4 , 5 ] ) cylinder( h = 17, r = 1.5, $fn=30);  
translate( [ 58.5 , 4 , 18.5 ] ) cylinder( h = 2, r1 = 1.5, r2=1.9, $fn=30); 

ventilation_holes();
translate([0,50,0]) ventilation_holes();
translate([0,25,0]) ventilation_holes();

//additional ventilation holes by MilanNXT
//for (z = [ 1 : floor(x/25) ]) translate([0,50+(z*25),0]) ventilation_holes();

// rounded side cutoff    
translate( [ 26.5 , 87.5 + x, 4.5 ] ) rotate([0,90,0]) cylinder( h = 73, r = 3.5, $fn=30);   // updated by MilanNXT
translate([ 26.5 , 80 + x, 5]) cube([73,19,10]); // updated by MilanNXT
translate([ 26.5 ,82.5 + x, 1]) cube([73,5,10]); // updated by MilanNXT
    
translate( [ 0 , 60 + x, -10 ] ) cube( [ 30 , 30 , 10 ] ); // updated by MilanNXT
translate( [ -1 , 87.5 + x, 0 ] ) cube( [ 22.5 , 10 , 10 ] ); // updated by MilanNXT  

// upper hinge 
translate( [2 , 80 + x, 6] ) cube( [ 19.5, 10 , 10 ] ); // updated by MilanNXT
translate( [-2 , 89.7 + x, 3] ) rotate([70,0,0]) cube( [ 19.5, 10 , 5 ] ); // updated by MilanNXT
translate( [ -5 , 87.5 + x, 4.5 ] ) rotate([0,90,0]) cylinder( h = 26.5, r = 2.5, $fn=30); // updated by MilanNXT

// hinge hole
translate( [ -5 , 87.5 + x, 4.5 ] ) rotate([0,90,0]) cylinder( h = 120, r = 2.6, $fn=30); // updated by MilanNXT

// door closing 
translate( [ 4 , 3.5 , 16.9 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  
translate( [ 102 , 3.5 , 16.9 ] ) rotate([0,0,0]) cylinder( h = 3.2, r1 = 1.2, r2= 2.8, $fn=30);  

// M3 NUT
translate( [55.65 , 0.5, 16] ) cube( [ 5.7, 10 , 2.2 ] );  


translate( [4 , 10, 4] ) cube( [ 4, 65 + x, 5 ] ); // updated by MilanNXT
translate( [101 , 10, 4] ) cube( [ 3, 70 + x, 5 ] ); // updated by MilanNXT

}



module RAMBo_cover_doors()
{
difference()
{
    body();
    cutouts();
    translate( [0 , -20, -3] ) rotate([0,45,45]) cube( [ 30, 30 , 20 ] );  
    }
}
 
RAMBo_cover_doors();
    
    
    
    
    
    
    
    
    
    