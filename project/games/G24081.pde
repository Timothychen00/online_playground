 let map_status = 1 ; let last_mouse_locationX , last_mouse_locationY ; let relative_moveX = 0 ; let relative_moveY = 0 ; let prompt_moveX = 0 ; let prompt_moveY = 0 ; let relative_movement = 0 ; let zoom = 0.5; let sauce_data = [ ] ; let sauce_on_pizza = [ ] ; let mouse_selection = "None" ; //zoom=1 , width=1080;
let A1 , A2 , A3 , A4 , A5 , A6 , A7 , sauces_l , sausage_l , cheese_l , meat_l , mushroom_l , onion_l , dough ; let imageArray = new Array(7); function setup ( ) { //sauces_l = loadImage("sauces_l.png");
//sausage_l = loadImage("sausage_l.png");
//cheese_l = loadImage("cheese_l.png");
//meat_l = loadImage("meat_l.png");
//mushroom_l = loadImage("mushroom_l.png");
//onion_l = loadImage("onion_l.png");
//dough=loadImage("dough.png");
; //println(screen_width);
//screen_height=floor(screen_width*0.625);
//println(width*0.12*zoom);
//println(width*0.51*zoom);
//println(str(width*(0.07)+height*(0.32)));
//  println(str(width*(0.07)+height*(0.32)-height*0.04+height*0.2));
//size(screen_width,screen_height);
createCanvas( 720 , 450 ) ; //fullScreen();
//println(displayWidth, displayHeight);
//size(990,540);
//1980/1080=1.83
let temp [ ] = [ "0" , str( width* 0.12* zoom) , str( width* 0.51* zoom) , str( height* 0.4* zoom) , str( height* 0.8* zoom) , "1" , str( width* 0.52* zoom) , str( width* 0.76* zoom) , str( height* 0.4* zoom) , str( height* 0.8* zoom) , "2" , str( width* 0.78* zoom) , str( width* 1.03* zoom) , str( height* 0.4* zoom) , str( height* 0.8* zoom) , "3" , str( width* 1.05* zoom) , str( width* 1.3* zoom) , str( height* 0.4* zoom) , str( height* 0.8* zoom) , "4" , str( width* 1.05* zoom) , str( width* 1.3* zoom) , str( height* 0.8* zoom) , str( height* 1.2* zoom) , "5" , str( width* 1.05* zoom) , str( width* 1.3* zoom) , str( height* 1.25* zoom) , str( height* 1.65* zoom) , "6" , str( width* 0.12* zoom) , str( width* 0.5* zoom) , str( height* 0.83* zoom) , str( height* 1.9* zoom) ] ; for ( let i = 0 ; i< temp . length; i++ ) { sauce_data= append( sauce_data, temp[ i] ) ; } } function preload() {A1= loadImage( "sauces.png" ) ; A2= loadImage( "sausage.png" ) ; A3= loadImage( "cheese.png" ) ; A4= loadImage( "meat.png" ) ; A5= loadImage( "mushroom.png" ) ; A6= loadImage( "onion.png" ) ; A7= loadImage( "dough.png" ) ; imageArray[ 0 ] = loadImage( "sauces_l.png" ) ; imageArray[ 1 ] = loadImage( "sausage_l.png" ) ; imageArray[ 2 ] = loadImage( "cheese_l.png" ) ; imageArray[ 3 ] = loadImage( "meat_l.png" ) ; imageArray[ 4 ] = loadImage( "mushroom_l.png" ) ; imageArray[ 5 ] = loadImage( "onion_l.png" ) ; imageArray[ 6 ] = loadImage( "dough.png" ) ; }let a = false ; function back_ground ( ) { background( 222 , 165 , 162 ) ; for ( let i = 0 ; i< 20 ; i++ ) { for ( let k = 0 ; k< 20 ; k++ ) { if ( a== false ) { if ( k% 2 == 1 ) { noStroke( ) ; fill( 245 , 237 , 235 ) ; rect( i* height* 0.17, k* height* 0.17, height* 0.17, height* 0.17) ; } } else if ( a== true ) { if ( k% 2 == 0 ) { noStroke( ) ; fill( 245 , 237 , 235 ) ; rect( i* height* 0.17, k* height* 0.17, height* 0.17, height* 0.17) ; } } } if ( a== false ) { a= true ; } else if ( a== true ) { a= false ; } } } function Map ( ) { stroke( 0 , 0 , 0 ) ; fill( 227 , 224 , 222 ) ; rect( width* ( 0.07) + height* ( 0.9) , height* ( 0.18) , width* ( 0.05) , height* ( 0.8) , 13 ) ; fill( "#faefe8" ) ; rect( width* ( 0.05) , height* ( 0.18) , width* ( 0.05) + height* ( 0.9) , height* ( 0.8) , 13 ) ; //A1
fill( 169 , 155 , 201 ) ; rect( width* ( 0.06) , height* ( 0.18) + width* ( 0.01) , height* ( 0.3) , height* ( 0.20) ) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.06) , height* ( 0.18) + width* ( 0.01) , height* ( 0.3) , height* ( 0.18) ) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.06) + height* ( 0.02) , height* ( 0.2) + width* ( 0.01) , height* ( 0.26) , height* ( 0.14) ) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.06) + height* ( 0.02) , height* ( 0.2) + width* ( 0.01) , height* ( 0.26) , height* ( 0.02) ) ; A1 . resize( floor( 292 * zoom) , floor( 120 * zoom) ) ; image( A1, width* ( 0.02) + height* ( 0.02) , height* ( 0.208) + width* ( 0.01) ) ; //A2
fill( 169 , 155 , 201 ) ; rect( width* ( 0.07) + height* ( 0.30) , height* ( 0.18) + width* ( 0.01) , height* ( 0.20) , height* ( 0.20) ) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.07) + height* ( 0.30) , height* ( 0.18) + width* ( 0.01) , height* ( 0.20) , height* ( 0.18) ) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.07) + height* ( 0.32) , height* ( 0.20) + width* ( 0.01) , height* ( 0.16) , height* ( 0.14) ) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.07) + height* ( 0.32) , height* ( 0.20) + width* ( 0.01) , height* ( 0.16) , height* ( 0.02) ) ; A2 . resize( floor( 147 * zoom) , floor( 128 * zoom) ) ; image( A2, width* ( 0.07) + height* ( 0.32) , height* ( 0.20) + width* ( 0.01) ) ; //A3
fill( 169 , 155 , 201 ) ; rect( width* ( 0.08) + height* ( 0.50) , height* ( 0.18) + width* ( 0.01) , height* ( 0.20) , height* ( 0.20) ) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.08) + height* ( 0.50) , height* ( 0.18) + width* ( 0.01) , height* ( 0.20) , height* ( 0.18) ) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.08) + height* ( 0.52) , height* ( 0.20) + width* ( 0.01) , height* ( 0.16) , height* ( 0.14) ) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.08) + height* ( 0.52) , height* ( 0.20) + width* ( 0.01) , height* ( 0.16) , height* ( 0.02) ) ; A3 . resize( floor( 147 * zoom) , floor( 128 * zoom) ) ; image( A3, width* ( 0.081) + height* ( 0.52) , height* ( 0.20) + width* ( 0.01) ) ; //A4
fill( 169 , 155 , 201 ) ; rect( width* ( 0.09) + height* ( 0.70) , height* ( 0.18) + width* ( 0.01) , height* ( 0.20) , height* ( 0.20) ) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.09) + height* ( 0.70) , height* ( 0.18) + width* ( 0.01) , height* ( 0.20) , height* ( 0.18) ) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.09) + height* ( 0.72) , height* ( 0.20) + width* ( 0.01) , height* ( 0.16) , height* ( 0.14) ) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.09) + height* ( 0.72) , height* ( 0.20) + width* ( 0.01) , height* ( 0.16) , height* ( 0.02) ) ; A4 . resize( floor( 127 * zoom) , floor( 128 * zoom) ) ; image( A4, width* ( 0.09) + height* ( 0.72) , height* ( 0.20) + width* ( 0.01) ) ; //A5
fill( 169 , 155 , 201 ) ; rect( width* ( 0.09) + height* ( 0.70) , height* ( 0.38) + width* ( 0.02) , height* ( 0.20) , height* ( 0.20) ) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.09) + height* ( 0.70) , height* ( 0.38) + width* ( 0.02) , height* ( 0.20) , height* ( 0.18) ) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.09) + height* ( 0.72) , height* ( 0.40) + width* ( 0.02) , height* ( 0.16) , height* ( 0.14) ) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.09) + height* ( 0.72) , height* ( 0.40) + width* ( 0.02) , height* ( 0.16) , height* ( 0.02) ) ; A5 . resize( floor( 147 * zoom) , floor( 128 * zoom) ) ; image( A5, width* ( 0.091) + height* ( 0.72) , height* ( 0.40) + width* ( 0.02) ) ; //A6
fill( 169 , 155 , 201 ) ; rect( width* ( 0.09) + height* ( 0.70) , height* ( 0.58) + width* ( 0.03) , height* ( 0.20) , height* ( 0.20) ) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.09) + height* ( 0.70) , height* ( 0.58) + width* ( 0.03) , height* ( 0.20) , height* ( 0.18) ) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.09) + height* ( 0.72) , height* ( 0.60) + width* ( 0.03) , height* ( 0.16) , height* ( 0.14) ) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.09) + height* ( 0.72) , height* ( 0.60) + width* ( 0.03) , height* ( 0.16) , height* ( 0.02) ) ; A6 . resize( floor( 147 * zoom) , floor( 128 * zoom) ) ; image( A6, width* ( 0.09) + height* ( 0.721) , height* ( 0.60) + width* ( 0.03) ) ; //flour
fill( 169 , 155 , 201 ) ; rect( width* ( 0.06) , height* ( 0.38) + width* ( 0.02) , height* 0.3, height* 0.55) ; fill( 204 , 190 , 237 ) ; rect( width* ( 0.06) , height* ( 0.38) + width* ( 0.02) , height* 0.3, height* 0.53) ; fill( 139 , 128 , 166 ) ; rect( width* ( 0.06) + height* ( 0.02) , height* ( 0.40) + width* ( 0.02) , height* 0.26, height* 0.49) ; fill( 169 , 155 , 201 ) ; rect( width* ( 0.06) + height* ( 0.02) , height* ( 0.40) + width* ( 0.02) , height* 0.26, height* 0.02) ; //blanket
fill( 240 , 188 , 151 ) ; noStroke( ) ; rect( width* ( 0.18) + height* ( 0.3) , height* ( 0.38) + width* ( 0.26) , width* ( 0.02) + height* ( 0.04) , width* ( 0.09) , 40 ) ; rect( width* ( 0.07) + height* ( 0.3) , height* ( 0.38) + width* ( 0.02) , width* ( 0.26) , width* ( 0.26) , 70 ) ; stroke( 250 , 237 , 227 ) ; rect( width* ( 0.07) + height* ( 0.32) , height* ( 0.4) + width* ( 0.02) , width* ( 0.26) - height* ( 0.04) , width* ( 0.26) - height* ( 0.04) , 70 ) ; //oven
stroke( 0 , 0 , 0 ) ; fill( 83 , 83 , 99 ) ; rect( width* ( 0.733) , height* ( 0.188) , width* ( 0.16) , width* ( 0.013) , 20 ) ; fill( 114 , 114 , 135 ) ; rect( width* ( 0.733) , height* ( 0.193) , width* ( 0.16) , width* ( 0.013) , 20 ) ; fill( 173 , 173 , 199 ) ; rect( width* ( 0.735) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.755) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.775) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.795) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.815) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.835) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.855) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.875) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; fill( 83 , 83 , 99 ) ; rect( width* ( 0.733) , height* ( 0.785) , width* ( 0.16) , width* ( 0.013) , 20 ) ; fill( 114 , 114 , 135 ) ; rect( width* ( 0.733) , height* ( 0.790) , width* ( 0.16) , width* ( 0.013) , 20 ) ; fill( 176 , 176 , 184 ) ; rect( width* ( 0.89) , height* ( 0.80) , width, height* ( 0.15) , 15 ) ; fill( 201 , 201 , 212 ) ; rect( width* ( 0.89) , height* ( 0.15) , width, height* ( 0.7) , 30 ) ; fill( 223 , 223 , 230 ) ; rect( width* ( 0.945) , height* ( 0.15) + width* ( 0.045) , width, height* ( 0.5) + width* ( 0.01) , 15 ) ; fill( 150 , 67 , 56 ) ; rect( width* ( 0.950) , height* ( 0.15) + width* ( 0.050) , width, height* ( 0.5) , 15 ) ; line( width* ( 0.89) , height* ( 0.65) , width* ( 0.945) , height* ( 0.65) ) ; line( width* ( 0.89) , height* ( 0.25) , width* ( 0.945) , height* ( 0.25) ) ; display_pizza( ) ; fill( 130 , 130 , 133 ) ; rect( width* ( 0.85) , height* ( 0.8) , width, height* ( 0.1) , 10 ) ; fill( 155 , 155 , 158 ) ; rect( width* ( 0.85) , height* ( 0.23) , width, height* ( 0.6) , 10 ) ; //A7
A7 . resize( floor( 147 * zoom) , floor( 128 * zoom) ) ; image( A7, width* ( 0.09) + height* ( 0.02) , height* ( 0.42) + width* ( 0.03) ) ; image( A7, width* ( 0.09) + height* ( 0.02) , height* ( 0.57) + width* ( 0.03) ) ; image( A7, width* ( 0.09) + height* ( 0.02) , height* ( 0.72) + width* ( 0.03) ) ; } function Map2 ( ) { //box table
stroke( 0 , 0 , 0 ) ; beginShape( ) ; fill( 112 , 166 , 194 ) ; vertex( width* ( 0.536) , height* ( 0.35) + width* ( 0.28) ) ; vertex( width* ( 0.836) , height* ( 0.35) + width* ( 0.28) ) ; vertex( width* ( 0.836) , height* ( 0.35) + width* ( 0.37) ) ; vertex( width* ( 0.818) , height* ( 0.35) + width* ( 0.37) ) ; vertex( width* ( 0.818) , height* ( 0.35) + width* ( 0.325) ) ; vertex( width* ( 0.554) , height* ( 0.35) + width* ( 0.325) ) ; vertex( width* ( 0.554) , height* ( 0.35) + width* ( 0.37) ) ; vertex( width* ( 0.536) , height* ( 0.35) + width* ( 0.37) ) ; vertex( width* ( 0.536) , height* ( 0.35) + width* ( 0.28) ) ; endShape( ) ; fill( 184 , 224 , 245 ) ; rect( width* ( 0.536) , height* ( 0.350) , width* ( 0.300) , width* ( 0.300) , 10 ) ; //box
fill( 92 , 78 , 71 ) ; rect( width* ( 0.550) , height* ( 0.345) + width* ( 0.270) , width* ( 0.270) , width* ( 0.025) ) ; fill( 120 , 107 , 99 ) ; rect( width* ( 0.550) , height* ( 0.345) , width* ( 0.270) , width* ( 0.270) ) ; fill( 143 , 124 , 114 ) ; rect( width* ( 0.555) , height* ( 0.345) , width* ( 0.260) , width* ( 0.265) ) ; fill( 92 , 78 , 71 ) ; rect( width* ( 0.555) , height* ( 0.345) , width* ( 0.26) , height* ( 0.04) ) ; rect( width* ( 0.555) , height* ( 0.345) , width* ( 0.06) , height* ( 0.045) , 3 ) ; rect( width* ( 0.755) , height* ( 0.345) , width* ( 0.06) , height* ( 0.045) , 3 ) ; beginShape( ) ; fill( 120 , 107 , 99 ) ; vertex( width* ( 0.550) , height* ( 0.345) ) ; vertex( width* ( 0.544) , height* ( 0.345) - width* ( 0.17) ) ; vertex( width* ( 0.826) , height* ( 0.345) - width* ( 0.17) ) ; vertex( width* ( 0.820) , height* ( 0.345) ) ; vertex( width* ( 0.550) , height* ( 0.345) ) ; endShape( ) ; beginShape( ) ; fill( 92 , 78 , 71 ) ; vertex( width* ( 0.555) , height* ( 0.345) ) ; vertex( width* ( 0.549) , height* ( 0.345) - width* ( 0.17) ) ; vertex( width* ( 0.821) , height* ( 0.345) - width* ( 0.17) ) ; vertex( width* ( 0.815) , height* ( 0.345) ) ; vertex( width* ( 0.555) , height* ( 0.345) ) ; endShape( ) ; fill( 92 , 78 , 71 ) ; rect( width* ( 0.544) , height* ( 0.345) - width* ( 0.193) , width* ( 0.282) , width* ( 0.023) ) ; //cut table
beginShape( ) ; fill( 176 , 166 , 160 ) ; vertex( width* ( 0.162) , height* ( 0.19) + width* ( 0.438) ) ; vertex( width* ( 0.538) , height* ( 0.19) + width* ( 0.438) ) ; vertex( width* ( 0.538) , height) ; vertex( width* ( 0.517) , height) ; vertex( width* ( 0.517) , height* ( 0.19) + width* ( 0.463) ) ; vertex( width* ( 0.183) , height* ( 0.19) + width* ( 0.463) ) ; vertex( width* ( 0.183) , height) ; vertex( width* ( 0.162) , height) ; vertex( width* ( 0.162) , height* ( 0.19) + width* ( 0.438) ) ; endShape( ) ; fill( 240 , 229 , 225 ) ; rect( width* ( 0.160) , height* ( 0.19) + width* ( 0.38) , width* ( 0.38) , width* ( 0.06) , 15 ) ; rect( width* ( 0.160) , height* ( 0.25) , width* ( 0.38) , width* ( 0.38) , 20 ) ; stroke( 209 , 190 , 190 ) ; //standard line
rect( width* ( 0.215) , height* ( 0.25) + width* ( 0.055) , width* ( 0.27) , width* ( 0.27) , 15 ) ; //knife
stroke( 0 , 0 , 0 ) ; fill( 196 , 194 , 190 ) ; //rotate(-PI/6);
rect( width* ( 0.17) , height* ( 0.25) + width* ( 0.02) , width* ( 0.08) , height* ( 0.04) , 20 ) ; beginShape( ) ; fill( 209 , 202 , 194 ) ; vertex( width* ( 0.240) , height* ( 0.25) + width* ( 0.02) ) ; vertex( width* ( 0.270) , height* ( 0.25) + width* ( 0.02) ) ; vertex( width* ( 0.260) , height* ( 0.27) + width* ( 0.02) ) ; vertex( width* ( 0.255) , height* ( 0.29) + width* ( 0.02) ) ; vertex( width* ( 0.240) , height* ( 0.29) + width* ( 0.02) ) ; vertex( width* ( 0.240) , height* ( 0.25) + width* ( 0.02) ) ; endShape( ) ; line( width* ( 0.266) , height* ( 0.29) , width* ( 0.27) , height* ( 0.31) ) ; line( width* ( 0.257) , height* ( 0.313) , width* ( 0.262) , height* ( 0.314) ) ; fill( 220 , 226 , 247 ) ; circle( width* ( 0.2815) , height* ( 0.3165) , width* ( 0.04) ) ; fill( 240 , 229 , 225 ) ; circle( width* ( 0.2815) , height* ( 0.3165) , width* ( 0.007) ) ; //trash can
fill( 143 , 141 , 141 ) ; stroke( 0 , 0 , 0 ) ; rect( width* ( 0.870) , height* ( 0.23) , width* ( 0.0800) , height* ( 0.30) , 10 ) ; fill( 102 , 100 , 100 ) ; rect( width* ( 0.878) , height* ( 0.24) , width* ( 0.0650) , height* ( 0.28) , 10 ) ; fill( 82 , 81 , 81 ) ; rect( width* ( 0.878) , height* ( 0.45) , width* ( 0.065) , height* ( 0.07) , 10 ) ; fill( 143 , 141 , 141 ) ; rect( width* ( 0.874) , height* ( 0.53) , width* ( 0.0725) , height* ( 0.25) , 3 ) ; fill( 143 , 136 , 131 ) ; circle( width* ( 0.91025) , height* ( 0.62) , height* ( 0.08) ) ; noFill( ) ; let trashcan = loadImage( "trashcan.png" ) ; trashcan . resize( floor( 40 * zoom) , floor( 40 * zoom) ) ; image( trashcan, width* ( 0.897) , height* ( 0.597) ) ; //oven
fill( 83 , 83 , 99 ) ; rect( - width* ( 0.01) , height* ( 0.188) , width* ( 0.131) , width* ( 0.013) , 20 ) ; fill( 114 , 114 , 135 ) ; rect( - width* ( 0.01) , height* ( 0.193) , width* ( 0.131) , width* ( 0.013) , 20 ) ; fill( 173 , 173 , 199 ) ; rect( width* ( 0.01) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.03) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.05) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.07) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.09) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; rect( width* ( 0.11) , height* ( 0.2) , width* ( 0.01) , height* ( 0.6) , 20 ) ; fill( 83 , 83 , 99 ) ; rect( - width* ( 0.01) , height* ( 0.785) , width* ( 0.131) , width* ( 0.013) , 20 ) ; fill( 114 , 114 , 135 ) ; rect( - width* ( 0.01) , height* ( 0.79) , width* ( 0.131) , width* ( 0.013) , 20 ) ; display_pizza( ) ; } function mouseClicked ( ) { console.log( mouseX+ "  " + mouseY) ; //println(mouseX/zoom/width+"  "+mouseY/zoom/height);
//370 550 175 360
//if(map_status==1){
//   if (mouseX>=370 && mouseX<=550 && mouseY)
//}
if ( mouse_selection== "None" ) { for ( let r = 0 ; r< 35 ; r+= 5 ) { if ( mouseX> Float . parseFloat( sauce_data[ r+ 1 ] ) && mouseX< Float . parseFloat( sauce_data[ r+ 2 ] ) && mouseY> Float . parseFloat( sauce_data[ r+ 3 ] ) && mouseY< Float . parseFloat( sauce_data[ r+ 4 ] ) ) { mouse_selection= sauce_data[ r] ; console.log( "Selected:" + sauce_data[ r] ) ; if ( mouse_selection== "6" ) { sauce_on_pizza= append( sauce_on_pizza, mouse_selection) ; sauce_on_pizza= append( sauce_on_pizza, "205" ) ; sauce_on_pizza= append( sauce_on_pizza, "205" ) ; mouse_selection= "None" ; } if ( mouse_selection== "0" ) { sauce_on_pizza= append( sauce_on_pizza, mouse_selection) ; sauce_on_pizza= append( sauce_on_pizza, "220" ) ; sauce_on_pizza= append( sauce_on_pizza, "223" ) ; mouse_selection= "None" ; } if ( mouse_selection== "2" ) { sauce_on_pizza= append( sauce_on_pizza, mouse_selection) ; sauce_on_pizza= append( sauce_on_pizza, "228" ) ; sauce_on_pizza= append( sauce_on_pizza, "230" ) ; mouse_selection= "None" ; } } } } else if ( mouse_selection!= "None" ) { if ( mouse_selection!= "6" && mouse_selection!= "0" && mouse_selection!= "2" && mouse_selection!= "move" ) { sauce_on_pizza= append( sauce_on_pizza, mouse_selection) ; sauce_on_pizza= append( sauce_on_pizza, str( mouseX) ) ; sauce_on_pizza= append( sauce_on_pizza, str( mouseY) ) ; mouse_selection= "None" ; } } if ( mouseX> 509 && mouseX< 593 && mouseY> 392 && mouseY< 428 ) { if ( mouse_selection== "move" ) { mouse_selection= "None" ; } else { mouse_selection= "move" ; } console.log( "movement_changed_to: " + mouse_selection) ; } //println("Selection_Array");
//printArray(sauce_on_pizza);
} function display_pizza ( ) { for ( let i = 0 ; i< sauce_on_pizza . length; i+= 3 ) { if ( int ( sauce_on_pizza[ i] ) != 0 && int ( sauce_on_pizza[ i] ) != 2 && int ( sauce_on_pizza[ i] ) != 6 ) { imageArray[ int ( sauce_on_pizza[ i] ) ] . resize ( 18 , 18 ) ; sauce_on_pizza[ i+ 1 ] = str( float ( sauce_on_pizza[ i+ 1 ] ) + relative_moveX+ prompt_moveX) ; sauce_on_pizza[ i+ 2 ] = str( float ( sauce_on_pizza[ i+ 2 ] ) + relative_moveY+ prompt_moveY) ; image( imageArray[ int ( sauce_on_pizza[ i] ) ] , float ( sauce_on_pizza[ i+ 1 ] ) , float ( sauce_on_pizza[ i+ 2 ] ) + relative_moveY) ; } else if ( int ( sauce_on_pizza[ i] ) == 0 ) { imageArray[ int ( sauce_on_pizza[ i] ) ] . resize ( 115 , 115 ) ; sauce_on_pizza[ i+ 1 ] = str( float ( sauce_on_pizza[ i+ 1 ] ) + relative_moveX+ prompt_moveX) ; sauce_on_pizza[ i+ 2 ] = str( float ( sauce_on_pizza[ i+ 2 ] ) + relative_moveY+ prompt_moveY) ; image( imageArray[ int ( sauce_on_pizza[ i] ) ] , float ( sauce_on_pizza[ i+ 1 ] ) , float ( sauce_on_pizza[ i+ 2 ] ) ) ; } else if ( int ( sauce_on_pizza[ i] ) == 2 ) { imageArray[ int ( sauce_on_pizza[ i] ) ] . resize ( 100 , 100 ) ; sauce_on_pizza[ i+ 1 ] = str( float ( sauce_on_pizza[ i+ 1 ] ) + relative_moveX+ prompt_moveX) ; sauce_on_pizza[ i+ 2 ] = str( float ( sauce_on_pizza[ i+ 2 ] ) + relative_moveY+ prompt_moveY) ; image( imageArray[ int ( sauce_on_pizza[ i] ) ] , float ( sauce_on_pizza[ i+ 1 ] ) , float ( sauce_on_pizza[ i+ 2 ] ) ) ; } else if ( int ( sauce_on_pizza[ i] ) == 6 ) { imageArray[ int ( sauce_on_pizza[ i] ) ] . resize ( 150 , 150 ) ; sauce_on_pizza[ i+ 1 ] = str( float ( sauce_on_pizza[ i+ 1 ] ) + relative_moveX+ prompt_moveX) ; sauce_on_pizza[ i+ 2 ] = str( float ( sauce_on_pizza[ i+ 2 ] ) + relative_moveY+ prompt_moveY) ; image( imageArray[ int ( sauce_on_pizza[ i] ) ] , float ( sauce_on_pizza[ i+ 1 ] ) , float ( sauce_on_pizza[ i+ 2 ] ) ) ; } console.log( "X: " + sauce_on_pizza[ i+ 1 ] ) ; console.log( "Y: " + sauce_on_pizza[ i+ 2 ] ) ; } if ( mouse_selection!= "None" && mouse_selection!= "6" && mouse_selection!= "0" && mouse_selection!= "2" && mouse_selection!= "move" ) { imageArray[ int ( mouse_selection) ] . resize ( 18 , 18 ) ; image( imageArray[ int ( mouse_selection) ] , mouseX, mouseY) ; } } function draw ( ) { last_mouse_locationX= mouseX; last_mouse_locationY= mouseY; //println(str(width*0.12*zoom));
//printArray(sauce_data);
//arrayCopy(temp,sauce_data);
//printArray(sauce_data);
back_ground( ) ; if ( map_status== 1 ) { Map( ) ; fill( 173 , 140 , 135 ) ; rect( width* ( 0.70) , height* ( 0.87) , width* ( 0.13) , height* ( 0.09) , 20 ) ; fill( 255 ) ; textAlign( CENTER) ; textSize( 18 ) ; text( "completed" , width* ( 0.765) , height* ( 0.925) ) ; } else if ( map_status== 2 ) { Map2( ) ; } //printArray(sauce_data);
//for(int i=0;i<35;i+=5)
//{
//  //println("int:"+(i+1)+" "+int(sauce_data[i+1]));
//  float location_X= Float.parseFloat(sauce_data[i+1]);
//  float location_Y= Float.parseFloat(sauce_data[i+3]);
//  float rect_width= Float.parseFloat(sauce_data[i+2])-Float.parseFloat(sauce_data[i+1]);
//  float rect_height= Float.parseFloat(sauce_data[i+4])-Float.parseFloat(sauce_data[i+3]);
//  //println("int:"+Integer.parseInt(sauce_data[i+1]));
//  //println(location_X,location_Y ,rect_width ,rect_height);
//  fill(0);
//  rect(location_X,location_Y ,rect_width ,rect_height);
//}    
if ( relative_movement>= 300 ) { map_status= 2 ; if ( relative_movement<= 302 ) { prompt_moveY= - 250 ; prompt_moveX= - 322 ; } else if ( relative_movement<= 304 ) { prompt_moveX= 1 ; prompt_moveY= 120 ; } relative_movement+= 1 ; } if ( relative_movement>= 310 ) { relative_moveX= 0 ; relative_moveY= 0 ; prompt_moveX= 2 ; prompt_moveY= 0 ; } if ( relative_movement>= 470 ) { relative_moveX= 0 ; relative_moveY= 0 ; prompt_moveX= 0 ; prompt_moveY= 0 ; relative_movement-= 1 ; } console.log( relative_movement) ; if ( mouse_selection== "move" && relative_movement< 300 ) { relative_moveX= 2 ; relative_moveY= 0 ; relative_movement+= 1 ; } else if ( mouse_selection!= "move" && relative_movement< 300 ) { relative_moveX= 0 ; relative_moveY= 0 ; } //printArray(sauce_on_pizza);
} 