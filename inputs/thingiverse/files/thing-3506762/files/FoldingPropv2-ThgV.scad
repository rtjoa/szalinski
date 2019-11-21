//FoldingPropv1-ThgV.scad
//A parametric generator for folding propellors.

// Created by Hamish Trolove - Feb 2019
//www.techmonkeybusiness.com

//Licensed under a Creative Commons license - attribution
// share alike. CC-BY-SA

//No extra libraries are required and it works under
//OpenSCAD 2015 and later.  This script will not work
//for older versions of OpenSCAD

//Airfoils:
// Points from naca4412.dat in the archive: http://m-selig.ae.illinois.edu/ads/archives/coord_seligFmt.tar.gz
// Not necessarily in the same order as in: http://m-selig.ae.illinois.edu/ads/coord/naca4412.dat


//pitch (inches)
PitchI = 4.5;

//diameter (inches)
DiamI = 9;

//pitch (mm)
PitchM = 0;

//diameter (mm)
DiamM = 0;

//Maximum chord length (mm)
MaxChdW = 19;

//No of stations along blade
Statns = 12;

//Resolution steps between stations
SectRes = 10;  

Pitch = (PitchM > 0)? (PitchM):(PitchI * 25.4);  //Turn pitch values into metric
Diam = (DiamM > 0)? (DiamM):(DiamI * 25.4);  //Turn pitch values into metric

//Pitch adjustment factor hub end
PitchAdjHub = 1;

//Pitch adjustment factor tip end
PitchAdjTip = 1;

//Position of blade centreline on chord (%)
BldCtr = 35;

//Spinner hinge radius at pin
SpinHPinRad = 34;

//Diameter of hinge pin
SpinPinD = 3;

//Blade base diameter
SpinHubD = 6;

//Spinner hinge width
SpinHL = 7;

//Hinge Pin Height Adjuster
SpinHubVTweak = 0.25;

//Holder variables for calculated Blade section parameters.  Ignore these.
Poz1 =0;
Poz2 = 0;
StrtAngi = 0;
EndAngi = 0;
StepLi = 0;
StrtWi = 0;
EndWi = 0; 


// Blade airfoil profile. Change with caution.
Airfoil_points = [[1000,1.3],[950,14.7],[900,27.1],[800,48.9],[700,66.9],[600,81.4],[500,91.9],[400,98],[300,97.6],[250,94.1],[200,88],[150,78.9],[100,65.9],[75,57.6],[50,47.3],[25,33.9],[12.5,24.4],[0,0],[12.5,-14.3],[25,-19.5],[50,-24.9],[75,-27.4],[100,-28.6],[150,-28.8],[200,-27.4],[250,-25],[300,-22.6],[400,-18],[500,-14],[600,-10],[700,-6.5],[800,-3.9],[900,-2.2],[950,-1.6],[1000,-1.3]];

//The following blade width shape is a function taken from an existing blade.
//It should be varied with other functions to suit the needs to the user.
//The variable is a ratio of the position along the blade length.
function BldChrdLen(x) = 1.392*pow(x,4) -1.570*pow(x,3)-2.46*pow(x,2)+3.012*x+0.215;

SectL =  Diam/(2*Statns);  //Length of each section

//Number of steps in the Stub section /This will be calculated for 1/8th of
//blade length or 1.5 * Hub diameter, whichever is bigger
StubSteps = (Diam/(16*SectL)>SpinHPinRad*1.2)?round(Diam/(16*SectL)):round(SpinHubD*1.1/SectL);

BldStubLn = 0.98*StubSteps * SectL;  //The length of the hub section of blade 
//To ensure a manifold join we will reduce the stub length a tiny amount

BldStrtPoint = round((SpinHPinRad+BldStubLn+0.5*SpinHubD)/SectL)-1;



//Function to adjust the pitch angle to match manufactured blades (which are flatter)
function PitchAngAdj(x) = 2*(PitchAdjTip-PitchAdjHub)/Diam*x+PitchAdjHub;


module hub()
{
    translate([0,-SpinHPinRad,-SpinHubVTweak*SpinHubD])
    rotate([0,90,0])
    cylinder (r =0.5*SpinHubD, h = SpinHL, center = true, $fn = 100);
}



module Hubcutter()
{
    //The hubcutter consists of the cylinder to cut the pin hole,
    // two cylinders to shave the hinge body faces 
    union()
    {
        // Pin hole
        translate([0,-SpinHPinRad,-SpinHubVTweak*SpinHubD])
        rotate([0,90,0])
        cylinder (r = 0.5*SpinPinD, h = SpinHL*4, center = true, $fn = 100);
        
        //The two face shavers
        translate([1.5*SpinHL,-SpinHPinRad,-SpinHubVTweak*SpinHubD])
        rotate([0,90,0])
        cylinder (r1 = 0.6*SpinHubD, r2 = 2.5*SpinHubD, h = SpinHL*2, center = true, $fn = 100);
        
        translate([-1.5*SpinHL,-SpinHPinRad,-SpinHubVTweak*SpinHubD])
        rotate([0,90,0])
        cylinder (r1 = 5*SpinHubD, r2 = 0.6*SpinHubD, h = SpinHL*2, center = true, $fn = 100);        

    }
}


module Bladeprofile(StrtAng, EndAng, StepL, StrtW, EndW)
//Parameters being parsed are Start Angle, End Angle, The height of the section
// the start chord length and the end chord length.
{
    echo(StrtAng, EndAng, StepL, StrtW, EndW);
    linear_extrude(height=StepL, scale=EndW/StrtW,twist = EndAng - StrtAng, slices = SectRes)
     rotate([0,0,-StrtAng])  //Position angle
     translate([-BldCtr/100*StrtW,0])  //shift profile to position airfoil centreline
     scale(StrtW) //Base Scale at start
     scale (0.001) polygon(points=Airfoil_points); //Scale profile to unit size)
    
}

module BladeBuilder()
{
    //Step through the sections defined by the number of stations and 
    //Add a section of blade profile.
    union()
    {
    for(i = [BldStrtPoint:Statns-1])
        {
            //calculate the position start and end variables
            // for the particular section
            Poz1 = i*SectL; 
            Poz2 = (i+1)*SectL;
            
            //calculate the chord lengths at the two positions
            StrtWi = BldChrdLen(2*Poz1/Diam)*MaxChdW;
            EndWi = BldChrdLen(2*Poz2/Diam)*MaxChdW;
            
            //calculate the blade angles at the two positions
            StrtAngi = atan(Pitch/(2*PI*Poz1))*PitchAngAdj(Poz1);
            EndAngi = atan(Pitch/(2*PI*Poz2))*PitchAngAdj(Poz2);
            
            translate([0,0,Poz1])Bladeprofile(StrtAngi, EndAngi,SectL,StrtWi, EndWi);
           
            
        }
    }
}

module Hinge()
{
    //To make the hinge we'll use a stub of blade and 
    //the section of the hub to create a hull shape that should
   //merge it tidily.
    hull()
    {
       hub();
       //Blade stub - Width to merge with main blade
       EndWi = BldChrdLen(2*(SpinHPinRad+BldStubLn+0.5*SpinHubD)/Diam)*MaxChdW;
       
        //Blade stub angles and twist.
        EndAngi = atan(Pitch/(2*PI*(SpinHPinRad+BldStubLn+0.5*SpinHubD)))*PitchAngAdj(SpinHPinRad+BldStubLn+0.5*SpinHubD);
        StrtAngi = atan(Pitch/(2*PI*(SpinHPinRad+0.5*SpinHubD)))*PitchAngAdj(SpinHPinRad+0.5*SpinHubD);
        

            translate([0,-SpinHPinRad-0.5*SpinHubD,0])        
            rotate([90,0,0])
            Bladeprofile(StrtAngi, EndAngi, BldStubLn, EndWi, EndWi);

    }
}


translate([0,SpinHPinRad,0])
difference()
{
    union()
    {
        Hinge();
        rotate([90,0,0])BladeBuilder();
    }
    Hubcutter();
}
