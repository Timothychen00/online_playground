            //2 ECE4DB
//4 ECE1CC
//8 E9B582
//y->i
//x->j

color [] colors={#FFFFFF,#ECE4DB,#ECE1CC,#E9B582,#E99A6D,#E78367,#E56948,#E8D180,#E8CD72};
color [] text_colors={#FFFFFF,#756E66,#756E66,#F8F6F2,#F8F6F2,#F8F6F2,#F8F6F2,#F8F6F2,#F8F6F2};
int score=0;
int steps=0;
int push=0;
int lose=0;
int available_movements=0;
int proress=0;
//animation
int []appear={-1,-1};
int animation_start=0;
void show_score(){
  //rect();
  fill(#CAC1B5);
  rect(535-80-5,70,80,80,10);
  fill(#F8F6F2);
  //println(score);
  //text(,100,100);
  textSize(20);
  text("Score",535-80-5,70-20);
  text(str(score),535-80-5,70+20);

}



int check_can_move(){
  int condition=0;
  for(int i=0;i<4;i++){
    for (int j =0;j<3;j++){
      if (block_num[i][j]==block_num[i][j+1] || block_num[i][j]==0 ||block_num[i][j+1]==0){
        condition=1;
      }
    }
  }
  for(int i=0;i<3;i++){
    for (int j =0;j<4;j++){
      if (block_num[i][j]==block_num[i+1][j] || block_num[i][j]==0 ||block_num[i+1][j]==0){
        condition=1;
      }
    }
  }
  return condition;
}


int block_width=82;
int block_radius=13;

int [][]animation_queue={};

//set the colors

int g=15;
int click=0;
int[] x = {280-3*g/2, 360-g/2, 440+g/2, 520+3*g/2 };
int[] y={205-3*g/2,285-g/2,365+g/2,445+3*g/2};

int [][] block_num={
{16,8,8,0},
{2,8,32,4},
{8,2,8,0},
{32,128,16,0}
};

int [][] default_block={
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0}
};


String []count_white(){
  String points[]={};
  for(int i=0;i<4;i++)
    for(int j =0;j<4;j++)
       if(block_num[i][j]==0)
         points=append(points,(str(i)+","+str(j)));
  //printArray(points);
  return points;
}

void random_block(){
  String []white=count_white();
  if(white.length>0){//full
    String []point=split(white[int(random(white.length))],",");
    //printArray(point);
    int block_number=(int(random(1,40))%2+1)*2;
    block_num[int(point[0])][int(point[1])]=block_number;
    
    appear[0]=int(point[0]);
    appear[1]=int(point[1]);
    //print(point[0]);
    print(',',point[0],point[1]);
    print(',',appear[0],appear[1]);
    print("appear:"+appear[0]+','+appear[1]);
  }
  //show_block();
  available_movements=0;
  
}
int count=0;

void show_block(){
  generate_board();
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      //stroke(#FFFFFF);
      if(block_num[i][j]!=0){
        int num=int(log(block_num[i][j])/log(2));
        if(appear[0]!=-1){
          if (int(appear[0])==i && int(appear[1])==j){
            push=1;
            pushMatrix();
            
            //print(i);
            if(animation_start==0)
            {
              animation_start=millis();
            }
            long now=millis();
            if(now-animation_start<250){
              translate(x[j],y[i]);
              scale(count*0.15);
              translate(-x[j],-y[i]);
              count++;
            
            }else{
              count=0;
              appear[0]=-1;
              appear[1]=-1;
              animation_start=0;
            }
            
            
            scale(1);
            //popMatrix();
          }
        }
        
        fill(colors[num]);
        rect(x[j],y[i],82,82,13);
        
        fill(text_colors[num]);
        textAlign(CENTER, CENTER);
        textSize(55);
        //text(block[i][j],x[j]-13,y[i]+20);
        text(block_num[i][j],x[j],y[i]);
        
        if(appear[0]!=-1 && int(appear[0])==i && int(appear[1])==j){
          popMatrix();
        }
      }
    }
  }
  if (lose==1){
    fill(#e0d296);
    rect(400, 325, 390, 390, 25);
    fill(#FFFFFF);
    text("you lose!",400,325);
  }
}
//initial the main block
void generate_board(){
  fill(#B9ADA1);
  rect(400, 325, 390, 390, 25);
  fill(#CAC1B5);
  stroke(#B9ADA1);
  for(int i=0;i<4;i++){
    for(int j=0;j<4;j++){
      rect(x[i],y[j],82,82,13);
    }
  }
}

int non_empty(int certain,int dx,int dy,int start,int end){
  //dx,dy
  int  return_value=-1;
  if(dy==0){
    println("pppp");
    for(int i=start;i!=end;i+=dx){//move right
      if(block_num[certain][i]!=0){
        //println(block_num[certain][i]);
        if(i==start)
          continue;
        return i;
        //else
      }
    }
  }else if(dx==0){//move down
  println("----");
    for(int i=start;i!=end;i+=dy){
      if(block_num[i][certain]!=0){
        println(block_num[i][certain]);
        if(i==start)
          continue;
        return i;
      }
    }
  }
  //else if(dx>0){//move left
  return return_value;
}

void handle_movement(int dx,int dy){
  if(dx<0){
    println("movement dx");
    for(int j=0;j<4;j++){
      for(int i=3;i!=-1;i+=dx){
        int next=non_empty(j,-1,0,i,-1);
        if(next!=-1){//not empty
          if(block_num[j][i]==block_num[j][next])//merge
          {
            block_num[j][i]*=2;
            block_num[j][next]=0;
            score+=block_num[j][i];//cal_score
            available_movements++;
          }
        }
      }
      for(int i=3;i!=0;i+=dx){
        int next=non_empty(j,-1,0,i,-1);
        //println(next);
        if(next!=-1){//not empty
        //block_num[0][]
        
          if(block_num[j][i]==0)
          {//move
            block_num[j][i]=block_num[j][next];
            block_num[j][next]=0;
            available_movements++;
          }
        
        }
      }
    }
  }
  if(dy<0){
    println("movement dy");
    for(int j=0;j<4;j++){
      for(int i=3;i>=0;i--){
        int next=non_empty(j,0,-1,i,-1);
        if(next!=-1){//not empty
          if(block_num[i][j]==block_num[next][j])//merge
          {
            block_num[i][j]*=2;
            block_num[next][j]=0;
            score+=block_num[i][j];//cal_score
            available_movements++;
          }
        }
      }
      for(int i=3;i>=0;i--){
        int next=non_empty(j,0,-1,i,-1);
        //println(next);
        if(next!=-1){//not empty
        //block_num[0][]
        
          if(block_num[i][j]==0)
          {//move
            block_num[i][j]=block_num[next][j];
            block_num[next][j]=0;
            available_movements++;
          }
        
        }
      }
    }
  }
  if(dx>0){
    println("movement dy");
    //int j=0;
    for(int j=0;j<4;j++){
      for(int i=0;i!=4;i++){
        int next=non_empty(j,dx,dy,i,4);
        if(next!=-1){//not empty
          if(block_num[j][i]==block_num[j][next])//merge
          {
            block_num[j][i]*=2;
            block_num[j][next]=0;
            score+=block_num[j][i];//cal_score
            available_movements++;
          }
        }
      }
      for(int i=0;i!=4;i++){
        int next=non_empty(j,dx,dy,i,4);
        if(next!=-1){//not empty
          if(block_num[j][i]==0)
          {//move
            block_num[j][i]=block_num[j][next];
            block_num[j][next]=0;
            available_movements++;
          }
        
        }
      }
    }
  }
    if(dy>0){
      //int j=0;
    println("movement dy");
    //int j=0;
    for(int j=0;j<4;j++){
      for(int i=0;i!=4;i++){
        int next=non_empty(j,dx,dy,i,4);
        if(next!=-1){//not emwpty
          if(block_num[i][j]==block_num[next][j])//merge
          {
            block_num[i][j]*=2;
            block_num[next][j]=0;
            score+=block_num[i][j];//cal_score
            available_movements++;
          }
        }
      }
      for(int i=0;i!=4;i++){
        int next=non_empty(j,dx,dy,i,4);
        if(next!=-1){//not empty
          if(block_num[i][j]==0)
          {//move
            block_num[i][j]=block_num[next][j];
            block_num[next][j]=0;
            available_movements++;
          }
        }
      }
    }
  }


}

void setup(){
  smooth(8);
  frameRate(30);
  pixelDensity(displayDensity());
  PFont sans;
  sans=createFont("Sans.ttf",128);
  textFont(sans);
  
  size(800,600);
  background(#FAF8F0);
  textSize(80);
  //fill(#0d0d0d);

  fill(#B9ADA1);
  //stroke(#756E66);
  text("2048",205,100);
  //stroke(#FFFFFF);
  rectMode(CENTER);
  //block
  
  generate_board();
  //show_block();
  
  fill(#8C7B68);
  rect(545,90,80,40,10);
  fill(#FFFFFF);
  textSize(15);
  text("New game",510,95);
  
  fill(#CAC1B5);
  rect(535-80-5,70,80,80,10);
  start_game(0);
  
}

void start_game(int reset){
  lose=0;
  score=0;
  appear[0]=-1;
  appear[1]=-1;
  animation_start=0;
  count=0;
  //reset
  if(reset==1){
    for(int i=0;i<4;i++)
      for(int j=0;j<4;j++)
        block_num[i][j]=0;
    //println("ful");
  }

  random_block();
  //show_block();
}




//start
void mouseClicked() {
  if (mouseX>535-70 && mouseX<535+90){
    if(mouseY>40 && mouseY<120){
      click=1;
      //setup();
      start_game(1);
      //println(click);
    }
  }
}

void keyPressed(){
  if(push==1){
    //popMatrix();
    push=0;
  }
  if(key=='d')
  {
    handle_movement(-1,0);
  }else if(key=='s'){
    handle_movement(0,-1);
  }else if(key=='a'){
    handle_movement(1,0);
  }
  else if(key=='w'){
    handle_movement(0,1);
  }
  
  //random_block();
  println(available_movements);
  if (check_can_move()==1){
    if(available_movements>0){
      random_block();
    }
  }
}

void draw(){
int steps;
show_block();
show_score();
if(check_can_move()==0)
  lose=1;
}