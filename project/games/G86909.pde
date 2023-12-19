int x=150;
int y=150;
float apple_x=150;
float apple_y=300;
float bomb_x=500;
float bomb_y=0;
float bomb_x_2=200;
float bomb_y_2=-50;
PFont font;
int a=0;
int b;
int c=400;
int speed_y=25;
PImage tree;
PImage apple;
PImage hand;
PImage bomb;
PImage bomb_2;

void setup() {
  size(612, 533);
  tree=loadImage("image_0.jpg");
  apple=loadImage("image_1.png");
  hand=loadImage("image_2.png");
  bomb=loadImage("image_3.jpg");
  bomb_2=loadImage("image_3.jpg");
  font=createFont("QingNiaoHuaGuangJianMeiHei-2.ttf",128);
  
}

void draw(){
  frameRate(20);
  background(tree);
  move();
  apple.resize(100,100);
  image(apple,apple_x,apple_y);
  image(bomb,bomb_x,bomb_y);
  bomb.resize(75,75);
 image(bomb_2,bomb_x_2,bomb_y_2);
  bomb_2.resize(100,100);
  image(hand,x,y);
  hand.resize(100,100);

  
  over();
  font();
  println(sqrt((apple_x-x)*(apple_x-x)+(apple_y-y)*(apple_y-y)));
  if(sqrt((apple_x-x)*(apple_x-x)+(apple_y-y)*(apple_y-y))<50){
    apple();
    a+=20;
  }
  if(sqrt((bomb_x-x)*(bomb_x-x)+(bomb_y-y)*(bomb_y-y))<50){
    bomb();
    a-=20;
  }
   if(sqrt((bomb_x_2-x)*(bomb_x_2-x)+(bomb_y_2-y)*(bomb_y_2-y))<50){
    bomb_2();
    a-=20;
  }
  bomb_y+=speed_y;
  bomb_y_2+=speed_y;
  if (bomb_y>height){
    bomb();
  }
  if (bomb_y_2>height){
  bomb_2();
}
}

void move(){
  if(keyPressed){
    if(key=='1'&&x!=0){
      x-=10;
    }
    if(key == '3'&&x!=600){
      x+=10;
    }
    if(key == '5'&&y!=0){
      y-=10;
    }
    if(key == '2'&&y!=0){ 
      y+=10;
    }
    if(key == 'q'){
      exit();
    }
  }
} 
void apple(){
  apple_x = random(50,500);
  apple_y = random(50,400);
}  
void bomb(){
  bomb_x = random(50,500);
  bomb_y = -50;
}  
void bomb_2(){
  bomb_x_2 = random(50,500);
  bomb_y_2 =0;
}
void font(){
  textFont(font);
  fill(0);
  text(a,10,150);
  text(b,550,150);
}
void over(){
  c-=1;
  b=c/20;
  if(c==0){
   fill(20,100,240);
   noStroke();
   rect(10,170,700,240);
   textFont(font);
   fill(0);
   String s = "your score is";
   text(s,10,250);
   text(a,100,400);
   stop();
  } 
} 
    
    
    
    
    
    
    
    
