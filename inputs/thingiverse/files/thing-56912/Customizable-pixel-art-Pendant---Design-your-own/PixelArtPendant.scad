shape = 6;//[0:Custom,1:SpaceShip,2:Alien1,3:SpaceInvader,4:Heart,5:Bow,6:Mushroom,7:Skull,8:WaitCursor,9:Pacman1,10:Pacman2,11:Potion,12:QuestionMark]

Custom = "[[0,0,0]]";

//Size of the pixel art object
objectSize = 50; 
//Thickness of the pixel art object
objectThickness = 3; 

gridRows = 2*10; //can't find a better to to get the customizer to ignore it 

//Pixel Width
unitWidth = objectSize / gridRows;

holeSize = 1; //resize hole if you set it to 0 there will be no hole
holeLocation = 0; //Change this to move the hole up or down (positive = down, negative = up)
unitLength = unitWidth;
distance = unitWidth;

//Shapes

SpaceShip1 = [[-5,-3,0],[-5,3,0],[-4,-2,0],[-4,2,0],[-3,-1,0],[-3,0,0],[-3,1,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-1,-3,0],[-1,-2,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,2,0],[-1,3,0],[0,-5,0],[0,-4,0],[0,-3,0],[0,-1,0],[0,1,0],[0,3,0],[0,4,0],[0,5,0],[1,-3,0],[1,-2,0],[1,-1,0],[1,0,0],[1,1,0],[1,2,0],[1,3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[3,-1,0],[3,0,0],[3,1,0],[4,-2,0],[4,2,0],[5,-3,0],[5,3,0]];

Alien1 =[[-6,-2,0],[-6,-1,0],[-6,0,0],[-6,1,0],[-6,2,0],[-5,-2,0],[-5,0,0],[-5,2,0],[-4,-2,0],[-4,-1,0],[-4,0,0],[-4,1,0],[-4,2,0],[-3,0,0],[-2,-3,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,3,0],[-1,-4,0],[-1,-3,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,3,0],[-1,4,0],[0,-4,0],[0,-1,0],[0,0,0],[0,1,0],[0,4,0],[1,-5,0],[1,-4,0],[1,-1,0],[1,0,0],[1,1,0],[1,4,0],[1,5,0],[2,-5,0],[2,-1,0],[2,0,0],[2,1,0],[2,5,0],[3,-1,0],[3,0,0],[3,1,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,0,0],[4,1,0],[4,2,0],[4,3,0],[5,-3,0],[5,3,0],[6,-3,0],[6,3,0],[7,-5,0],[7,-4,0],[7,-3,0],[7,3,0],[7,4,0],[7,5,0]];

Alien2 = [[-4,-4,0],[-4,4,0],[-3,-3,0],[-3,3,0],[-2,-4,0],[-2,-3,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,3,0],[-2,4,0],[-1,-4,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,4,0],[0,-4,0],[0,-1,0],[0,0,0],[0,1,0],[0,4,0],[1,-5,0],[1,-4,0],[1,-1,0],[1,0,0],[1,1,0],[1,4,0],[1,5,0],[2,-6,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[3,-7,0],[3,-6,0],[3,-5,0],[3,-4,0],[3,-3,0],[3,-2,0],[3,-1,0],[3,0,0],[3,1,0],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[4,-7,0],[4,-4,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,0,0],[4,1,0],[4,2,0],[4,3,0],[4,4,0],[4,7,0],[5,-7,0],[5,-4,0],[5,4,0],[5,7,0],[6,-3,0],[6,3,0],[7,-2,0],[7,-1,0],[7,1,0],[7,2,0]];


Heart = [[-2,-4,0],[-2,-3,0],[-2,-2,0],[-2,2,0],[-2,3,0],[-2,4,0],[-1,-5,0],[-1,-4,0],[-1,-2,0],[-1,-1,0],[-1,1,0],[-1,2,0],[-1,3,0],[-1,4,0],[-1,5,0],[0,-5,0],[0,-3,0],[0,-2,0],[0,-1,0],[0,0,0],[0,1,0],[0,2,0],[0,3,0],[0,4,0],[0,5,0],[1,-5,0],[1,-3,0],[1,-2,0],[1,-1,0],[1,0,0],[1,1,0],[1,2,0],[1,3,0],[1,4,0],[1,5,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[3,-4,0],[3,-3,0],[3,-2,0],[3,-1,0],[3,0,0],[3,1,0],[3,2,0],[3,3,0],[3,4,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,0,0],[4,1,0],[4,2,0],[4,3,0],[5,-2,0],[5,-1,0],[5,0,0],[5,1,0],[5,2,0],[6,-1,0],[6,0,0],[6,1,0],[7,0,0]];

Mushroom1 = [[-9,-2,0],[-9,-1,0],[-9,0,0],[-9,1,0],[-9,2,0],[-9,3,0],[-8,-4,0],[-8,-3,0],[-8,-2,0],[-8,-1,0],[-8,2,0],[-8,3,0],[-8,4,0],[-8,5,0],[-7,-5,0],[-7,-4,0],[-7,-3,0],[-7,-2,0],[-7,-1,0],[-7,2,0],[-7,3,0],[-7,4,0],[-7,5,0],[-7,6,0],[-6,-6,0],[-6,-5,0],[-6,-3,0],[-6,-2,0],[-6,3,0],[-6,4,0],[-6,6,0],[-6,7,0],[-5,-6,0],[-5,7,0],[-4,-7,0],[-4,-6,0],[-4,-5,0],[-4,6,0],[-4,7,0],[-4,8,0],[-3,-7,0],[-3,-6,0],[-3,-5,0],[-3,-4,0],[-3,5,0],[-3,6,0],[-3,7,0],[-3,8,0],[-2,-7,0],[-2,-6,0],[-2,-5,0],[-2,-4,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,5,0],[-2,6,0],[-2,7,0],[-2,8,0],[-1,-7,0],[-1,-6,0],[-1,-5,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,2,0],[-1,6,0],[-1,7,0],[-1,8,0],[0,-7,0],[0,-6,0],[0,-5,0],[0,-2,0],[0,-1,0],[0,0,0],[0,1,0],[0,2,0],[0,3,0],[0,6,0],[0,7,0],[0,8,0],[1,-7,0],[1,-1,0],[1,0,0],[1,1,0],[1,2,0],[1,8,0],[2,-7,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,8,0],[3,-7,0],[3,-4,0],[3,-1,0],[3,2,0],[3,5,0],[3,8,0],[4,-7,0],[4,-6,0],[4,-5,0],[4,-1,0],[4,2,0],[4,6,0],[4,7,0],[4,8,0],[5,-6,0],[5,-5,0],[5,6,0],[5,7,0],[6,-5,0],[6,6,0],[7,-5,0],[7,-4,0],[7,5,0],[7,6,0],[8,-4,0],[8,-3,0],[8,-2,0],[8,-1,0],[8,0,0],[8,1,0],[8,2,0],[8,3,0],[8,4,0],[8,5,0]];;

Mushroom2 = [[-7,-2,0],[-7,-1,0],[-7,0,0],[-7,1,0],[-7,2,0],[-7,3,0],[-6,-4,0],[-6,-3,0],[-6,4,0],[-6,5,0],[-5,-5,0],[-5,-4,0],[-5,-3,0],[-5,4,0],[-5,5,0],[-5,6,0],[-4,-6,0],[-4,-5,0],[-4,6,0],[-4,7,0],[-3,-6,0],[-3,-5,0],[-3,6,0],[-3,7,0],[-2,-7,0],[-2,-6,0],[-2,-5,0],[-2,-4,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,5,0],[-2,6,0],[-2,7,0],[-2,8,0],[-1,-7,0],[-1,-6,0],[-1,-5,0],[-1,-4,0],[-1,-2,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,2,0],[-1,3,0],[-1,5,0],[-1,6,0],[-1,7,0],[-1,8,0],[0,-7,0],[0,-2,0],[0,-1,0],[0,0,0],[0,1,0],[0,2,0],[0,3,0],[0,6,0],[0,7,0],[0,8,0],[1,-7,0],[1,-1,0],[1,0,0],[1,1,0],[1,2,0],[1,8,0],[2,-7,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,8,0],[3,-7,0],[3,-4,0],[3,-1,0],[3,2,0],[3,5,0],[3,8,0],[4,-7,0],[4,-6,0],[4,-5,0],[4,-4,0],[4,-1,0],[4,2,0],[4,5,0],[4,6,0],[4,7,0],[4,8,0],[5,-6,0],[5,-5,0],[5,6,0],[5,7,0],[6,-5,0],[6,6,0],[7,-5,0],[7,-4,0],[7,5,0],[7,6,0],[8,-4,0],[8,-3,0],[8,-2,0],[8,-1,0],[8,0,0],[8,1,0],[8,2,0],[8,3,0],[8,4,0],[8,5,0]];


Skull1=[[-4,-3,0],[-4,-2,0],[-4,-1,0],[-4,0,0],[-4,1,0],[-4,2,0],[-4,3,0],[-3,-4,0],[-3,-3,0],[-3,-2,0],[-3,-1,0],[-3,0,0],[-3,1,0],[-3,2,0],[-3,3,0],[-3,4,0],[-2,-5,0],[-2,-4,0],[-2,-3,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,3,0],[-2,4,0],[-2,5,0],[-1,-5,0],[-1,-4,0],[-1,0,0],[-1,4,0],[-1,5,0],[0,-5,0],[0,-4,0],[0,0,0],[0,4,0],[0,5,0],[1,-5,0],[1,-4,0],[1,0,0],[1,4,0],[1,5,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[3,-4,0],[3,-3,0],[3,-1,0],[3,1,0],[3,3,0],[3,4,0],[4,-3,0],[4,-1,0],[4,1,0],[4,3,0],[5,-3,0],[5,-1,0],[5,1,0],[5,3,0],[6,-3,0],[6,-1,0],[6,1,0],[6,3,0],[7,-3,0],[7,-2,0],[7,-1,0],[7,0,0],[7,1,0],[7,2,0],[7,3,0]];


Wait1= [[-10,-5,0],[-10,-4,0],[-10,-3,0],[-10,-2,0],[-10,-1,0],[-10,0,0],[-10,1,0],[-10,2,0],[-10,3,0],[-10,4,0],[-10,5,0],[-9,-5,0],[-9,5,0],[-8,-5,0],[-8,-4,0],[-8,-3,0],[-8,-2,0],[-8,-1,0],[-8,0,0],[-8,1,0],[-8,2,0],[-8,3,0],[-8,4,0],[-8,5,0],[-7,-4,0],[-7,4,0],[-6,-4,0],[-6,-2,0],[-6,0,0],[-6,2,0],[-6,4,0],[-5,-4,0],[-5,-1,0],[-5,1,0],[-5,4,0],[-4,-4,0],[-4,0,0],[-4,4,0],[-3,-4,0],[-3,4,0],[-2,-3,0],[-2,-2,0],[-2,0,0],[-2,2,0],[-2,3,0],[-1,-2,0],[-1,-1,0],[-1,1,0],[-1,2,0],[0,-1,0],[0,1,0],[1,-2,0],[1,-1,0],[1,1,0],[1,2,0],[2,-3,0],[2,-2,0],[2,0,0],[2,2,0],[2,3,0],[3,-4,0],[3,4,0],[4,-4,0],[4,0,0],[4,4,0],[5,-4,0],[5,-1,0],[5,1,0],[5,4,0],[6,-4,0],[6,-2,0],[6,0,0],[6,2,0],[6,4,0],[7,-5,0],[7,-4,0],[7,-3,0],[7,-2,0],[7,-1,0],[7,0,0],[7,1,0],[7,2,0],[7,3,0],[7,4,0],[7,5,0],[8,-5,0],[8,5,0],[9,-5,0],[9,-4,0],[9,-3,0],[9,-2,0],[9,-1,0],[9,0,0],[9,1,0],[9,2,0],[9,3,0],[9,4,0],[9,5,0]];

Pacman1 =[[-6,-2,0],[-6,-1,0],[-6,0,0],[-6,1,0],[-6,2,0],[-5,-4,0],[-5,-3,0],[-5,-2,0],[-5,-1,0],[-5,0,0],[-5,1,0],[-5,2,0],[-5,3,0],[-5,4,0],[-4,-5,0],[-4,-4,0],[-4,-3,0],[-4,-2,0],[-4,-1,0],[-4,0,0],[-4,1,0],[-4,2,0],[-4,3,0],[-4,4,0],[-4,5,0],[-3,-5,0],[-3,-4,0],[-3,-3,0],[-3,-2,0],[-3,-1,0],[-3,0,0],[-3,1,0],[-3,2,0],[-3,3,0],[-3,4,0],[-3,5,0],[-2,-6,0],[-2,-5,0],[-2,-4,0],[-2,-3,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,3,0],[-1,-6,0],[-1,-5,0],[-1,-4,0],[-1,-3,0],[-1,-2,0],[-1,-1,0],[-1,0,0],[0,-6,0],[0,-5,0],[0,-4,0],[0,-3,0],[0,-2,0],[1,-6,0],[1,-5,0],[1,-4,0],[1,-3,0],[1,-2,0],[1,-1,0],[1,0,0],[2,-6,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[3,-5,0],[3,-4,0],[3,-3,0],[3,-2,0],[3,-1,0],[3,0,0],[3,1,0],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[4,-5,0],[4,-4,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,0,0],[4,1,0],[4,2,0],[4,3,0],[4,4,0],[4,5,0],[5,-4,0],[5,-3,0],[5,-2,0],[5,-1,0],[5,0,0],[5,1,0],[5,2,0],[5,3,0],[5,4,0],[6,-2,0],[6,-1,0],[6,0,0],[6,1,0],[6,2,0]];

Pacman2 = [[-10,-3,0],[-10,-2,0],[-10,-1,0],[-10,0,0],[-10,1,0],[-10,2,0],[-10,3,0],[-9,-6,0],[-9,-5,0],[-9,-4,0],[-9,-3,0],[-9,-2,0],[-9,-1,0],[-9,0,0],[-9,1,0],[-9,2,0],[-9,3,0],[-9,4,0],[-9,5,0],[-9,6,0],[-8,-6,0],[-8,-5,0],[-8,-4,0],[-8,-3,0],[-8,-2,0],[-8,-1,0],[-8,0,0],[-8,1,0],[-8,2,0],[-8,3,0],[-8,4,0],[-8,5,0],[-8,6,0],[-7,-7,0],[-7,-6,0],[-7,-5,0],[-7,-4,0],[-7,-3,0],[-7,-2,0],[-7,-1,0],[-7,0,0],[-7,1,0],[-7,2,0],[-7,3,0],[-7,4,0],[-7,5,0],[-7,6,0],[-7,7,0],[-6,-8,0],[-6,-7,0],[-6,-6,0],[-6,-5,0],[-6,-4,0],[-6,-3,0],[-6,-2,0],[-6,-1,0],[-6,0,0],[-6,1,0],[-6,2,0],[-6,3,0],[-6,4,0],[-6,5,0],[-6,6,0],[-6,7,0],[-6,8,0],[-5,-8,0],[-5,-7,0],[-5,-6,0],[-5,-5,0],[-5,-4,0],[-5,-3,0],[-5,-2,0],[-5,-1,0],[-5,0,0],[-5,1,0],[-5,2,0],[-5,3,0],[-5,4,0],[-5,5,0],[-5,6,0],[-5,7,0],[-5,8,0],[-4,-8,0],[-4,-7,0],[-4,-6,0],[-4,-2,0],[-4,-1,0],[-4,0,0],[-4,1,0],[-4,2,0],[-4,6,0],[-4,7,0],[-4,8,0],[-3,-9,0],[-3,-8,0],[-3,-7,0],[-3,-1,0],[-3,0,0],[-3,1,0],[-3,7,0],[-3,8,0],[-2,-9,0],[-2,-8,0],[-2,-7,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,7,0],[-2,8,0],[-2,9,0],[-1,-9,0],[-1,-8,0],[-1,-7,0],[-1,-5,0],[-1,-4,0],[-1,-3,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,3,0],[-1,4,0],[-1,5,0],[-1,7,0],[-1,8,0],[-1,9,0],[0,-9,0],[0,-8,0],[0,-7,0],[0,-5,0],[0,-4,0],[0,-3,0],[0,-1,0],[0,0,0],[0,1,0],[0,3,0],[0,4,0],[0,5,0],[0,7,0],[0,8,0],[0,9,0],[1,-9,0],[1,-8,0],[1,-7,0],[1,-5,0],[1,-4,0],[1,-3,0],[1,-1,0],[1,0,0],[1,1,0],[1,3,0],[1,4,0],[1,5,0],[1,7,0],[1,8,0],[1,9,0],[2,-9,0],[2,-8,0],[2,-7,0],[2,-6,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[2,7,0],[2,8,0],[2,9,0],[3,-9,0],[3,-8,0],[3,-7,0],[3,-6,0],[3,-5,0],[3,-4,0],[3,-3,0],[3,-2,0],[3,-1,0],[3,0,0],[3,1,0],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[3,8,0],[3,9,0],[4,-9,0],[4,-8,0],[4,-7,0],[4,-6,0],[4,-5,0],[4,-4,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,0,0],[4,1,0],[4,2,0],[4,3,0],[4,4,0],[4,5,0],[4,6,0],[4,7,0],[4,8,0],[4,9,0],[5,-9,0],[5,-8,0],[5,-7,0],[5,-6,0],[5,-5,0],[5,-4,0],[5,-3,0],[5,-2,0],[5,-1,0],[5,0,0],[5,1,0],[5,2,0],[5,3,0],[5,4,0],[5,5,0],[5,6,0],[5,7,0],[5,8,0],[5,9,0],[6,-9,0],[6,-8,0],[6,-7,0],[6,-6,0],[6,-5,0],[6,-4,0],[6,-3,0],[6,-2,0],[6,-1,0],[6,0,0],[6,1,0],[6,2,0],[6,3,0],[6,4,0],[6,5,0],[6,6,0],[6,7,0],[6,8,0],[6,9,0],[7,-9,0],[7,-8,0],[7,-7,0],[7,-6,0],[7,-5,0],[7,-4,0],[7,-3,0],[7,-2,0],[7,-1,0],[7,0,0],[7,1,0],[7,2,0],[7,3,0],[7,4,0],[7,5,0],[7,6,0],[7,7,0],[7,8,0],[7,9,0],[8,-9,0],[8,-8,0],[8,-7,0],[8,-6,0],[8,-5,0],[8,-2,0],[8,-1,0],[8,0,0],[8,1,0],[8,2,0],[8,5,0],[8,6,0],[8,7,0],[8,8,0],[8,9,0],[9,-8,0],[9,-7,0],[9,-6,0],[9,0,0],[9,6,0],[9,7,0],[9,8,0]];

Bow1 = [[-5,-7,0],[-5,-6,0],[-5,6,0],[-5,7,0],[-4,-8,0],[-4,-5,0],[-4,-4,0],[-4,4,0],[-4,5,0],[-4,8,0],[-3,-8,0],[-3,-3,0],[-3,3,0],[-3,8,0],[-2,-9,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,2,0],[-2,9,0],[-1,-9,0],[-1,-4,0],[-1,-2,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,2,0],[-1,4,0],[-1,9,0],[0,-9,0],[0,-3,0],[0,-2,0],[0,-1,0],[0,0,0],[0,1,0],[0,2,0],[0,3,0],[0,9,0],[1,-9,0],[1,-4,0],[1,-2,0],[1,-1,0],[1,0,0],[1,1,0],[1,2,0],[1,4,0],[1,9,0],[2,-9,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,9,0],[3,-8,0],[3,-3,0],[3,3,0],[3,8,0],[4,-8,0],[4,-5,0],[4,-4,0],[4,4,0],[4,5,0],[4,8,0],[5,-7,0],[5,-6,0],[5,6,0],[5,7,0]];;

Potion = [[-10,-3,0],[-10,-2,0],[-10,-1,0],[-10,0,0],[-10,1,0],[-10,2,0],[-10,3,0],[-9,-3,0],[-9,3,0],[-8,-2,0],[-8,2,0],[-7,-2,0],[-7,2,0],[-6,-2,0],[-6,2,0],[-5,-3,0],[-5,3,0],[-4,-3,0],[-4,2,0],[-4,3,0],[-3,-4,0],[-3,-2,0],[-3,3,0],[-3,4,0],[-2,-4,0],[-2,1,0],[-2,4,0],[-1,-5,0],[-1,2,0],[-1,3,0],[-1,4,0],[-1,5,0],[0,-5,0],[0,-1,0],[0,0,0],[0,1,0],[0,2,0],[0,3,0],[0,4,0],[0,5,0],[1,-6,0],[1,-5,0],[1,-4,0],[1,-3,0],[1,-2,0],[1,-1,0],[1,0,0],[1,1,0],[1,2,0],[1,3,0],[1,4,0],[1,5,0],[1,6,0],[2,-6,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,1,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[3,-7,0],[3,-6,0],[3,-5,0],[3,-4,0],[3,-3,0],[3,-2,0],[3,-1,0],[3,0,0],[3,1,0],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[4,-7,0],[4,-6,0],[4,-5,0],[4,-4,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,0,0],[4,1,0],[4,2,0],[4,3,0],[4,4,0],[4,5,0],[4,6,0],[4,7,0],[5,-8,0],[5,-7,0],[5,-6,0],[5,-5,0],[5,-4,0],[5,-3,0],[5,-2,0],[5,-1,0],[5,0,0],[5,1,0],[5,2,0],[5,3,0],[5,4,0],[5,5,0],[5,6,0],[5,7,0],[5,8,0],[6,-8,0],[6,-7,0],[6,-6,0],[6,-5,0],[6,-4,0],[6,-3,0],[6,-2,0],[6,-1,0],[6,0,0],[6,1,0],[6,2,0],[6,3,0],[6,4,0],[6,5,0],[6,6,0],[6,7,0],[6,8,0],[7,-9,0],[7,-8,0],[7,-7,0],[7,-6,0],[7,-5,0],[7,-4,0],[7,-3,0],[7,-2,0],[7,-1,0],[7,0,0],[7,1,0],[7,2,0],[7,3,0],[7,4,0],[7,5,0],[7,6,0],[7,7,0],[7,8,0],[7,9,0],[8,-9,0],[8,-8,0],[8,-7,0],[8,-6,0],[8,-5,0],[8,-4,0],[8,-3,0],[8,-2,0],[8,-1,0],[8,0,0],[8,1,0],[8,2,0],[8,3,0],[8,4,0],[8,5,0],[8,6,0],[8,7,0],[8,8,0],[8,9,0],[9,-8,0],[9,-7,0],[9,-6,0],[9,-5,0],[9,-4,0],[9,-3,0],[9,-2,0],[9,-1,0],[9,0,0],[9,1,0],[9,2,0],[9,3,0],[9,4,0],[9,5,0],[9,6,0],[9,7,0],[9,8,0]];


QuestionMark = [[-8,-9,0],[-8,-8,0],[-8,-7,0],[-8,-6,0],[-8,-5,0],[-8,-4,0],[-8,-3,0],[-8,-2,0],[-8,-1,0],[-8,0,0],[-8,1,0],[-8,2,0],[-8,3,0],[-8,4,0],[-8,5,0],[-8,6,0],[-8,7,0],[-8,8,0],[-7,-9,0],[-7,-7,0],[-7,-6,0],[-7,-5,0],[-7,-4,0],[-7,-3,0],[-7,-2,0],[-7,-1,0],[-7,0,0],[-7,1,0],[-7,2,0],[-7,3,0],[-7,4,0],[-7,5,0],[-7,6,0],[-7,8,0],[-6,-9,0],[-6,-8,0],[-6,-7,0],[-6,-6,0],[-6,-5,0],[-6,-4,0],[-6,-3,0],[-6,-2,0],[-6,-1,0],[-6,0,0],[-6,1,0],[-6,2,0],[-6,3,0],[-6,4,0],[-6,5,0],[-6,6,0],[-6,7,0],[-6,8,0],[-5,-9,0],[-5,-8,0],[-5,-7,0],[-5,-6,0],[-5,-5,0],[-5,-4,0],[-5,-3,0],[-5,-2,0],[-5,-1,0],[-5,0,0],[-5,1,0],[-5,2,0],[-5,3,0],[-5,4,0],[-5,5,0],[-5,6,0],[-5,7,0],[-5,8,0],[-4,-9,0],[-4,-8,0],[-4,-7,0],[-4,-6,0],[-4,-5,0],[-4,-4,0],[-4,3,0],[-4,4,0],[-4,5,0],[-4,6,0],[-4,7,0],[-4,8,0],[-3,-9,0],[-3,-8,0],[-3,-7,0],[-3,-6,0],[-3,-5,0],[-3,-2,0],[-3,-1,0],[-3,0,0],[-3,1,0],[-3,4,0],[-3,5,0],[-3,6,0],[-3,7,0],[-3,8,0],[-2,-9,0],[-2,-8,0],[-2,-7,0],[-2,-6,0],[-2,-5,0],[-2,-2,0],[-2,-1,0],[-2,0,0],[-2,1,0],[-2,4,0],[-2,5,0],[-2,6,0],[-2,7,0],[-2,8,0],[-1,-9,0],[-1,-8,0],[-1,-7,0],[-1,-6,0],[-1,-5,0],[-1,-2,0],[-1,-1,0],[-1,0,0],[-1,1,0],[-1,4,0],[-1,5,0],[-1,6,0],[-1,7,0],[-1,8,0],[0,-9,0],[0,-8,0],[0,-7,0],[0,-6,0],[0,-5,0],[0,-2,0],[0,-1,0],[0,0,0],[0,1,0],[0,4,0],[0,5,0],[0,6,0],[0,7,0],[0,8,0],[1,-9,0],[1,-8,0],[1,-7,0],[1,-6,0],[1,-5,0],[1,-4,0],[1,-3,0],[1,-2,0],[1,-1,0],[1,0,0],[1,4,0],[1,5,0],[1,6,0],[1,7,0],[1,8,0],[2,-9,0],[2,-8,0],[2,-7,0],[2,-6,0],[2,-5,0],[2,-4,0],[2,-3,0],[2,-2,0],[2,-1,0],[2,0,0],[2,2,0],[2,3,0],[2,4,0],[2,5,0],[2,6,0],[2,7,0],[2,8,0],[3,-9,0],[3,-8,0],[3,-7,0],[3,-6,0],[3,-5,0],[3,-4,0],[3,-3,0],[3,-2,0],[3,-1,0],[3,2,0],[3,3,0],[3,4,0],[3,5,0],[3,6,0],[3,7,0],[3,8,0],[4,-9,0],[4,-8,0],[4,-7,0],[4,-6,0],[4,-5,0],[4,-4,0],[4,-3,0],[4,-2,0],[4,-1,0],[4,2,0],[4,3,0],[4,4,0],[4,5,0],[4,6,0],[4,7,0],[4,8,0],[5,-9,0],[5,-8,0],[5,-7,0],[5,-6,0],[5,-5,0],[5,-4,0],[5,-3,0],[5,-2,0],[5,-1,0],[5,0,0],[5,1,0],[5,2,0],[5,3,0],[5,4,0],[5,5,0],[5,6,0],[5,7,0],[5,8,0],[6,-9,0],[6,-8,0],[6,-7,0],[6,-6,0],[6,-5,0],[6,-4,0],[6,-3,0],[6,-2,0],[6,-1,0],[6,2,0],[6,3,0],[6,4,0],[6,5,0],[6,6,0],[6,7,0],[6,8,0],[7,-9,0],[7,-8,0],[7,-7,0],[7,-6,0],[7,-5,0],[7,-4,0],[7,-3,0],[7,-2,0],[7,-1,0],[7,2,0],[7,3,0],[7,4,0],[7,5,0],[7,6,0],[7,7,0],[7,8,0],[8,-9,0],[8,-7,0],[8,-6,0],[8,-5,0],[8,-4,0],[8,-3,0],[8,-2,0],[8,-1,0],[8,0,0],[8,1,0],[8,2,0],[8,3,0],[8,4,0],[8,5,0],[8,6,0],[8,8,0],[9,-9,0],[9,-8,0],[9,-7,0],[9,-6,0],[9,-5,0],[9,-4,0],[9,-3,0],[9,-2,0],[9,-1,0],[9,0,0],[9,1,0],[9,2,0],[9,3,0],[9,4,0],[9,5,0],[9,6,0],[9,7,0],[9,8,0]];
//You can enter you own shape array here:



//Draw the shape we chose
if (shape == 1)
{
	pixel(SpaceShip1, -6);
}
else if (shape == 2)
{ 
	color("Blue")
	pixel(Alien1, -14);
}
else if (shape == 3)
{
	color("Blue")
	pixel(Alien2, -4.5);
}
else if(shape == 4)
{
	color("red")
	pixel(Heart, 0);
}

else if (shape == 5)
{
	color("red")
	pixel(Bow1, -4);
}

else if (shape == 6)
{
	color("green")
	pixel(Mushroom2, -16);
}

else if (shape == 7)
{
	color("black")
	pixel(Skull1, -8);
}

else if(shape == 8)
{
	color("black")
	pixel(Wait1, -22.5);
}
else if(shape == 9)
{
	pixel(Pacman1, -13);
}
else if(shape == 10)
{
	color("red")
	pixel(Pacman2, -22);
}
else if(shape == 11)
{
	color("blue")
	pixel(Potion, -22.5);
}
else if(shape == 12)
{
	color("green")
	pixel(QuestionMark, -17);
}
else if(shape == 0)
{
	color("red")
	pixel(Custom, -5);
}


//Draw the pixel shape
module pixel(num, holeHight)
{
	rotate(a=[0,90,0])
	{
		difference()
		{
				union()
				{
	 					for(i = num)
    					{
     					translate(i*distance*0.9) //the 0.9 guarantees some overlap
     					cube([unitLength, unitWidth, objectThickness], center = true);  
    					}
				}
		
				translate([holeHight + holeLocation,0,0])
				{
					rotate(a=[0,0,0])
					{
						cube([holeSize, holeSize, objectThickness * 2], center = true);
					}
				}
		}
	}
}


