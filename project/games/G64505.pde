            int angle=0;
int angleCom=0;
int snakeSize=5;
int snakeSizeCom=15;
int time=0;
int [] snakex = new int [3000]; 
int [] snakey = new int [3000];
int [] snakeComx = new int [3000];
int [] snakeComy = new int [3000];
int foodx = (round(random(47))+1)*16;
int foody = (round(random(47))+1)*16;
int mode = 0;
boolean foodset =  true;
int speed = 0;

void setup()
{
  restart();
  restartCom();
  background(255);
  size(800,800);
  textAlign(CENTER);
}

void draw()
{
  if(mode == 0)
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(44);
     text("CHOOSE DIFFICULTY",width/2,height/2-80);
     textSize(24);
     text("PRESS 1 TO PLAY EASY MODE",width/2,height/2-30);
     text("PRESS 2 TO PLAY MEDIUM MODE",width/2,height/2+10);
     text("PRESS 3 TO PLAY HARD MODE",width/2,height/2+50);
     text("PRESS B TO SWITCH TO COM MODE", width/2, height/2+90);
     if(keyPressed)
     {
       if(key == '1')
       {
         background(255);
         mode = 1;
       }
       if(key == '2')
       {
         background(255);
         mode = 2;
       }
       if(key == '3')
       {
         background(255);
         mode = 3;
       }
       if(key == 'b')
       {
         background(0);
         mode = 5;
       }
     }
    }
  else if(mode == 1 || mode == 2 || mode == 3)
    {
      time+=1;
      fill(255,0,0);
      stroke(0);
      rect(foodx,foody,16,16);
      fill(0);
      rect(0,0,width,16);
      rect(0,height-16,width,16);
      rect(0,0,16,height);
      rect(width-16,0,16,height);
      if(mode == 1)
        {
          speed = 7;
        }
      if(mode == 2)
        {
          speed = 5;
        }
      if(mode == 3)
        {
          speed = 3;
        }
      if(time%speed == 0)
        {  
          display();
          walk();
          checkAlive();
        }
    }
  else if(mode == 4)
  {
    
  }
  else if(mode == 5)
  {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(44);
     text("CHOOSE DIFFICULTY",width/2,height/2-80);
     textSize(24);
     text("PRESS 1 TO PLAY EASY MODE",width/2,height/2-30);
     text("PRESS 2 TO PLAY HARD MODE",width/2,height/2+10);
     text("PRESS S TO SWITCH TO SINGLE MODE", width/2, height/2+50);
     if(keyPressed)
     {
       if(key == '1')
       {
         background(255); 
         mode = 6;
       }
       if(key == '2')
       {
         background(255);
         mode = 7;
       }
       if(key == 's')
       {
         background(255);
         mode = 0;
       }
     }
  }
  else if(mode == 6 || mode ==7)
  {
    time+=1;
    fill(255,0,0);
    stroke(0);
    rect(foodx,foody,16,16);
    fill(0);
    rect(0,0,width,16);
    rect(0,height-16,width,16);
    rect(0,0,16,height);
    rect(width-16,0,16,height);
    if(mode == 6)
    {
      if(time%200 == 0)
      {
        snakeSizeCom += 1;
      }
      if(time%7 == 0)
      {
        display();        
        walk();     
        checkWin();
      }
      if(time%10 == 0)
      {
        displayCom();
        walkCom();
        autoTurn();
      }
    }
      if(mode == 7)
    {
      if(time%100 == 0)
      {
        snakeSizeCom += 1;
      }
      if(time%5 == 0)
      {
        display();        
        walk();     
        checkWin();
      }
      if(time%7 == 0)
      {
        displayCom();
        walkCom();
        autoTurn();
      }
    }
    if(mode == 8)
    {
      
    }
    
  }
}
void keyPressed()
{
  if(key == CODED)
  {
    if(keyCode == UP && angle!=270 && snakey[1]-16 != snakey[2])
    {
      angle=90;
    }
    if(keyCode == DOWN && angle!=90 && snakey[1]+16 != snakey[2])
    {
      angle=270;
    }
    if(keyCode == LEFT && angle!=0 && snakex[1]-16 != snakex[2])
    {
      angle=180;
    }
    if(keyCode == RIGHT && angle!=180 && snakex[1]+16 != snakex[2])
    {
      angle=0;
    }
    if(keyCode == ALT)
    {
      if(mode == 5 || mode == 6 || mode == 7 || mode == 8)
      {
       background(0);
       mode = 5;
      }
      else 
      {
        mode = 0; 
      }
      restart();
      restartCom();
    }
  }
}

void checkAlive()
{
  for(int i = 2; i<=snakeSize ; i++)
  {
    if(snakex[1] == snakex[i] && snakey[1] == snakey[i])
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(32);
     text("YOU TOUCHED YOURSELF!", width/2, height/2-110);
     textSize(40);
     text("GAME OVER", width/2, height/2-70);
     textSize(24);
     text("SCORE: "+(snakeSize-5)+" POINTS",width/2 , height/2-20);
     text("PRESS ALT TO GO BACK TO MENU",width/2, height/2+30);
     mode = 4;
    }
    if(snakex[1] == width-16 || snakex[1] ==0 || snakey[1] == height-16 || snakey[1] == 0)
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(32);
     text("YOU TOUCHED THE WALL!", width/2, height/2-110);
     textSize(40);
     text("GAME OVER", width/2, height/2-70);
     textSize(24);
     text("SCORE: "+(snakeSize-5)+" POINTS",width/2 , height/2-20);
     text("PRESS ALT TO GO BACK TO MENU",width/2, height/2+30);
     mode = 4;
    }
  }
}

void checkWin()
{
  for(int i = 1; i<=snakeSizeCom;i++)
  {
    if(snakex[1] == snakeComx[i] && snakey[1] == snakeComy[i])
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(32);
     text("YOU TOUCHED COM!", width/2, height/2-110);
     textSize(40);
     text("GAME OVER", width/2, height/2-70);
     textSize(24);
     text("YOU LOST",width/2 , height/2-20);
     text("PRESS ALT TO GO BACK TO MENU",width/2, height/2+30);
     mode = 8;
    }
    
  }
  for(int i = 2; i<=snakeSize ; i++)
  {
    if(snakex[1] == snakex[i] && snakey[1] == snakey[i])
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(32);
     text("YOU TOUCHED YOURSELF!", width/2, height/2-110);
     textSize(40);
     text("GAME OVER", width/2, height/2-70);
     textSize(24);
     text("YOU LOST",width/2 , height/2-20);
     text("PRESS ALT TO GO BACK TO MENU",width/2, height/2+30);
     mode = 8;
    }
    if(snakex[1] == width-16 || snakex[1] ==0 || snakey[1] == height-16 || snakey[1] == 0)
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(32);
     text("YOU TOUCHED THE WALL!", width/2, height/2-110);
     textSize(40);
     text("GAME OVER", width/2, height/2-70);
     textSize(24);
     text("YOU LOST",width/2 , height/2-20);
     text("PRESS ALT TO GO BACK TO MENU",width/2, height/2+30);
     mode = 8;
    }
    if(snakeComx[1] == snakex[i] && snakeComy[1] == snakey[i])
    {
     fill(255);
     rect(200, 200, 400, 300);
     fill(0);
     textSize(32);
     text("YOU ELIMINATED COM!", width/2, height/2-110);
     textSize(40);
     text("VICTORY!!!", width/2, height/2-70);
     textSize(24);
     text("YOU WON",width/2 , height/2-20);
     text("PRESS ALT TO GO BACK TO MENU",width/2, height/2+30);
     mode = 8;
    }
  }
}

void walk()
{
  for(int i = snakeSize ; i>=1 ;i--)
  {
    if(i==1)
    {
      switch(angle)
      {
       case 0:
       snakex[1]+=16;
       break;
       case 180 :
       snakex[1]-=16;
       break;
       case 90:
       snakey[1]-=16;
       break;
       case 270 :
       snakey[1]+=16;
       break;
      }
    }
    else 
    {
      snakex[i]=snakex[i-1];
      snakey[i]=snakey[i-1];
    }
  }
}

void walkCom()
{
  for(int i = snakeSizeCom ; i>=1 ; i--)
  {
    if(i == 1)
    {
      switch(angleCom)
      {
        case 0 :
        snakeComx[1]+=16;
        break;
        case 180 :
        snakeComx[1]-=16;
        break;
        case 90 :
        snakeComy[1]-=16;
        break;
        case 270 :
        snakeComy[1]+=16;
        break;
      }
    }
    else
    {
      snakeComx[i] = snakeComx[i-1];
      snakeComy[i] = snakeComy[i-1];
    }
  }
}

void display()
{
  if(snakex[1]==foodx && snakey[1]==foody)
  {
    snakeSize+=1;
    foodset = true;
    while(foodset)
    {
      foodx = (round(random(47))+1)*16;
      foody = (round(random(47))+1)*16;
      for(int i =1 ;i<snakeSize;i++)
      {
       if(snakex[i] == foodx && snakey[i] == foody)
       {
         foodset = true;
       }
       else 
       {
         foodset = false;
       }
      }
    }    
  }
  stroke(0);
  fill(0);
  rect(snakex[1], snakey[1], 16, 16);
  fill(255);
  rect(snakex[snakeSize], snakey[snakeSize], 16, 16);
}

void displayCom()
{
  stroke(0);
  fill(29, 46, 114);
  rect(snakeComx[1], snakeComy[1], 16, 16);
  fill(255);
  rect(snakeComx[snakeSizeCom], snakeComy[snakeSizeCom], 16, 16);
}

void restart()
{
  for(int i=1;i<snakeSize;i++)
  {
  snakex[i]=0;
  snakey[i]=0;
  }
  snakex[1] = 400;
  snakey[1] = 400;
  foodx=(round(random(47))+1)*16;
  foody=(round(random(47))+1)*16;
  snakeSize=5;
  time=0;
  angle=0;
  foodset=true;
}

void restartCom()
{
  for(int i=1;i<snakeSizeCom;i++)
  {
  snakeComx[i]=0;
  snakeComy[i]=0;
  }
  snakeComx[1] = 80;
  snakeComy[1] = 80;
  snakeSizeCom=15;
  angleCom=0;
}
void autoTurn()
{
  if(snakeComx[1] <= 16 && snakeComy[1]-snakey[1]<0)
  {
    angleCom = 270;
  }
  if(snakeComx[1] <= 16 && snakeComy[1]-snakey[1]>=0)
  {
    angleCom = 90;
  }
  if(snakeComx[1] >= width-16 && snakeComy[1]-snakey[1]<0)
  {
    angleCom = 270;
  }
  if(snakeComx[1] >= width-16 && snakeComy[1]-snakey[1]>=0)
  {
    angleCom = 90;
  }
  if(snakeComy[1] <= 16 && snakeComx[1]-snakex[1]>=0)
  {
    angleCom = 180;
  }
  if(snakeComy[1] <= 16 && snakeComx[1]-snakex[1]<0)
  {
    angleCom = 0;
  }
  if(snakeComy[1] >= height-16 && snakeComx[1]-snakex[1]>=0)
  {
    angleCom = 180;
  }
  if(snakeComy[1] >= height-16 && snakeComx[1]-snakex[1]<0)
  {
    angleCom = 0;
  }
  if(abs(snakeComx[1]-snakex[1]) >= abs(snakeComy[1]-snakey[1]) && angleCom!=0 && snakeComx[1]-16!=snakeComx[1] && snakeComx[1]-snakex[1]>=0)
  {
    angleCom = 180;
  }
  else if(abs(snakeComx[1]-snakex[1]) >= abs(snakeComy[1]-snakey[1]) && angleCom == 0 && snakeComx[1]-16!=snakeComx[1] && snakeComy[1]-snakey[1]>=0)
  {
    angleCom = 90;
  }
  else if(abs(snakeComx[1]-snakex[1]) >= abs(snakeComy[1]-snakey[1]) && angleCom==0 && snakeComx[1]-16!=snakeComx[1] && snakeComy[1]-snakey[1]<=0)
  {
    angleCom = 270;
  }
  
  else if(abs(snakeComx[1]-snakex[1]) >= abs(snakeComy[1]-snakey[1]) && angleCom!=180 && snakeComx[1]+16!=snakeComx[1] && snakeComx[1]-snakex[1]<=0)
  {
    angleCom = 0;
  }
  else if(abs(snakeComx[1]-snakex[1]) >= abs(snakeComy[1]-snakey[1]) && angleCom==180 && snakeComx[1]+16!=snakeComx[1] && snakeComy[1]-snakey[1]>=0)
  {
    angleCom = 90;
  }
  else if(abs(snakeComx[1]-snakex[1]) >= abs(snakeComy[1]-snakey[1]) && angleCom==180 && snakeComx[1]+16!=snakeComx[1] && snakeComy[1]-snakey[1]<=0)
  {
    angleCom = 270;
  }
  
  else if(abs(snakeComx[1]-snakex[1]) < abs(snakeComy[1]-snakey[1]) && angleCom!=90 && snakeComy[1]-16!=snakeComy[1] && snakeComy[1]-snakey[1]>=0)
  {
    angleCom = 90;
  }
  else if(abs(snakeComx[1]-snakex[1]) < abs(snakeComy[1]-snakey[1]) && angleCom==90 && snakeComy[1]-16!=snakeComy[1] && snakeComx[1]-snakex[1]<=0)
  {
    angleCom = 0;
  }
  else if(abs(snakeComx[1]-snakex[1]) < abs(snakeComy[1]-snakey[1]) && angleCom==90 && snakeComy[1]-16!=snakeComy[1] && snakeComx[1]-snakex[1]>=0)
  {
    angleCom = 180;
  }
  
  else if(abs(snakeComx[1]-snakex[1]) < abs(snakeComy[1]-snakey[1]) && angleCom!=270 && snakeComy[1]+16!=snakeComy[1] && snakeComy[1]-snakey[1]<=0)
  {
    angleCom = 270;
  }
  else if(abs(snakeComx[1]-snakex[1]) < abs(snakeComy[1]-snakey[1]) && angleCom==270 && snakeComy[1]+16!=snakeComy[1] && snakeComx[1]-snakex[1]<=0)
  {
    angleCom = 0;
  }
  else if(abs(snakeComx[1]-snakex[1]) < abs(snakeComy[1]-snakey[1]) && angleCom==270 && snakeComy[1]+16!=snakeComy[1] && snakeComx[1]-snakex[1]>=0)
  {
    angleCom = 180;
  }
}