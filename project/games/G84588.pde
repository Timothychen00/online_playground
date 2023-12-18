int Health=10000,HealthO=10000;
int score=0,EasyScorePlus=5,NormalScorePlus=20,HardScorePlus=100;
//int InsaneX,InsaneY,InsaneVx,InsaneHP=2^64;
int enemyAttack_TIME=0;
float MP=0,EasyMPPlus=5,NormalMPPlus=10,HardMPPlus=20;
int CD;
String STATUS="Start";
int [ ] teki = new int [5];
int [ ] enemyAttackY = new int [5];
int [ ] HP = new int [5];
int [ ] HPO = new int [5];
char [ ] TG = new char [5];
int [ ] X = new int [5];
int [] Vx = new int [5];
PImage GameStart,Setting;
PImage EasyCharacter,NormalCharacter,HardCharacter;
PImage EasyAttack,NormalAttack,HardAttack;
PImage haikeiEasy,haikeiNormal,haikeiHard,haikeiInsane;
PImage enemyAttack,enemyAttack_mahoujin,enemyAttack_mahoujin_kidou;
PImage [ ] EasyEnemy = new PImage[5];
PImage [ ] NormalEnemy = new PImage[5];
PImage [ ] HardEnemy = new PImage[5];
//PImage InsaneBoss;

void setup(){
    size(1576,900);
    X[0]=width;
    X[1]=width;
    X[2]=width;
    X[3]=width;
    X[4]=width;
    textSize(25); 
    
    GameStart=loadImage("GameStart.png");
    Setting=loadImage("Setting.png");
    
    EasyCharacter=loadImage("EasyCharacter.png");
    NormalCharacter=loadImage("NormalCharacter.png");
    HardCharacter=loadImage("HardCharacter.png");
    
    haikeiEasy=loadImage("haikeiEasy.jpg");
    haikeiNormal=loadImage("haikeiNormal.jpg");
    haikeiHard=loadImage("haikeiHard.jpg");
    
    enemyAttack=loadImage("enemyAttack.png");
    enemyAttack_mahoujin=loadImage("enemyAttack_mahoujin.png");
    enemyAttack_mahoujin_kidou=loadImage("enemyAttack_mahoujin_kidou.png");
    
    EasyEnemy [0]=loadImage("Enemy.png");  
    EasyEnemy [1]=loadImage("Enemy1.png");
    EasyEnemy [2]=loadImage("Enemy2.png");
    EasyEnemy [3]=loadImage("Enemy3.png");
    EasyEnemy [4]=loadImage("Enemy4.png");
    NormalEnemy [0]=loadImage("NormalEnemy.png");
    NormalEnemy [1]=loadImage("NormalEnemy1.png");
    NormalEnemy [2]=loadImage("NormalEnemy2.png");
    NormalEnemy [3]=loadImage("NormalEnemy3.png");
    NormalEnemy [4]=loadImage("NormalEnemy4.png");
    HardEnemy [0]=loadImage("HardEnemy.png");
    HardEnemy [1]=loadImage("HardEnemy1.png");
    HardEnemy [2]=loadImage("HardEnemy2.png");
    HardEnemy [3]=loadImage("HardEnemy3.png");
    HardEnemy [4]=loadImage("HardEnemy4.png");
    //InsaneBoss =loadImage("InsaneBoss.png");
    
    EasyAttack = loadImage("EasyAttack.png");
    NormalAttack = loadImage("NormalAttack.png");
    HardAttack = loadImage("HardAttack.png");
}
void draw(){
    Start();
    background();
    character();
    attack();
    enemy();
    enemyAttack();
    score();
    status();
    Health();
    MP();
    Lost();
    
    Cheat();
    

}
void Start(){
  if(STATUS=="Start"){
     background(GameStart);
     if(keyPressed){
       if(key =='q' || key == 'Q'){
        STATUS = "Setting";
       } 
     }
  }
  if(STATUS == "Setting"){
      background(Setting);
  }
  if(STATUS == "Start" || STATUS == "Setting"){
      if(keyPressed){
         if(key == ' '){
            STATUS = "Easy";
         }
      }
  }

}
void background(){
    if (STATUS=="Easy"){
          background(haikeiEasy);    
    }
    if (STATUS=="Normal"){
          background(haikeiNormal);    
    }
    if (STATUS=="Hard"){
          background(haikeiHard);    
    }


}
void character(){
    if(STATUS == "Easy"){
     image(EasyCharacter,mouseX-33,mouseY-50);
    }
    if(STATUS == "Normal"){
     image(NormalCharacter,mouseX-50,mouseY-50);
    }
    if(STATUS == "Hard"){
     image(HardCharacter,mouseX-50,mouseY-75);
    }
    
    //ellipse(mouseX,mouseY,10,10);//head
    //line(mouseX,5+mouseY,mouseX,20+mouseY);//body
    //line(mouseX,6+mouseY,mouseX-10,15+mouseY);//left hand
    //line(mouseX,6+mouseY,10+mouseX,15+mouseY);//right hand
    //line(mouseX,20+mouseY,mouseX-10,30+mouseY);//left foot
    //line(mouseX,20+mouseY,10+mouseX,30+mouseY);//right foot  
}
void attack(){
   //BEEEEMu
   
   if(STATUS=="Easy"){
      if (mousePressed==true){
         for(int c1=mouseX,c2=mouseY;c1<width;c1+=50){
                     image(EasyAttack,c1+37,c2-30);
                   //ellipse(c1,c2,1,1);
          }
  
        }

   }
   if(STATUS=="Normal"){
      if (mousePressed==true){
         for(int c1=mouseX,c2=mouseY;c1<width;c1+=33.5){
            
                   image(NormalAttack,c1+123,c2-60);
          }
  
        }
   }
   if(STATUS=="Hard"){
      if (mousePressed==true){
         for(int c1=mouseX,c2=mouseY;c1<width;c1+=150){
            
                   image(HardAttack,c1+87,c2-74);
          }
  
        }
   }
    
    //ATTACK
    if(STATUS=="Easy"){
      if(keyPressed && MP>50){
        if(key == 'x' || key == 'X'){
          if(mousePressed){
                      if(mouseY>=teki [0]-30 && mouseY<=teki[0]+80+30 && mouseX<=X[0]+130){
                                       HP[0]-=1000;
                        }
                      if(mouseY>=teki [1]-30 && mouseY<=teki [1]+54+30 && mouseX<=X[1]+118){
                                       HP[1]-=1000;
                        }
                      if(mouseY>=teki [2]-30 && mouseY<=teki [2]+36+30 && mouseX<=X[2]+156){
                                       HP[2]-=1000;
                        }
                      if(mouseY>=teki [3]-30 && mouseY<=teki [3]+50+30 && mouseX<=X[3]+66){
                                       HP[3]-=1000;
                        }
                      if(mouseY>=teki [4]-30 && mouseY<=teki [4]+70+30 && mouseX<=X[4]+114){
                                       HP[4]-=1000;
                        }
                        MP-=2;
          }
            
        }
      
      }
        if(mousePressed){
                      if(mouseY>=teki [0]-30 && mouseY<=teki[0]+80+30 && mouseX<=X[0]+130){
                                       HP[0]-=1;
                        }
                      if(mouseY>=teki [1]-30 && mouseY<=teki [1]+54+30 && mouseX<=X[1]+118){
                                       HP[1]-=1;
                        }
                      if(mouseY>=teki [2]-30 && mouseY<=teki [2]+36+30 && mouseX<=X[2]+156){
                                       HP[2]-=1;
                        }
                      if(mouseY>=teki [3]-30 && mouseY<=teki [3]+50+30 && mouseX<=X[3]+66){
                                       HP[3]-=1;
                        }
                      if(mouseY>=teki [4]-30 && mouseY<=teki [4]+70+30 && mouseX<=X[4]+114){
                                       HP[4]-=1;
                        }
          }
       }

         if(STATUS=="Normal"){
           if(keyPressed && MP>50){
                  if(key == 'x' || key == 'X'){
                      if(mousePressed){
                          if(mouseY>=teki [0]-60 && mouseY<=teki [0]+232+60 && mouseX<=X[0]+246){
                                           HP[0]-=1000;
                            }
                          if(mouseY>=teki [1]-60 && mouseY<=teki [1]+216+60 && mouseX<=X[1]+222){
                                           HP[1]-=1000;
                            }
                          if(mouseY>=teki [2]-60 && mouseY<=teki [2]+116+60 && mouseX<=X[2]+164){
                                           HP[2]-=1000;
                            }
                          if(mouseY>=teki [3]-60 && mouseY<=teki [3]+178+60&& mouseX<=X[3]+110){
                                           HP[3]-=1000;
                            }
                          if(mouseY>=teki [4]-60 && mouseY<=teki [4]+192+60 && mouseX<=X[4]+116){
                                           HP[4]-=1000;
                            }
                          MP-=3;
                        }
                    }
              }
             if(mousePressed){
                      if(mouseY>=teki [0]-60 && mouseY<=teki [0]+232+60 && mouseX<=X[0]+246){
                                       HP[0]-=10;
                        }
                      if(mouseY>=teki [1]-60 && mouseY<=teki [1]+216+60 && mouseX<=X[1]+222){
                                       HP[1]-=10;
                        }
                      if(mouseY>=teki [2]-60 && mouseY<=teki [2]+116+60 && mouseX<=X[2]+164){
                                       HP[2]-=10;
                        }
                      if(mouseY>=teki [3]-60 && mouseY<=teki [3]+178+60&& mouseX<=X[3]+110){
                                       HP[3]-=10;
                        }
                      if(mouseY>=teki [4]-60 && mouseY<=teki [4]+192+60 && mouseX<=X[4]+116){
                                       HP[4]-=10;
                        }
                      
          }
    }
    if(STATUS=="Hard"){
           if(keyPressed && MP>50){
                  if(key == 'x' || key == 'X'){
                      if(mousePressed){
                          if(mouseY>=teki [0]-74 && mouseY<=teki [0]+150+74 && mouseX<=X[0]+247){
                                           HP[0]-=1000;
                            }
                          if(mouseY>=teki [1]-74 && mouseY<=teki [1]+254+74 && mouseX<=X[1]+560){
                                           HP[1]-=1000;
                            }
                          if(mouseY>=teki [2]-74 && mouseY<=teki [2]+300+74 && mouseX<=X[2]+381){
                                           HP[2]-=1000;
                            }
                          if(mouseY>=teki [3]-74 && mouseY<=teki [3]+250+74 && mouseX<=X[3]+264){
                                           HP[3]-=1000;
                            }
                          if(mouseY>=teki [4]-74 && mouseY<=teki [4]+220+74 && mouseX<=X[4]+256){
                                           HP[4]-=1000;
                            }
                          MP-=5;
                        }
                    }
              }
        if(mousePressed){
                      if(mouseY>=teki [0]-74 && mouseY<=teki [0]+150+74 && mouseX<=X[0]+247){
                                       HP[0]-=50;
                        }
                      if(mouseY>=teki [1]-74 && mouseY<=teki [1]+254+74 && mouseX<=X[1]+560){
                                       HP[1]-=50;
                        }
                      if(mouseY>=teki [2]-74 && mouseY<=teki [2]+300+74 && mouseX<=X[2]+381){
                                       HP[2]-=50;
                        }
                      if(mouseY>=teki [3]-74 && mouseY<=teki [3]+250+74 && mouseX<=X[3]+264){
                                       HP[3]-=50;
                        }
                      if(mouseY>=teki [4]-74 && mouseY<=teki [4]+220+74 && mouseX<=X[4]+256){
                                       HP[4]-=50;
                        }
          }
    }
    //ATTACK
}
void enemy(){
  //Easy
  if(STATUS=="Easy"){
      if(X[0]==width && X[1]==width && X[2]==width && X[3]==width && X[4]==width){
            for(int i =0;i<5;i++){    
                teki [i]=int (random(20,height-20));
                HP [i]=int (random(50,100));
                TG [i]='B';
                Vx [i] = int (random(4,7));
                HPO[i] = HP [i]; 
              }

    }
    if(HP[0]>0)
                TG[0]='B';       
    if(HP[0]<=0&&TG[0]=='B')
                TG[0]='A';
    if(TG[0]=='A'&& X[0]>0){
                score+=EasyScorePlus;
                MP+=EasyMPPlus;
                TG[0]='C';
    }
    
    switch(TG[0]){
                case 'C' :
                fill(255);
                fill(0);        
        
                break;
                default :              
                //ellipse(x,teki [0],100,100);
                image(EasyEnemy [0],X[0],teki [0]);
                if(HP[0]>HPO[0]*2/3){
                  fill(#23C141);
                }
                if(HP[0]<=HPO[0]*2/3){
                  fill(#D1801E);
                }
                if(HP[0]<=HPO[0]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[0],x,teki [0]);
                rect(X[0],teki[0]-10,HP[0],10);
                fill(0);
    
    
    }
    
    if(HP[1]>0)
                TG[1]='B';       
    if(HP[1]<=0&&TG[1]=='B')
                TG[1]='A';
    if(TG[1]=='A' && X[1]>0){
                score+=EasyScorePlus;
                MP+=EasyMPPlus;
                TG[1]='C';
    }
    
    switch(TG[1]){
                case 'C' :
                fill(255);
                fill(0);

        
                break;
                default :          
                //ellipse(x,teki [1],100,100);
                image(EasyEnemy [1],X[1],teki [1]);
                if(HP[1]>HPO[1]*2/3){
                  fill(#23C141);
                }
                if(HP[1]<=HPO[1]*2/3){
                  fill(#D1801E);
                }
                if(HP[1]<=HPO[1]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[1],x,teki [1]);
                rect(X[1],teki[1]-10,HP[1],10);
                fill(0);
    
    
    }
    
    if(HP[2]>0)
                TG[2]='B';       
    if(HP[2]<=0&&TG[2]=='B')
                TG[2]='A';
    if(TG[2]=='A' && X[2]>0){
                score+=EasyScorePlus;
                MP+=EasyMPPlus;
                TG[2]='C';
    }
    
    switch(TG[2]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [2],100,100);
                image(EasyEnemy [2],X[2],teki [2]);
                if(HP[2]>HPO[2]*2/3){
                  fill(#23C141);
                }
                if(HP[2]<=HPO[2]*2/3){
                  fill(#D1801E);
                }
                if(HP[2]<=HPO[2]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[2],x,teki [2]);
                rect(X[2],teki[2]-10,HP[2],10);
                fill(0);
    
    
    }
    
        if(HP[3]>0)
                TG[3]='B';       
    if(HP[3]<=0&&TG[3]=='B')
                TG[3]='A';
    if(TG[3]=='A' && X[3]>0){
                score+=EasyScorePlus;
                MP+=EasyMPPlus;
                TG[3]='C';
    }
    
    switch(TG[3]){
                case 'C' :
                fill(255);
                fill(0);             
        
                break;
                default :
                //ellipse(x,teki [3],100,100);
                image(EasyEnemy [3],X[3],teki [3]);
                if(HP[3]>HPO[3]*2/3){
                  fill(#23C141);
                }
                if(HP[3]<=HPO[3]*2/3){
                  fill(#D1801E);
                }
                if(HP[3]<=HPO[3]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[3],x,teki [3]);
                rect(X[3],teki[3]-10,HP[3],10);
                fill(0);
    
    
    }
    
    if(HP[4]>0)
                TG[4]='B';       
    if(HP[4]<=0&&TG[4]=='B')
                TG[4]='A';
    if(TG[4]=='A' && X[4]>0){
                score+=EasyScorePlus;
                MP+=EasyMPPlus;
                TG[4]='C';
    }
   
    switch(TG[4]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [4],100,100);
                image(EasyEnemy [4],X[4],teki [4]);
                if(HP[4]>HPO[4]*2/3){
                  fill(#23C141);
                }
                if(HP[4]<=HPO[4]*2/3){
                  fill(#D1801E);
                }
                if(HP[4]<=HPO[4]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[4],x,teki [4]);
                rect(X[4],teki[4]-10,HP[4],10);
                fill(0);
    
    }
  }
  //Easy
  
  //Normal
  if(STATUS=="Normal"){
      if(X[0]==width && X[1]==width && X[2]==width && X[3]==width && X[4]==width){
            for(int i =0;i<5;i++){
                teki [i]=int (random(20,height-20));
                HP [i]=int (random(1000,1500));
                TG [i]='B';
                Vx [i] = int (random(3,7));
                HPO[i] = HP [i];
              }
 
    }                                                               
    if(HP[0]>0)
                TG[0]='B';       
    if(HP[0]<=0&&TG[0]=='B')
                TG[0]='A';
    if(TG[0]=='A' && X[0]>0){
                score+=NormalScorePlus;
                MP+=NormalMPPlus;
                TG[0]='C';
    }
    
    switch(TG[0]){
                case 'C' :
                fill(255);
                fill(0);              
        
                break;
                default :              
                //ellipse(x,teki [0],200,200);
                image(NormalEnemy [0],X[0],teki [0]);
                if(HP[0]>HPO[0]*2/3){
                  fill(#23C141);
                }
                if(HP[0]<=HPO[0]*2/3){
                  fill(#D1801E);
                }
                if(HP[0]<=HPO[0]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[0],x,teki [0]);
                rect(X[0],teki[0]-15,HP[0]/8,15);
                fill(0);
    
    
    }
    
    if(HP[1]>0)
                TG[1]='B';       
    if(HP[1]<=0&&TG[1]=='B')
                TG[1]='A';
    if(TG[1]=='A' && X[1]>0){
                score+=NormalScorePlus;
                MP+=NormalMPPlus;
                TG[1]='C';
    }
    
    switch(TG[1]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [1],200,200);
                image(NormalEnemy [1],X[1],teki [1]);
                if(HP[1]>HPO[1]*2/3){
                  fill(#23C141);
                }
                if(HP[1]<=HPO[1]*2/3){
                  fill(#D1801E);
                }
                if(HP[1]<=HPO[1]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[1],x,teki [1]);
                rect(X[1],teki[1]-15,HP[1]/8,15);
                fill(0);
    
    
    }
    
    if(HP[2]>0)
                TG[2]='B';       
    if(HP[2]<=0&&TG[2]=='B')
                TG[2]='A';
    if(TG[2]=='A' && X[2]>0){
                score+=NormalScorePlus;
                MP+=NormalMPPlus;
                TG[2]='C';
    }
    
    switch(TG[2]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [2],200,200);
                image(NormalEnemy [2],X[2],teki [2]);
                if(HP[2]>HPO[2]*2/3){
                  fill(#23C141);
                }
                if(HP[2]<=HPO[2]*2/3){
                  fill(#D1801E);
                }
                if(HP[2]<=HPO[2]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[2],x,teki [2]);
                rect(X[2],teki[2]-15,HP[2]/8,15);
                fill(0);
    
    
    }
    
    if(HP[3]>0)
                TG[3]='B';       
    if(HP[3]<=0&&TG[3]=='B')
                TG[3]='A';
    if(TG[3]=='A' && X[3]>0){
                score+=NormalScorePlus;
                MP+=NormalMPPlus;
                TG[3]='C';
    }
    
    switch(TG[3]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [3],200,200);
                image(NormalEnemy [3],X[3],teki [3]);
                if(HP[3]>HPO[3]*2/3){
                  fill(#23C141);
                }
                if(HP[3]<=HPO[3]*2/3){
                  fill(#D1801E);
                }
                if(HP[3]<=HPO[3]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[3],x,teki [3]);
                rect(X[3],teki[3]-15,HP[3]/8,15);
                fill(0);
    
    
    }
    
    if(HP[4]>0)
                TG[4]='B';       
    if(HP[4]<=0&&TG[4]=='B')
                TG[4]='A';
    if(TG[4]=='A' && X[4]>0){
                score+=NormalScorePlus;
                MP+=NormalMPPlus;
                TG[4]='C';
    }
   
    switch(TG[4]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [4],200,200);
                image(NormalEnemy [4],X[4],teki [4]);
                if(HP[4]>HPO[4]*2/3){
                  fill(#23C141);
                }
                if(HP[4]<=HPO[4]*2/3){
                  fill(#D1801E);
                }
                if(HP[4]<=HPO[4]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[4],x,teki [4]);
                rect(X[4],teki[4]-15,HP[4]/8,15);
                fill(0);
    
    }
  }
  //Normal
  
  //HARD
  if(STATUS=="Hard"){
      if(X[0]==width && X[1]==width && X[2]==width && X[3]==width && X[4]==width){
            for(int i =0;i<5;i++){   
                teki [i]=int (random(20,height-20));
                HP [i]=int (random(5000,10000));
                TG [i]='B';
                Vx [i] = int (random(1,5));
                HPO[i] = HP [i];
              } 
    }
    if(HP[0]>0)
                TG[0]='B';       
    if(HP[0]<=0&&TG[0]=='B')
                TG[0]='A';
    if(TG[0]=='A' && X[0]>0){
                score+=HardScorePlus;
                MP+=HardMPPlus;
                TG[0]='C';
    }  
    switch(TG[0]){
                case 'C' :
                fill(255);
                fill(0);
               
        
                break;
                default :              
                //ellipse(x,teki [0],350,350);
                image(HardEnemy [0],X[0],teki [0]);
                if(HP[0]>HPO[0]*2/3){
                  fill(#23C141);
                }
                if(HP[0]<=HPO[0]*2/3){
                  fill(#D1801E);
                }
                if(HP[0]<=HPO[0]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[0],x,teki [0]);
                rect(X[0],teki[0]-20,HP[0]/25,20);
                fill(0);
    
    
    }
    
    if(HP[1]>0)
                TG[1]='B';       
    if(HP[1]<=0&&TG[1]=='B')
                TG[1]='A';
    if(TG[1]=='A' && X[1]>0){
                score+=HardScorePlus;
                MP+=HardMPPlus;
                TG[1]='C';
    }
    
    switch(TG[1]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [1],350,350);
                image(HardEnemy [1],X[1],teki [1]);
                if(HP[1]>HPO[1]*2/3){
                  fill(#23C141);
                }
                if(HP[1]<=HPO[1]*2/3){
                  fill(#D1801E);
                }
                if(HP[1]<=HPO[1]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[1],x,teki [1]);
                rect(X[1],teki[1]-20,HP[1]/25,20);
                fill(0);
    
    
    }
    
    if(HP[2]>0)
                TG[2]='B';       
    if(HP[2]<=0&&TG[2]=='B')
                TG[2]='A';
    if(TG[2]=='A' && X[2]>0){
                score+=HardScorePlus;
                MP+=HardMPPlus;
                TG[2]='C';
    }
    
    switch(TG[2]){
                case 'C' :
                fill(255);
                fill(0);
        
                break;
                default :
                //ellipse(x,teki [2],350,350);
                image(HardEnemy [2],X[2],teki [2]);
                if(HP[2]>HPO[2]*2/3){
                  fill(#23C141);
                }
                if(HP[2]<=HPO[2]*2/3){
                  fill(#D1801E);
                }
                if(HP[2]<=HPO[2]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[2],x,teki [2]);
                rect(X[2],teki[2]-20,HP[2]/25,20);
                fill(0);
    
    
    }
    
    if(HP[3]>0)
                TG[3]='B';       
    if(HP[3]<=0&&TG[3]=='B')
                TG[3]='A';
    if(TG[3]=='A' && X[3]>0){
                score+=HardScorePlus;
                MP+=HardMPPlus;
                TG[3]='C';
    }
    
    switch(TG[3]){
                case 'C' :
                fill(255);
                fill(0);         
        
                break;
                default :
                //ellipse(x,teki [3],350,350);
                image(HardEnemy [3],X[3],teki [3]);
                if(HP[3]>HPO[3]*2/3){
                  fill(#23C141);
                }
                if(HP[3]<=HPO[3]*2/3){
                  fill(#D1801E);
                }
                if(HP[3]<=HPO[3]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[3],x,teki [3]);
                rect(X[3],teki[3]-20,HP[3]/25,20);
                fill(0);
    
    
    }
    
    if(HP[4]>0)
                TG[4]='B';       
    if(HP[4]<=0&&TG[4]=='B')
                TG[4]='A';
    if(TG[4]=='A' && X[4]>0){
                score+=HardScorePlus;
                MP+=HardMPPlus;
                TG[4]='C';
    }
   
    switch(TG[4]){
                case 'C' :
                fill(255);
                fill(0);

                break;
                default :
                //ellipse(x,teki [4],350,350);
                image(HardEnemy [4],X[4],teki [4]);
                if(HP[4]>HPO[4]*2/3){
                  fill(#23C141);
                }
                if(HP[4]<=HPO[4]*2/3){
                  fill(#D1801E);
                }
                if(HP[4]<=HPO[4]/4){
                  fill(#EA0C0C);
                }
                //text("HP:"+HP[4],x,teki [4]);
                rect(X[4],teki[4]-20,HP[4]/25,20);
                fill(0);
    
    }
  }
    //HARD
    if(STATUS=="Easy"){
        X[0]-=Vx[0];
        X[1]-=Vx[1];
        X[2]-=Vx[2];
        X[3]-=Vx[3];
        X[4]-=Vx[4];
    
    }
    if(STATUS=="Normal"){
        X[0]-=Vx[0];
        X[1]-=Vx[1];
        X[2]-=Vx[2];
        X[3]-=Vx[3];
        X[4]-=Vx[4];
    }
    if(STATUS=="Hard"){
        X[0]-=Vx[0];
        X[1]-=Vx[1];
        X[2]-=Vx[2];
        X[3]-=Vx[3];
        X[4]-=Vx[4];
    }
    if(X[0]<0 && X[1]<0 && X[2]<0 && X[3]<0 && X[4]<0){  
                //x=width; 
                X[0]=width;
                X[1]=width;
                X[2]=width;
                X[3]=width;
                X[4]=width;
    }
    if(HP[0]<=0 && HP[1]<=0 && HP[2]<=0 && HP[3]<=0 && HP[4]<=0){  
                //x=width; 
                X[0]=width;
                X[1]=width;
                X[2]=width;
                X[3]=width;
                X[4]=width;
    }
    //RESET
}
void enemyAttack(){
  if((STATUS == "Easy" || STATUS == "Normal" || STATUS == "Hard") && enemyAttack_TIME==0 ){
      for(int i=0; i<5 ; i++){
           enemyAttackY [i] = int (random(50,height-50));
      }
      enemyAttack_TIME=1;  
      CD=width;
  }
  if(CD<width && enemyAttack_TIME==1){
  image(enemyAttack_mahoujin,width-100,enemyAttackY [0]);
  image(enemyAttack_mahoujin,width-100,enemyAttackY [1]);
  image(enemyAttack_mahoujin,width-100,enemyAttackY [2]);
  image(enemyAttack_mahoujin,width-100,enemyAttackY [3]);
  image(enemyAttack_mahoujin,width-100,enemyAttackY [4]);
  }
  if(CD<width/2 && enemyAttack_TIME==1){
        image(enemyAttack_mahoujin_kidou,width-100,enemyAttackY [0]);
        image(enemyAttack_mahoujin_kidou,width-100,enemyAttackY [1]);
        image(enemyAttack_mahoujin_kidou,width-100,enemyAttackY [2]);
        image(enemyAttack_mahoujin_kidou,width-100,enemyAttackY [3]);
        image(enemyAttack_mahoujin_kidou,width-100,enemyAttackY [4]);
  }
  if(CD<=width/4 && enemyAttack_TIME==1){
        stroke(#FF0537);  
        strokeWeight(2);
        line(width-60,enemyAttackY [0]+40,0,enemyAttackY [0]+40);
        line(width-60,enemyAttackY [1]+40,0,enemyAttackY [1]+40);
        line(width-60,enemyAttackY [2]+40,0,enemyAttackY [2]+40);
        line(width-60,enemyAttackY [3]+40,0,enemyAttackY [3]+40);
        line(width-60,enemyAttackY [4]+40,0,enemyAttackY [4]+40);
        strokeWeight(1);
        stroke(0);
  }
  if(CD<width/20 && enemyAttack_TIME==1){
        for(int k1=width;k1>-30;k1-=30){
                image(enemyAttack,k1-100,enemyAttackY [0]+33);
                image(enemyAttack,k1-100,enemyAttackY [1]+33);
                image(enemyAttack,k1-100,enemyAttackY [2]+33);
                image(enemyAttack,k1-100,enemyAttackY [3]+33);
                image(enemyAttack,k1-100,enemyAttackY [4]+33);
                
           }
  if(STATUS=="Easy"){
        if((mouseY>=enemyAttackY [0]-17 && mouseY<=enemyAttackY [0]+83) || (mouseY>=enemyAttackY [1]-17 && mouseY<=enemyAttackY [1]+83) || (mouseY>=enemyAttackY [2]-17 && mouseY<=enemyAttackY [2]+83) || (mouseY>=enemyAttackY [3]-17 && mouseY<=enemyAttackY [3]+83) || (mouseY>=enemyAttackY [4]-17 && mouseY<=enemyAttackY [4]+83)){
           Health-=HealthO/500;
          }
  }       
  if(STATUS=="Normal"){
        if((mouseY>=enemyAttackY [0]-17 && mouseY<=enemyAttackY [0]+83) || (mouseY>=enemyAttackY [1]-17 && mouseY<=enemyAttackY [1]+83) || (mouseY>=enemyAttackY [2]-17 && mouseY<=enemyAttackY [2]+83) || (mouseY>=enemyAttackY [3]-17 && mouseY<=enemyAttackY [3]+83) || (mouseY>=enemyAttackY [4]-17 && mouseY<=enemyAttackY [4]+83)){
           Health-=HealthO/400;
          }
  }       
  if(STATUS=="Hard"){
        if((mouseY>=enemyAttackY [0]-42 && mouseY<=enemyAttackY [0]+108) || (mouseY>=enemyAttackY [1]-42 && mouseY<=enemyAttackY [1]+108) || (mouseY>=enemyAttackY [2]-42 && mouseY<=enemyAttackY [2]+108) || (mouseY>=enemyAttackY [3]-42 && mouseY<=enemyAttackY [3]+108) || (mouseY>=enemyAttackY [4]-42 && mouseY<=enemyAttackY [4]+108)){
           Health-=HealthO/300;
          }
  }       
  }
  fill(255);
  if(STATUS != "Start" && STATUS != "Setting" ){
      arc(75,160,50,50,0,2*PI-2*PI*CD/width);
      if(CD<=0 && enemyAttack_TIME==1){
        enemyAttack_TIME=0;
      }  
     
      CD-=3;
  }
  

}
void score(){
  if(STATUS != "Start" && STATUS != "Setting" ){
      text("Score:"+score,50,80);
  }
}
void status(){
        if (score>=200){
              STATUS="Normal";
        }
        if (score>=2000){
              STATUS="Hard";
        }
        text("Mode:"+STATUS,50,50);
        
        }
void Health(){
    if(X[0]<=0){
        if(HP[0]>0){
            Health-=HealthO/30;
            HP[0]=0;
          }
     }
    if(X[1]<=0){
        if(HP[1]>0){
            Health-=HealthO/30;
            HP[1]=0;
          }
     }
    if(X[2]<=0){
        if(HP[2]>0){
            Health-=HealthO/30;
            HP[2]=0;
          }
     }
    if(X[3]<=0){
        if(HP[3]>0){
            Health-=HealthO/30;
            HP[3]=0;
          }
     }
    if(X[4]<=0){
        if(HP[4]>0){
            Health-=HealthO/30;
            HP[4]=0;
          }
     
     }
    if(MP>=150){
       if(keyPressed){
         if(key=='z' || key=='Z'){
            MP-=150;
            Health+=HealthO/3;
         }
       
       }
    
    }
    if(STATUS != "Start" && STATUS != "Setting" ){
        fill(#23C141);
        rect(50,90,Health/50,20);
        fill(255);
    }
}
void MP(){
  if(STATUS != "Start" && STATUS != "Setting" ){
         if(MP<200){
               MP+=0.02;
         }
         if(MP>0){
               fill(#1AC1ED);
         }
         if(MP>50){
               fill(#1137ED);
         }
         if(MP>150){
               fill(#A11BDB);
         }
         if(MP>=200){
            MP=200;
         }
         rect(50,112,MP,20);
  }
}
void Lost(){
    if(Health<=0){
        noLoop();
        println("You Lost!!!");
      }
}
void Cheat(){
  if(keyPressed){
       if(key=='m' || key == 'M'){
           MP+=100;
       }
   }
  if (keyPressed){
      if (key == 'p' || key == 'P'){
          score+=20;
      }
  }
}