/* [Preview Settings] */
//V1 by Eloi Maranon 18/05/2019 - Waiting for OCULUS QUEST
//Thanks: reddit/Maerius3 -> VR Chicken. EightBarCode -> Caution Sign.
//Thanks: oculus/VizionVR -> Virtual Zone. 
//10 for performance 60 for build
Build_Quality=60; //[10:60]
//Will apply only when previewing
Caution_Back_Color="Red"; // [Red,Blue,Yellow,Black,Green,Orange,White]
Warning_Color="Yellow"; // [Red,Blue,Yellow,Black,Green,Orange,White]
Plain_Color="White"; // [Red,Blue,Yellow,Black,Green,Orange,White]
Border_Color="Black"; // [Red,Blue,Yellow,Black,Green,Orange,White]
/* [Frame Settings] */
//Frame_Hole="Two"; // [One,Two,No]
//Experimental, change at your own risk []-)
Frame_Width=21.0; // [14.8:A6,21.0:A5,29.7:A4,42.0:A3]
Frame_Height=14.8; // [10.5:A6,14.8:A5,21.0:A4,29.7:A3]
Layer_Weight=0.5; // [0.1:0.1:3]
/* [Settings] */
//Drawing Choice
Drawing_Choice=3; // [1:Ascii,2:Chicken,3:Human]
Font="Arial:style=Bold";
//Language
Language=0; // [0:English,1:Spanish,2:Danish,3:Finnish,4:French,5:Italian]
/* [Hidden] */
Main_Module();
data=[[0, "CAUTION","FREE RANGE","OCULUS QUEST"], //English
 	  [1, "PRECAUCION","OCULUS QUEST","SIN CABLES"], //Spanish	
      [2, "FORSIGTIG","FRIE RANGE","OCULUS QUEST"], //Danish
	  [3, "VAROITUS","OCULUS QUEST","ILMAINEN RANGE"], //Finnish
      [4, "ATTENTION","PORTÉE LIBRE","SANS CÂBLES"], //French
	  [5, "ATTENZIONE","GAMMA LIBERA","NESSUN CAVO"] //Italian
	 ];






module Main_Module(){
	
	difference(){
        union(){
        color(Warning_Color)Draw_Frame_Layer(1);
        color(Plain_Color)Draw_Caution(2);
        if (Drawing_Choice==1) {color(Plain_Color)Draw_Choice_Text(2);}
		if (Drawing_Choice==2) {color(Plain_Color)Draw_Choice_Chicken(2);}
		if (Drawing_Choice==3) {color(Plain_Color)Draw_Choice_Human(2);}
		color(Plain_Color)Draw_Plain_Background(2);
        color(Caution_Back_Color)Draw_Caution_Background(3);
        color(Border_Color)Draw_Borders(4);
		color(Border_Color)Draw_Message(4);
		color(Border_Color)Draw_Oculus(4);
        }
 //       if (Frame_Hole=="One") {
//		Write_Frame_Layer();
//		}
//        else {}
    }
}

module Draw_Frame_Layer(Layer_Order){
     cube([Frame_Width,Frame_Height,Layer_Weight*Layer_Order]);
}

module Draw_Caution(Layer_Order){
    Start_Caution_Width=(Frame_Width/6)*1.6;
    Start_Caution_Height=(Frame_Height/3)*2.2;
    translate([Start_Caution_Width,Start_Caution_Height,0])
    resize([Frame_Width/1.6,Frame_Height/5,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) {
       text(text = data[Language][1], font = Font, size = 3);
        }
}

module Draw_Caution_Background(Layer_Order){
    difference(){
    translate([0,(Frame_Height/3)*2,0])
    cube([Frame_Width,Frame_Height/3,Layer_Weight*Layer_Order]);
    linear_extrude(Layer_Weight*Layer_Order*1.1)
    polygon([[(Frame_Width/9)*0.5,(Frame_Height/3)*2.1],
               [(Frame_Width/9)*2,(Frame_Height/3)*2.1],
               [(Frame_Width/9)*1.25,(Frame_Height/3)*2.9]]);
    Draw_Caution(Layer_Order);
    }
}





module Draw_Choice_Text(Layer_Order){
    Start_Caution_Width=(Frame_Width/100)*5;
    Start_Caution_Height=(Frame_Height/100)*25;
    translate([Start_Caution_Width,Start_Caution_Height,0])
    resize([Frame_Width/3.5,Frame_Height/3.5,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) {
       text(text = "[]-)", font = Font, size = 3);     
 }
}

module Draw_Choice_Chicken(Layer_Order){
    Start_Caution_Width=(Frame_Width/100)*20;
    Start_Caution_Height=(Frame_Height/100)*35;
    translate([Start_Caution_Width,Start_Caution_Height,0])
    resize([Frame_Width/3.1,Frame_Height/3.1,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) {
       VR_Chicken();     
 }
}
module Draw_Choice_Human(Layer_Order){
    Start_Caution_Width=(Frame_Width/100)*20;
    Start_Caution_Height=(Frame_Height/100)*35;
    translate([Start_Caution_Width,Start_Caution_Height,0])
    resize([Frame_Width/2.75,Frame_Height/2.75,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) {
       VR_Human();     
 }
}

module Draw_Plain_Background(Layer_Order){
    translate([(Frame_Width/2.5)*1,0,0])
    cube([(Frame_Width/2.5)*1.5,(Frame_Height/3)*2,Layer_Weight*Layer_Order]);
}

module Draw_Borders(Layer_Order){
    translate([(Frame_Width/9)*0.95,(Frame_Height/3)*2.15])
    resize([Frame_Width/35,Frame_Height/7,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) { 
        text(text = "!", font = Font, size = 3);     
    }
    
}


module Draw_Message(Layer_Order){
    Start_Message_Width=(Frame_Width/2.2);
    Start_Message_Height=(Frame_Height/2.5);
    translate([Start_Message_Width,Start_Message_Height,0])
    resize([Frame_Width/2,Frame_Height/5,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) {
       text(text = data[Language][2], font = Font, size = 3);
        }
}


module Draw_Oculus(Layer_Order){
    Start_Message_Width=(Frame_Width/2.2);
    Start_Message_Height=(Frame_Height/7.5);
    translate([Start_Message_Width,Start_Message_Height,0])
    resize([Frame_Width/2,Frame_Height/5,0])
    linear_extrude(height = Layer_Weight*Layer_Order*1.1) {
       text(text = data[Language][3], font = Font, size = 3);
		
        }
}

module Write_Frame_Layer(){}

module VR_Chicken(){
	polygon(points=[[-108.9375,-140.8125],[-110.8125,-138.3125],[-112.0625,-135.3125],[-112.4375,-133.3125],[-112.1875,-128.3125],[-110.5625,-123.3125],[-108.9375,-120.3125],[-106.5625,-117.3125],[-102.6875,-113.9375],[-100.6875,-112.6875],[-96.6875,-110.9375],[-90.6875,-109.4375],[-85.6875,-108.8125],[-81.6875,-108.8125],[-73.6875,-109.8125],[-69.6875,-109.8125],[-66.6875,-110.1875],[-60.6875,-110.0625],[-55.6875,-108.9375],[-51.6875,-107.1875],[-49.1875,-105.0625],[-48.4375,-103.4375],[-48.4375,-102.6875],[-49.1875,-101.3125],[-50.6875,-100.4375],[-59.6875,-97.6875],[-70.6875,-93.3125],[-75.6875,-90.8125],[-86.6875,-84.3125],[-91.6875,-80.9375],[-98.6875,-75.5625],[-104.6875,-70.3125],[-111.0625,-63.3125],[-115.5625,-57.3125],[-122.1875,-46.3125],[-124.4375,-41.3125],[-127.0625,-34.3125],[-128.9375,-28.3125],[-131.6875,-17.3125],[-135.8125,6.6875],[-137.4375,13.6875],[-140.8125,23.6875],[-143.9375,29.6875],[-145.3125,31.4375],[-146.9375,32.8125],[-148.5625,33.3125],[-149.9375,32.8125],[-150.6875,31.5625],[-150.8125,29.6875],[-149.6875,24.6875],[-149.6875,22.6875],[-150.0625,20.8125],[-151.1875,19.1875],[-153.6875,17.6875],[-155.6875,17.3125],[-157.6875,17.4375],[-161.6875,18.8125],[-164.3125,20.9375],[-166.3125,23.6875],[-168.1875,27.6875],[-169.1875,31.6875],[-169.1875,42.6875],[-167.9375,51.6875],[-168.0625,53.5625],[-168.6875,54.9375],[-169.8125,56.0625],[-170.6875,56.4375],[-177.6875,58.3125],[-185.6875,61.3125],[-191.4375,62.9375],[-192.1875,63.5625],[-192.1875,64.0625],[-191.4375,65.1875],[-185.6875,69.5625],[-181.6875,71.4375],[-177.6875,72.0625],[-175.1875,73.0625],[-175.4375,73.5625],[-176.6875,74.0625],[-178.6875,74.1875],[-182.6875,73.6875],[-190.5625,71.6875],[-192.4375,72.4375],[-193.1875,74.6875],[-193.1875,99.6875],[-192.8125,101.1875],[-191.9375,102.0625],[-190.5625,102.1875],[-179.6875,98.5625],[-177.9375,98.6875],[-177.1875,99.1875],[-177.0625,100.3125],[-179.0625,104.6875],[-180.5625,110.6875],[-181.1875,115.6875],[-181.1875,122.6875],[-180.8125,124.0625],[-179.9375,124.5625],[-177.0625,124.5625],[-175.9375,125.1875],[-175.0625,126.6875],[-173.5625,131.6875],[-172.5625,133.5625],[-171.5625,134.5625],[-171.0625,134.6875],[-170.0625,134.1875],[-167.4375,131.1875],[-165.6875,130.6875],[-164.6875,130.8125],[-162.6875,131.8125],[-155.6875,138.3125],[-151.6875,141.0625],[-146.6875,143.5625],[-141.6875,145.0625],[-139.8125,145.1875],[-139.0625,144.9375],[-137.9375,143.4375],[-137.9375,141.6875],[-139.6875,134.6875],[-139.3125,133.1875],[-138.3125,132.5625],[-136.6875,132.6875],[-132.6875,134.6875],[-126.6875,136.6875],[-122.6875,137.1875],[-118.6875,137.1875],[-117.1875,136.8125],[-116.4375,135.9375],[-116.5625,134.5625],[-119.0625,129.6875],[-120.1875,125.6875],[-120.3125,121.6875],[-119.5625,119.0625],[-118.3125,117.9375],[-116.6875,117.3125],[-108.6875,118.3125],[-102.6875,118.3125],[-100.6875,118.0625],[-99.1875,117.4375],[-98.6875,116.4375],[-99.1875,115.0625],[-105.0625,110.1875],[-105.5625,108.6875],[-105.0625,107.1875],[-103.6875,105.8125],[-97.6875,102.3125],[-94.6875,100.8125],[-88.8125,98.6875],[-87.6875,97.4375],[-88.1875,96.5625],[-89.6875,95.8125],[-95.6875,94.6875],[-98.3125,93.1875],[-98.9375,92.4375],[-99.5625,90.6875],[-99.8125,87.0625],[-100.4375,85.9375],[-101.0625,85.5625],[-102.6875,85.1875],[-116.6875,85.1875],[-118.4375,84.8125],[-119.1875,84.3125],[-118.9375,83.5625],[-118.4375,83.1875],[-114.8125,81.9375],[-113.4375,80.9375],[-112.3125,78.6875],[-112.3125,76.8125],[-112.9375,75.4375],[-114.0625,74.5625],[-117.0625,73.4375],[-117.8125,72.3125],[-117.5625,70.6875],[-115.5625,68.3125],[-113.6875,67.1875],[-111.6875,66.5625],[-101.6875,65.5625],[-94.6875,63.8125],[-89.6875,62.1875],[-77.6875,57.4375],[-76.4375,56.5625],[-76.1875,55.5625],[-77.9375,53.0625],[-78.1875,51.4375],[-77.4375,49.9375],[-75.6875,48.4375],[-70.6875,45.8125],[-66.6875,44.3125],[-52.6875,40.1875],[-36.9375,33.4375],[-36.1875,32.5625],[-36.1875,32.0625],[-37.1875,29.0625],[-35.6875,27.1875],[-20.6875,19.9375],[-13.6875,17.4375],[-6.6875,15.9375],[-0.6875,15.1875],[6.3125,15.8125],[12.3125,17.3125],[16.3125,18.9375],[18.9375,20.9375],[19.9375,22.6875],[20.3125,24.6875],[20.1875,25.6875],[16.0625,38.6875],[13.5625,50.6875],[12.8125,56.6875],[12.8125,68.6875],[13.4375,73.6875],[15.9375,82.6875],[18.5625,89.6875],[20.8125,94.6875],[26.5625,103.6875],[32.3125,110.6875],[38.3125,116.6875],[43.3125,120.6875],[49.3125,123.9375],[52.3125,125.0625],[58.3125,126.5625],[63.3125,127.1875],[66.3125,127.1875],[77.3125,128.6875],[103.3125,135.5625],[109.3125,137.3125],[119.3125,140.8125],[126.3125,144.5625],[133.3125,149.0625],[140.3125,154.3125],[145.3125,158.6875],[152.6875,166.4375],[155.0625,167.8125],[156.0625,167.5625],[156.1875,166.3125],[155.5625,164.6875],[151.1875,157.6875],[140.6875,143.6875],[136.3125,138.6875],[131.3125,133.6875],[123.3125,126.6875],[116.3125,119.6875],[114.8125,117.6875],[114.3125,116.0625],[114.4375,115.4375],[115.4375,114.5625],[117.3125,114.1875],[141.3125,114.1875],[146.3125,113.5625],[150.3125,112.6875],[155.3125,111.3125],[160.3125,109.3125],[166.3125,106.3125],[172.3125,102.5625],[178.3125,97.8125],[185.3125,91.6875],[189.8125,86.9375],[190.1875,85.6875],[188.3125,85.9375],[177.3125,89.9375],[167.3125,92.5625],[155.3125,94.1875],[153.3125,94.1875],[140.3125,92.5625],[131.3125,90.6875],[126.5625,89.1875],[125.8125,88.1875],[126.0625,87.0625],[128.3125,85.1875],[140.3125,78.3125],[150.3125,73.8125],[171.3125,66.1875],[177.3125,64.6875],[185.3125,63.4375],[192.3125,61.9375],[196.1875,60.3125],[197.1875,59.1875],[197.1875,58.0625],[196.1875,57.0625],[194.3125,56.1875],[189.3125,54.8125],[184.3125,54.1875],[173.3125,53.1875],[162.3125,53.4375],[152.3125,52.5625],[140.3125,49.9375],[136.3125,48.6875],[134.8125,47.6875],[134.3125,46.5625],[135.4375,44.3125],[147.3125,34.9375],[151.3125,31.4375],[155.6875,26.6875],[159.8125,20.6875],[160.5625,18.8125],[160.5625,17.5625],[159.8125,16.9375],[158.3125,16.9375],[153.3125,18.3125],[145.3125,21.0625],[135.3125,23.6875],[129.3125,24.1875],[127.0625,23.4375],[126.8125,22.9375],[127.0625,21.5625],[128.3125,19.9375],[131.3125,17.9375],[137.0625,14.8125],[138.0625,12.5625],[137.9375,11.8125],[136.9375,10.4375],[134.3125,8.8125],[127.3125,6.8125],[116.3125,5.4375],[111.3125,4.3125],[107.4375,2.1875],[106.4375,0.5625],[106.4375,-1.3125],[107.4375,-3.3125],[113.3125,-8.9375],[117.3125,-11.6875],[120.3125,-13.1875],[125.8125,-15.3125],[125.0625,-15.9375],[122.3125,-16.6875],[117.3125,-18.8125],[109.3125,-23.4375],[108.0625,-24.6875],[107.8125,-25.3125],[108.0625,-26.5625],[109.3125,-28.0625],[113.0625,-30.6875],[113.8125,-32.0625],[113.5625,-33.0625],[112.3125,-34.0625],[109.3125,-35.3125],[104.3125,-38.0625],[87.3125,-48.9375],[82.3125,-51.4375],[76.3125,-53.5625],[68.3125,-55.3125],[66.5625,-56.1875],[63.5625,-59.3125],[57.9375,-66.3125],[56.1875,-69.3125],[55.1875,-72.3125],[55.0625,-75.3125],[56.5625,-79.3125],[62.9375,-88.3125],[66.6875,-96.3125],[72.3125,-101.5625],[92.3125,-117.0625],[97.8125,-122.3125],[101.3125,-126.3125],[106.3125,-130.1875],[108.3125,-131.0625],[112.3125,-131.3125],[119.3125,-129.5625],[120.1875,-129.4375],[121.1875,-129.8125],[121.1875,-130.6875],[120.8125,-131.3125],[115.1875,-137.3125],[114.0625,-139.3125],[113.0625,-142.3125],[112.3125,-149.3125],[111.4375,-151.3125],[110.0625,-153.1875],[106.3125,-156.3125],[101.3125,-159.6875],[98.3125,-162.3125],[93.1875,-167.8125],[92.9375,-167.8125],[92.8125,-167.0625],[97.4375,-154.3125],[97.6875,-152.5625],[97.3125,-151.5625],[96.8125,-151.3125],[95.3125,-151.4375],[89.3125,-153.4375],[81.3125,-154.1875],[76.3125,-155.4375],[74.8125,-155.4375],[75.5625,-154.1875],[79.3125,-151.5625],[82.3125,-150.3125],[89.3125,-148.5625],[93.0625,-146.0625],[95.4375,-143.3125],[96.5625,-141.3125],[97.4375,-138.3125],[97.1875,-135.3125],[94.9375,-130.3125],[92.0625,-126.3125],[87.3125,-121.3125],[84.3125,-118.6875],[62.3125,-103.5625],[60.3125,-102.4375],[58.3125,-102.0625],[55.3125,-102.5625],[52.3125,-103.9375],[50.3125,-104.4375],[44.3125,-105.4375],[41.3125,-105.4375],[14.3125,-101.8125],[11.3125,-101.8125],[5.3125,-101.0625],[1.3125,-101.3125],[-1.6875,-102.0625],[-4.5625,-103.3125],[-6.9375,-105.4375],[-13.1875,-114.3125],[-17.6875,-118.9375],[-23.6875,-122.8125],[-26.6875,-124.3125],[-30.6875,-125.5625],[-35.6875,-125.8125],[-38.6875,-125.3125],[-41.6875,-123.8125],[-46.6875,-120.0625],[-49.6875,-118.9375],[-50.6875,-118.8125],[-58.6875,-119.8125],[-71.6875,-119.9375],[-72.5625,-120.1875],[-73.6875,-121.0625],[-74.0625,-122.4375],[-73.9375,-123.3125],[-73.5625,-124.3125],[-71.4375,-127.3125],[-66.3125,-133.1875],[-65.8125,-134.3125],[-66.3125,-134.6875],[-68.6875,-133.8125],[-74.6875,-130.0625],[-81.8125,-123.5625],[-84.6875,-121.4375],[-86.6875,-120.8125],[-88.6875,-120.9375],[-90.6875,-121.8125],[-93.4375,-124.3125],[-95.4375,-127.3125],[-96.3125,-129.3125],[-96.8125,-131.3125],[-97.1875,-135.3125],[-96.8125,-138.3125],[-95.6875,-143.0625],[-95.8125,-143.8125],[-96.5625,-143.5625],[-98.4375,-141.3125],[-100.3125,-138.3125],[-101.5625,-135.3125],[-102.1875,-131.3125],[-101.9375,-126.3125],[-102.0625,-125.5625],[-102.6875,-124.8125],[-103.8125,-125.0625],[-105.4375,-126.3125],[-108.0625,-130.3125],[-109.1875,-135.3125],[-108.5625,-140.0625],[-108.5625,-140.5625],[-196.0625,73.1875],[-196.8125,74.6875],[-197.1875,76.6875],[-197.1875,97.6875],[-196.5625,100.4375],[-195.8125,101.1875],[-195.1875,99.6875],[-195.1875,74.6875],[-195.5625,73.4375],[-173.1875,101.1875],[-173.1875,101.1875],[-171.1875,100.1875],[-171.1875,100.1875],[-170.1875,99.1875],[-170.1875,99.1875],[-169.1875,98.1875],[-169.1875,98.1875],[-168.3125,96.4375],[-168.0625,96.4375],[-168.0625,96.9375],[-168.3125,96.9375],[-165.4375,90.1875],[-164.8125,91.0625],[-165.3125,93.5625],[-166.4375,94.3125],[-167.3125,94.1875],[-167.6875,92.6875],[-167.5625,91.6875],[-166.8125,90.4375],[-165.9375,90.0625],[-162.1875,91.0625],[-160.6875,90.4375],[-159.4375,90.8125],[-159.1875,91.3125],[-160.6875,91.9375],[-161.9375,91.5625],[-156.1875,90.0625],[-154.6875,89.4375],[-153.4375,89.8125],[-153.1875,90.3125],[-154.6875,90.9375],[-155.9375,90.5625],[-150.1875,89.0625],[-148.6875,88.4375],[-147.4375,88.8125],[-147.1875,89.3125],[-148.6875,89.9375],[-149.9375,89.5625],[-170.6875,73.1875],[-168.6875,72.8125],[-166.0625,73.1875],[-161.1875,78.0625],[-163.8125,81.0625],[-164.3125,85.6875],[-165.0625,87.1875],[-165.5625,86.9375],[-166.0625,85.6875],[-166.1875,77.6875],[-166.5625,76.3125],[-168.0625,75.4375],[-170.6875,75.3125],[-171.9375,74.8125],[-172.1875,74.0625],[-144.1875,88.0625],[-142.6875,87.4375],[-141.4375,87.8125],[-141.1875,88.3125],[-142.6875,88.9375],[-143.9375,88.5625],[-138.1875,87.0625],[-136.6875,86.3125],[-135.6875,86.3125],[-134.4375,86.8125],[-134.1875,87.3125],[-135.6875,88.0625],[-136.6875,88.0625],[-137.9375,87.5625],[-131.1875,86.0625],[-129.6875,85.4375],[-128.4375,85.8125],[-128.1875,86.3125],[-129.6875,86.9375],[-130.9375,86.5625],[-158.1875,77.0625],[-156.6875,76.3125],[-153.6875,76.1875],[-151.9375,76.5625],[-151.1875,77.3125],[-152.6875,78.0625],[-155.6875,78.1875],[-157.4375,77.8125],[-148.1875,76.0625],[-146.6875,75.3125],[-143.6875,75.1875],[-141.9375,75.5625],[-141.1875,76.3125],[-142.6875,77.0625],[-145.6875,77.1875],[-147.4375,76.8125],[-138.1875,75.0625],[-136.6875,74.3125],[-133.6875,74.1875],[-131.9375,74.5625],[-131.1875,75.3125],[-132.6875,76.0625],[-135.6875,76.1875],[-137.4375,75.8125],[98.8125,-149.8125],[98.8125,-149.8125]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460],[461,462,463,464,465,466,467,468,469],[470,471],[472,473],[474,475],[476,477],[478,479,480,481],[482,483,484,485,486,487,488,489,490],[491,492,493,494,495,496],[497,498,499,500,501,502],[503,504,505,506,507,508],[509,510,511,512,513,514,515,516,517,518,519,520,521,522,523],[524,525,526,527,528,529],[530,531,532,533,534,535,536,537],[538,539,540,541,542,543],[544,545,546,547,548,549,550,551],[552,553,554,555,556,557,558,559],[560,561,562,563,564,565,566,567],[568,569]]);
}


module VR_Human(){
	
	polygon(points=[[-150,-772],[-152.25,-771.25],[-153.125,-770.125],[-153.5,-768.5],[-153.5,-500.5],[-154.25,-497.5],[-156.125,-494.875],[-158,-493.375],[-333,-383.625],[-335,-383.125],[-337,-383.25],[-338,-383.625],[-348,-391],[-482,-497.875],[-533,-538.125],[-570,-567.875],[-582,-577.125],[-614,-602.875],[-626,-612.125],[-628,-613.125],[-628.875,-613.25],[-630.625,-612.75],[-633.25,-610.5],[-745.875,-477.5],[-746.5,-474.75],[-745.75,-473],[-745,-472.25],[-498,-289.25],[-485,-279.5],[-481.75,-276.25],[-480,-273.5],[-359.375,2.5],[-353.375,16.5],[-352.625,19.375],[-353,20.75],[-354.125,21.625],[-355,21.75],[-362,21],[-379,21],[-387,22],[-391,22],[-406,23.875],[-416,25.625],[-431,29.25],[-443,33],[-453,36.75],[-466,42.5],[-478,49.125],[-490,56.625],[-508,70.25],[-514,75.5],[-526,87.5],[-540.5,104.5],[-547.875,114.5],[-553.875,123.5],[-561.25,135.5],[-567.5,146.5],[-577,165.5],[-582.75,178.5],[-591.375,201.5],[-595.375,213.5],[-600.25,229.5],[-608,260.5],[-613.875,290.5],[-617.625,315.5],[-620.5,338.5],[-622.5,358.5],[-622.5,363.5],[-622.875,365.375],[-624.375,367.25],[-627,368],[-675,368],[-676.625,368.375],[-677.75,369.25],[-678.5,371.5],[-678.5,432.5],[-677.75,434.75],[-676.625,435.625],[-675,436],[-475,436.125],[-472.625,437.25],[-471.5,438.625],[-469.375,446.5],[-465,458.5],[-460.5,467.5],[-453.875,478.5],[-451.625,481.5],[-441,493.5],[-432,501.25],[-425,506.375],[-419,510],[-408,515.25],[-401,517.75],[-394,519.375],[-381,520.875],[-370,519.5],[-364,517.875],[-358,515.5],[-351,511.375],[-346,507.375],[-342.5,503.5],[-337.625,496.5],[-335,491.5],[-332.625,485.5],[-331.125,479.5],[-329.5,467.5],[-329.5,462.5],[-331.125,449.5],[-334.375,437.5],[-338,428.5],[-342.5,419.5],[-346.125,413.5],[-352.125,405],[-357,399.5],[-365,391.5],[-369,388],[-376,382.75],[-383,378.375],[-390,374.875],[-400,371],[-409,368.625],[-414,368],[-469,368],[-471.625,367.25],[-472.75,365.375],[-472.875,363.5],[-471.5,350.5],[-471.5,347.5],[-467.5,309.5],[-467.5,306.5],[-461.5,248.5],[-461.5,245.5],[-458.5,215.5],[-457.75,209.5],[-456.75,206.625],[-455.625,205.125],[-454,204],[-441,200.25],[-350,176.75],[-280,158.25],[-259,152.875],[-257,152.625],[-253,153.5],[-243,159],[-228,166.5],[-219,170.375],[-207,174.875],[-201,176.875],[-187,180.75],[-173,183.625],[-170,184.5],[-169.25,184.875],[-168.5,186],[-168.75,187.625],[-169.25,188.5],[-180.375,200.5],[-195.75,220.5],[-205.375,235.5],[-210.5,244.5],[-216.875,257.5],[-220.75,266.5],[-225.375,278.5],[-230.25,294.5],[-234,310.5],[-236.5,326.5],[-237.5,335.5],[-237.5,341.5],[-238.5,349.5],[-238.5,361.5],[-237.5,369.5],[-237.5,374.5],[-235.75,389.5],[-233,404.5],[-227.375,425.5],[-220.875,443.5],[-215,456.5],[-206.625,472.5],[-199.875,483.5],[-195.875,489.5],[-191.375,495.5],[-184.5,504.5],[-173.125,517.5],[-159,531.5],[-148,540.875],[-145,544.5],[-144.125,546.5],[-143.25,550.5],[-141.875,559.5],[-138,578.5],[-132.25,601.5],[-129.375,611.5],[-122.375,632.5],[-119.75,639.5],[-111,660.5],[-103.5,675.5],[-100.125,681.5],[-91.125,696.5],[-84.75,705.5],[-76.25,716.5],[-71,722.5],[-57,736.5],[-48,744],[-42,748.375],[-32,754.75],[-28,757],[-17,762.25],[-7,766.125],[2,768.75],[15,771.25],[21,772],[44,772],[51,771.125],[56,770.375],[67,767.75],[83,762.375],[92,758.5],[99,755],[112,747.375],[121,741.25],[133,731.875],[148,718.5],[159,706.5],[168.375,695.5],[179.75,680.5],[186.875,670.5],[198.25,652.5],[209.5,632.5],[219,613.5],[231.75,584.5],[239.375,564.5],[249.375,535.5],[254.25,519.5],[256.625,510.5],[258,508.125],[259.375,507.25],[262,507.25],[287,513.5],[297,515],[307,515],[318,513.5],[324,511.875],[331,509.375],[342,503.875],[346,501.25],[353,495.75],[360.25,488.5],[364.875,482.5],[370.5,473.5],[372.75,468.5],[375.25,461.5],[395,384.5],[395.875,380.5],[397.5,368.5],[397.5,362.5],[396,350.5],[394.25,343.5],[390,332.5],[384.875,323.5],[380.625,317.5],[378,314.5],[372,308.5],[368,305],[363,301.375],[358,298.25],[351,294.875],[344,292.25],[333,289.25],[85,226.5],[75,225],[62,225],[56,225.75],[46,228.125],[37,231.5],[30,235.125],[26,237.625],[20,242],[13,248.5],[8.625,253.5],[4.875,258.5],[2.5,262.5],[-2.875,273.5],[-5.25,280.5],[-25,358.5],[-26.5,368.5],[-26.5,380.5],[-25,390.5],[-23.375,396.5],[-20.875,403.5],[-15.25,414.5],[-12,419.5],[-7,425.5],[-1,431.5],[3,435],[8,438.625],[12,441],[19,444.5],[25,446.875],[31,448.75],[217,495.875],[218.875,496.75],[220.25,497.875],[220.875,499.5],[220.875,501.5],[220,503.25],[218.625,504.375],[217,504.875],[215,504.75],[49,462.75],[23,455.875],[14,452.25],[9,449.75],[2,445.375],[-4,441],[-12,433.5],[-16.375,428.5],[-20.875,422.5],[-23.375,418.5],[-29,407.5],[-31.375,401.5],[-34,391.5],[-35.5,381.5],[-35.5,367.5],[-34.75,361.5],[-34,357.5],[-29.25,338.5],[-13.5,276.5],[-8.875,264.5],[-6.25,259.5],[-1.75,252.5],[3.625,245.5],[7.125,241.5],[17,233],[24,228.25],[33,223.5],[40,220.625],[44,219.25],[55,216.625],[60,216],[77,216],[82,216.625],[94,219.375],[276,265.5],[277.375,265.375],[278.125,264.75],[277.75,262.5],[276.875,260.5],[266.375,239.5],[257.875,225.5],[245.5,208.5],[242.375,204.5],[231.625,192.375],[222,182.5],[207,169.25],[198,162],[192,157.625],[173,145.25],[160,138],[140,128.75],[123,122.125],[104,116.375],[88,112.625],[78,110.625],[74,110.125],[71.5,109.25],[71,108.125],[72.125,105.5],[76,101.5],[87.375,88.5],[98.875,73.5],[107.125,60.5],[109.375,57.5],[112,54.875],[115,52.75],[118,51.5],[121,50.75],[237,34.125],[251,31.875],[298,25.25],[300,24.75],[312,23.25],[369,14.75],[381,13.25],[383,12.75],[430,6.125],[444,3.875],[505,-4.75],[507,-5.25],[566,-13.5],[568.625,-12.75],[569.875,-11.375],[570.75,-9.5],[584.125,37.5],[585.25,42.5],[584.5,50.5],[584.5,55.5],[585.25,61.5],[587.625,71.5],[589.125,75.5],[591.5,80.5],[596.875,89.5],[600.625,94.5],[605,99.5],[610,104.5],[615,108.875],[621,113.375],[628,117.75],[635,121.5],[649,127.125],[661,130.375],[666,131.375],[682,133],[697,131.375],[702,130.375],[708,128.875],[714,126.5],[721,123],[725,120.625],[731,115.625],[736.75,109.5],[741.375,102.5],[744.375,95.5],[746,89.5],[746.5,85.5],[746.5,74.5],[745.875,69.5],[744.375,63.5],[740.875,54.5],[738.25,49.5],[733.75,42.5],[728,35.5],[720,27.25],[710,19.625],[699,13],[690,8.75],[683,6.125],[677,4.25],[666,1.75],[651,0],[647,-0.125],[644.625,-1.25],[643.5,-2.625],[637.875,-21.5],[589.125,-194.5],[587.875,-197.125],[585.875,-198.375],[584,-198.375],[581,-197.625],[528,-182.625],[524.375,-181.125],[523.25,-179.25],[523.25,-177.5],[529.625,-154.5],[529.625,-153.625],[529,-152.25],[527.875,-151.25],[526,-150.625],[455,-143],[453,-143],[427,-140],[425,-140],[399,-137],[359,-133],[305,-127],[265,-123],[211,-117],[171,-113],[145,-110],[140.125,-110],[137.875,-111.125],[136.5,-113.5],[131.625,-129.5],[124.75,-146.5],[35.375,-350.5],[21,-383.5],[19.75,-387.5],[19.5,-391.5],[20.5,-399.5],[20.5,-420.5],[21.5,-428.5],[21.5,-449.5],[22.5,-457.5],[22.5,-478.5],[23.5,-486.5],[23.5,-506.5],[24.5,-514.5],[24.5,-535.5],[25.5,-543.5],[25.5,-563.5],[26.5,-571.5],[26.5,-593.5],[27.5,-601.5],[27.5,-621.5],[28.5,-629.5],[28.5,-651.5],[29.5,-659.5],[29.5,-679.5],[30.5,-687.5],[30.5,-708.5],[31.5,-716.5],[31.5,-736.5],[32.5,-744.5],[32.625,-768.5],[32.25,-770.125],[30.75,-771.625],[29,-772],[207.375,542.25],[207.375,544.5],[206.375,547.5],[194.75,577.5],[182,605.5],[173.5,621.5],[165.375,635.5],[155.875,650.5],[148.75,660.5],[140.375,671.5],[130,683.5],[115,698.5],[105,707],[92,716.375],[81,722.75],[69,728.375],[59,731.75],[48,734.375],[34,736],[31,736],[17,734.375],[10,732.75],[0,729.375],[-10,724.875],[-19,719.375],[-29,711.875],[-34,707.5],[-43,698.5],[-48.25,692.5],[-52.25,687.5],[-58.75,678.5],[-66.25,666.5],[-72.5,655.5],[-80,639.5],[-88,619.5],[-92.375,606.5],[-98.125,586.5],[-100.625,575.5],[-100.625,574.75],[-100,573.75],[-99.5,573.5],[-98,573.625],[-88,578.5],[-79,582.375],[-58,590],[-45,593.75],[-34,596.5],[-14,600.25],[10,603],[49,603],[59,602],[84,598.375],[104,593.75],[114,590.875],[123,587.875],[140,581.25],[151,576.5],[171,565.875],[192,552.375],[204,543.125],[205.875,542.125],[207,542],[-417,415],[-412,413.625],[-407,413.5],[-400,415.125],[-396,416.75],[-390,420.375],[-385,424.625],[-381.5,428.5],[-377.5,434.5],[-375.125,439.5],[-373,446.5],[-372.5,450.5],[-372.5,453.5],[-373,457.5],[-374.875,463.5],[-376.625,466.5],[-380,470.125],[-383,472.125],[-387,473.875],[-393,475],[-398,474.5],[-404,472.5],[-409,470],[-415,465.875],[-419.375,461.5],[-424.375,454.5],[-426.875,449.5],[-428.375,445.5],[-429.125,442.5],[-429.5,439.5],[-429.5,432.5],[-429.125,429.5],[-427.875,425.5],[-425.5,421.5],[-422,418],[643,44.25],[648,41.875],[653,40.5],[657,40],[662,40],[666,40.5],[669,41.25],[676,43.625],[681,46.125],[685,48.875],[690,53.5],[693.375,57.5],[696.125,62.5],[697.5,66.5],[698.375,71.5],[698.125,74.5],[697,78.5],[694.25,83.375],[690,87.5],[685,90.5],[679,92.5],[675,93],[670,93],[664,92.125],[660,91.125],[655,89.25],[651,87.25],[645,83.125],[642.125,80.5],[639.5,77.5],[636.125,72.5],[634.375,68.5],[633.5,63.5],[633.5,59.5],[633.875,56.5],[634.75,53.5],[636.5,50.5],[639,47.5]],paths=[[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120,121,122,123,124,125,126,127,128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144,145,146,147,148,149,150,151,152,153,154,155,156,157,158,159,160,161,162,163,164,165,166,167,168,169,170,171,172,173,174,175,176,177,178,179,180,181,182,183,184,185,186,187,188,189,190,191,192,193,194,195,196,197,198,199,200,201,202,203,204,205,206,207,208,209,210,211,212,213,214,215,216,217,218,219,220,221,222,223,224,225,226,227,228,229,230,231,232,233,234,235,236,237,238,239,240,241,242,243,244,245,246,247,248,249,250,251,252,253,254,255,256,257,258,259,260,261,262,263,264,265,266,267,268,269,270,271,272,273,274,275,276,277,278,279,280,281,282,283,284,285,286,287,288,289,290,291,292,293,294,295,296,297,298,299,300,301,302,303,304,305,306,307,308,309,310,311,312,313,314,315,316,317,318,319,320,321,322,323,324,325,326,327,328,329,330,331,332,333,334,335,336,337,338,339,340,341,342,343,344,345,346,347,348,349,350,351,352,353,354,355,356,357,358,359,360,361,362,363,364,365,366,367,368,369,370,371,372,373,374,375,376,377,378,379,380,381,382,383,384,385,386,387,388,389,390,391,392,393,394,395,396,397,398,399,400,401,402,403,404,405,406,407,408,409,410,411,412,413,414,415,416,417,418,419,420,421,422,423,424,425,426,427,428,429,430,431,432,433,434,435,436,437,438,439,440,441,442,443,444,445,446,447,448,449,450,451,452,453,454,455,456,457,458,459,460,461,462,463,464,465,466,467,468,469,470,471,472,473,474,475,476,477,478,479,480,481,482,483,484,485,486,487,488,489,490,491,492,493,494,495,496,497,498,499,500,501,502,503,504],[505,506,507,508,509,510,511,512,513,514,515,516,517,518,519,520,521,522,523,524,525,526,527,528,529,530,531,532,533,534,535,536,537,538,539,540,541,542,543,544,545,546,547,548,549,550,551,552,553,554,555,556,557,558,559,560,561,562,563,564,565,566],[567,568,569,570,571,572,573,574,575,576,577,578,579,580,581,582,583,584,585,586,587,588,589,590,591,592,593,594,595,596,597,598,599,600,601],[602,603,604,605,606,607,608,609,610,611,612,613,614,615,616,617,618,619,620,621,622,623,624,625,626,627,628,629,630,631,632,633,634,635,636,637,638,639]]);

	
}