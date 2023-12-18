float ground_x,ground_speedX;
float cactus_x,cactus_x_2,cactus_speedX;

float jump_y,jump_speedY;

String pic = "cactus_"+ (int)(Math.random()*(4))+".png";
String pic_2 = "cactus_"+ (int)(Math.random()*(4))+".png";

String status = "normal";
String game_status = "before_start";
String cheat_mode="False";

int recent_time=0;
int previous_time=millis();
int speed_time=0;
int speed_previous_time=millis();

int recent_score=0;
int highest_score=0;

int loading_time=0;
String loading_text="Loading";

JSONObject json;


void setup(){
  //setting size & background
    size(800,600);
    background(255);
    

  
  //setting initial value
    
    //ground_value
    ground_x=0;
    ground_speedX=7;
    
    //cactus_value
    cactus_x=800;
    cactus_x_2=1300;
    cactus_speedX=7;
    
    //jump_value
    jump_y=240;
    jump_speedY=10.3;
    
    //recent_score
    recent_score=0;
    
    //load json
    
    json = loadJSONObject("data.json");
    highest_score = json.getInt("highest_score");
    
    //print initial_message
    JSONArray initial_message= json.getJSONArray("initial_message");
    for (int i = 0; i < initial_message.size(); i++) {
      println(initial_message.getString(i) );
    }



}


void draw(){
   switch(game_status){
     
     case "before_start":
       welcome_page();
       break;
        
     case "loading":
       loading();
       break;
         
     case "start":
       ground();
       cactus_1();
       cactus_2();
       dino();
       score();
       failed();
       speed();
       text("CHEATING MODE "+cheat_mode+"!!",0.83 * width ,0.98  *  height);
       break;
       
     case "failed":
       image(loadImage("restart.png"),0.5 * width - loadImage("restart.png").width/2,220);
       textAlign(CENTER);
       textSize(30);
       fill(83,83,83);
       text("G A M E   O V E R",0.5 * width ,0.33 *  height);
   
   }
  //println(jump_y);
  //println(status);
}


//loading_scenes
void ground(){
  background(255);
  ground_x-=ground_speedX;
  image(loadImage("ground_base.png"),ground_x,300);
  if (ground_x<=-(width-150)){
    ground_x=0;
  }
}

void cactus_1(){
  cactus_x-=cactus_speedX;
  image(loadImage(pic),cactus_x,250);
  if (cactus_x<=-(width-150)){
    cactus_x=(int)(Math.random()*(100))+800;
    pic="cactus_"+ (int)(Math.random()*(4))+".png";
  }
}

void cactus_2(){
  cactus_x_2-=cactus_speedX;
  image(loadImage(pic_2),cactus_x_2,250);
  if (cactus_x_2<=-(width-150)){
    cactus_x_2=(int)(Math.random()*(100))+850;
    pic_2="cactus_"+ (int)(Math.random()*(4))+".png";
  }
}


void dino(){
  if (status=="normal"){
    image(loadImage("dino.png"),20,240);
  }
  else{
    jump();
  }
}

void jump(){
  if (status=="jump"){
    if(jump_y > 100){
      jump_y-=jump_speedY;
    }
    else{
      status="too_high";
    }
  }
  
  if (status=="too_high"){
    if(jump_y < 240){
      jump_y+=jump_speedY-5;
    }
    else{
      status="normal";
    }
  }
  
  

  
  image(loadImage("dino.png"),20,jump_y);
  //if (status=="jump"){
  //  jump_y-=jump_speedY;
  //  println("...........");
  //  image(loadImage("dino.png"),20,jump_y);
  //}
  //if (jump_y< 240){
  //  status="too_high";
  //  jump_y+=jump_speedY;
  //  image(loadImage("dino.png"),20,jump_y);
  //}
  //if (jump_y > 300){
  //  status="normal";
  //  jump_y=240;
  //  dino();
  //}
  
  
}

void score(){
    recent_time=millis();
    
    json = loadJSONObject("data.json");
    highest_score = json.getInt("highest_score");
    
    textSize(24);
    fill(#000000);
    text("HI"+"   "+highest_score+"   "+recent_score,0.8 * width ,0.1 *  height);
    
    if (recent_score > highest_score){  
      json.setInt("highest_score", recent_score);
      saveJSONObject(json, "data/data.json");
    }
    
    if (recent_time-previous_time > 150){
      recent_score+=1;
      previous_time = millis();
    }
}
void welcome_page(){
     textAlign(CENTER);
     textSize(40);
     fill(#EE6AA7);
     text("START",0.5 * width ,0.4 *  height);
     textSize(24);
     fill(#000000);
     text("Press space to start",0.5 * width ,0.5 *  height);
}
void loading(){
     background(255,255,255);
     loading_text+=".";
     welcome_page();
     text(loading_text,0.5 * width ,0.7 *  height);
     //println(loading_text);
     delay(300);
     loading_time+=1;
     if (loading_time>=8){
       game_status="start";
     }
}

void speed(){
  if (recent_score>=100){
    speed_time=millis();
    text("SPEEDING_UP!!",0.8 * width ,0.2 *  height);
    if (speed_time-speed_previous_time > 1000){
      cactus_speedX+=0.5;
      ground_speedX+=0.5;
      //println("add");
      //println(cactus_speedX);
      speed_previous_time = millis();
    }
  }
}

void failed(){
  if (cheat_mode=="False"){
      //println(cactus_x-5.5);
    //println(jump_y);
    if ( cactus_x-5.5 < 50 && cactus_x-5.5 > 0 && jump_y>=180){
      //println("failed_1");
      game_status="failed";
    }
    if (cactus_x_2-5.5 < 50 && cactus_x_2-5.5 > 0 && jump_y>=180){
      //println("failed_2");
      game_status="failed";
    }
  }
}

void keyPressed(){
  if (game_status == "start"){
    if (key == ' '){
      if (status=="normal"){ 
          jump();
          status="jump";
      }
    }
    
    if (key == CODED) {
      if (keyCode == UP) {
        if (status=="normal"){
          jump();
          status="jump";
        }
      }
    }
  }
  if (game_status == "before_start"){
    if (key == ' '){
       game_status="loading";
    }
    if (key == CODED) {
      if (keyCode == UP) {
        game_status="loading";
      }
    }
  }
  
  if (game_status == "failed"){
    if (key == ' '){
       setup();
       game_status="start";
    }
    if (key == CODED) {
      if (keyCode == UP) {
        setup();
        game_status="start";
      }
    }
  }
  
  if (key == 'c'){
     if (cheat_mode=="True"){
       cheat_mode="False";
     }
     else{
     cheat_mode="True";
     }
  }
}

//void mousePressed() {
//  println(mouseX+","+mouseY);
//}