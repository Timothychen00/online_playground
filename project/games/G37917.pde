int [][] numbers= new int[9][9];//0 green or 1 red
String [] boom_location = new String[9];
int [] boom_number_text = new int[256];
int boom_number_text_count=0;
int i, j, score=0;
int [][] clicked=new int [9][9];//0,1 green,2 red
int [][] status=new int [9][9];//0,1 click once,2 click twice
int lose=0;
int a=0;
int boom=0;                    //9 blocks's boom
PImage background;


void setup() {
  size(540, 650);
  for (i=0; i<9; i++) {
    for (j=0; j<9; j++) {
      if (a<=9) {
        numbers[int(random(0, 9))][int(random(0, 9))]=1;
        a+=1;
      }
    }
   
  background = loadImage("content_galaxy.jpg");

  }

  for (i=0; i<9; i++) {
    for (j=0; j<9; j++) {
      print(numbers[j][i]);
    }
    println(" ");
  }
  
  String boom_string="";
  
  for (i=0;i<9;i++){
    for (j=0;j<9;j++){
      boom_string+=str(numbers[j][i]);
    }
    boom_location[i]=boom_string;
    boom_string="";
  }
  printArray(boom_location);
}


void draw() {
  
  background(0);
  image(background, 0, 0);
  textAlign(LEFT);
  textSize(20);              //score
  fill(255, 255, 255);
  text("scores:"+score, 10, 30);
  for (i=0; i<9; i++) {          //square
    for (j=0; j<9; j++) {
      fill(#FFFFFF);
      rect(60*j, 60*i+60, 60, 60);
    }
  } 
  
  
   
  for (i=0; i<9; i++) {
    for (j=0; j<9; j++) {
      if (clicked[j][i]==1) {
        fill(#08FF09);
        rect(60*j, 60*i+60, 60, 60);
      } else if (clicked[j][i]==2) {
        lose=1;
        fill(#FF080C);
        rect(60*j, 60*i+60, 60, 60);
        
        for (i=0; i<9; i++) {                 //lose//
          for (j=0; j<9; j++) {
            if (numbers[j][i]==0) {
              fill(#08FF09);
              rect(60*j, 60*i+60, 60, 60);
            } else if (numbers[j][i]==1) {
              fill(#FF080C);
              rect(60*j, 60*i+60, 60, 60);
              
            }
          }
        }
        
        textSize(128);
        fill(100, 100, 256);
        text("Loser", width/2-170, height/2+50);
      }
      if (score==81-a+1) {
        lose=1;
        for (i=0; i<9; i++) {                 //win//
          for (j=0; j<9; j++) {
            if (numbers[j][i]==0) {
              fill(#08FF09);
              rect(60*j, 60*i+60, 60, 60);
            } 
            else if (numbers[j][i]==1) {
              fill(#FF080C);
              rect(60*j, 60*i+60, 60, 60);
            }
            textSize(128);
            fill(0, 0, 0);
            text("Genius", width/2-200, height/2+50);
          }
        }
      }
    }
  }
  draw_boom_text();
  //boom_text(); //boom
}
//void boom_text(){
//   if (mousePressed) {
//      for(int i=0;i<3;i++){
//         for(int j=0;j<3;j++){
//            if (numbers[floor(mouseX/60)-1+j][floor((mouseY-60)/60)-1+i]==1){
//                boom+=1;
//            }
//         }
//      }        
//   }
//  println(boom);
//  textSize(32);
//  fill(0, 0, 0);
//  textAlign(CENTER);
//  text(boom,int(mouseX/60)*60+30, int(mouseY/60)*60+45);

//}
void mousePressed() {
  if (mouseY>=60 && mouseY<=600) {
    
    if (numbers[floor(mouseX/60)][floor((mouseY-60)/60)]==0) {
      
      fill(#15FF4D);
      rect(60*floor(mouseX/60), 60*floor((mouseY-60)/60)+60, 60, 60);
      clicked[floor(mouseX/60)][((mouseY-60)/60)]=1;
      status[floor(mouseX/60)][((mouseY-60)/60)]+=1;
      if (clicked[floor(mouseX/60)][((mouseY-60)/60)]==1 && status[floor(mouseX/60)][((mouseY-60)/60)]==1)
        if (lose!=1)
          score+=1;
        
    } else if (numbers[floor(mouseX/60)][floor((mouseY-60)/60)]==1) {
      fill(#FF0303);
      rect(60*floor(mouseX/60), 60*floor((mouseY-60)/60)+60, 60, 60);
      clicked[floor(mouseX/60)][((mouseY-60)/60)]=2;
    }
    
    boom_number_text[boom_number_text_count]=mouseX/60;
    boom_number_text_count+=1;
    boom_number_text[boom_number_text_count]=mouseY/60-1;
    boom_number_text_count+=1;
    
      int startX=0;
      int endX=0;
      int startY=0;
      int endY=0;
      int count=0;
      
    //println("mouse/60"+str(mouseX/60));
    //println(mouseY/60-1);
    
    //mouseX
    if (mouseX/60<1){
      //println("I'm in first");
      startX=0;
      endX=1;
    }
    if(mouseX/60>=1 && mouseX/60<8){
       //println("I'm in second");
      startX=mouseX/60-1;
      endX=mouseX/60+1;
    }
    if(mouseX/60>=8){
      //println("I'm in third");
      startX=mouseX/60-1;
      endX=mouseX/60;
    }
    
    //mouseY
    
     if (mouseY/60-1<1){
      //println("I'm in first");
      startY=0;
      endY=1;
    }
    if(mouseY/60-1>=1 && mouseY/60-1<8){
       //println("I'm in second");
      startY=mouseY/60-1-1;
      endY=mouseY/60-1+1;
    }
    if(mouseY/60-1>=8){
      //println("I'm in third");
      startY=mouseY/60-1-1;
      endY=mouseY/60-1;
    }
    
    //println("startX"+str(startX));
    //println("endX"+str(endX));
    //println("startY"+str(startY));
    //println("endY"+str(endY));
    
    
    String yourString = "";
    int[] allChars = new int[yourString.length()];
    for (i=startY;i<=endY;i++){
        yourString=boom_location[i];
        for (int t=startX; t <= endX; t++) {
          println(yourString.charAt(t));
          if (yourString.charAt(t)=='1'){
            count+=1;
          }
          println("count"+count);
        }  
    }
    println("Bomom!!!!"+count);
    boom_number_text[boom_number_text_count]=count;
    boom_number_text_count+=1;
    count=0;
    printArray(boom_number_text);
    
    

    draw_boom_text();
  }
  
}
void draw_boom_text() {
  for (int e =0; e<boom_number_text_count;e+=3){
    textAlign(CENTER);
     textSize(40);
     fill(0);
     //println(boom_number_text[e],boom_number_text[e+1] *60,boom_number_text[e+2]*60);
     text(boom_number_text[e+2],boom_number_text[e] *60+30,boom_number_text[e+1]*60+105);
  }
  
}