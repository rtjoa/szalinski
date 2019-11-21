/////////
//setup//
/////////

// use this to change the space between the holders for x axis
xSpace = 30;

// the number of holders in the x dimention
xHolders = 2;

// use this to change the space between the holders for z axis
zSpace = 30;

// the number of holders in the z dimention
zHolders = 1;

// the tolerance for holding mounts
holderTolerance = .3;

// the lenth of drawers
lenth = 100;

// for tolerance of printer for wall
wallTolerance = 1;

// the thickness of case wall
caseWallThickness = 2;

// if you want the holders to be auto generated
autoGeneratedHolder = 1;

// with of holder
hWith = 5;

//with of side holders
sHWith = 5;

// the thickness of the backplate
bPThickness = 1;

// the thickness for the Top Holder Plate
TopHolderPlateThickness = 1;

// the overlap of Top Holder Plate
TopHolderPlateOverlap = 5;

// the thickness for the right Holder Plate
rightHolderPlateThickness = 1;

// the overlap of right Holder Plate
rightHolderPlateOverlap = 5;

// the thickness of the drawer walls
dWThickness = 2;

// the thickiness of the drawerbottom
dBThickness = 2;

// the diamiter of the knob
kDiamiter = 10;

// the lenth of the knob
kLenth = 2.5;

// the knob type
knobT = 4;

//the offset of the knob(-offset = down and +offset = up )
knobO = -5;

knobR = 2;

knobPlateThickness = 1;

/////////////
//maincode://
/////////////

xlenthDeterminer = xSpace*xHolders;
zlenthDeterminer = zSpace*zHolders;


    
   //////////
   //drawer//
   //////////
   
    module drawerShell(){
        
        drawerCube1 = [
        
        (xlenthDeterminer - (caseWallThickness*2)) - wallTolerance,
        lenth,
        (zlenthDeterminer - (caseWallThickness*2)) - wallTolerance
        
        ];
        
        drawerCube2 = [
        
        (xlenthDeterminer - (caseWallThickness*2)) - (wallTolerance + (dWThickness * 2)),
        lenth - (dWThickness * 2),
        (zlenthDeterminer - (caseWallThickness*2)) - wallTolerance
        
        ];
        
        difference(){
        
            cube(drawerCube1, center = true);
            translate([0, 0, dBThickness]) cube(drawerCube2, center = true);
        }
    }
    
    
    
    module knob(){
        
        kRadius = kDiamiter / 2;
        
        translate([0, -((lenth/2) + (kLenth/2)), knobO]){
        
            rotate(a = [90, 45, 180]){
                
                if(knobT == 1){
                    
                    cylinder(h = kLenth, r1 = kRadius, r2 = kRadius/knobR, $fn = 4 , center = true);
                    
                }
                    
                else{
                    
                    if(knobT == 2){
                    
                    cylinder(h = kLenth, r1 = kRadius, r2 = kRadius/knobR, $fn = 6 , center = true);
                    
                    }
                    
                    else{
                    
                        if(knobT == 3){
                    
                            cylinder(h = kLenth, r1 = kRadius, r2 = kRadius/knobR, $fn = 8 , center = true);
                    
                        }
                        
                        else{
                    
                            if(knobT == 4){
                    
                                cylinder(h = kLenth, r1 = kRadius, r2 = kRadius/knobR, $fn = 100 , center = true);
                    
                            }
                        }
                    }
                }
            }
            
            if(knobT > 4){
                
                cube([kDiamiter/knobR, kLenth, kDiamiter/knobR] , center = true);
                translate([0, (kLenth/2) - (knobPlateThickness / 2) , 0]) cube([kDiamiter, knobPlateThickness, kDiamiter] , center = true);
                
            }
        }
    }
    
    module drawerShellMain(){
    
    drawerShell();
    knob();
        
    }
    
    translate([xlenthDeterminer, 0, 0])drawerShellMain();