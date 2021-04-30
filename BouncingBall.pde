// declare variables I will use in this project first
boolean start;
boolean move1;
boolean move2;
boolean move3;
boolean move4;
boolean reset;
float speed;
float speed2;
float x;
float y;
float r;
float paddleX;
float paddleY;
float paddleW;
float paddleH;
float paddleS;
float paddleX2;
float paddleY2;
int live1=3;
int live2=3;
//trail
float []trail1=new float[20];
float []trail2=new float[20];

// set up necessary values
void setup(){
  size(800,600);
  speed2=random(1,2);
  x=width/2;
  y=height/2;
  r=20;
  rectMode(CENTER);
  paddleX=0;
  paddleY=height/2;
  paddleX2=width;
  paddleY2=height/2;
  paddleW=20;
  paddleH=100;
  paddleS=6;
  //make the ball start moving with random direction
  chooseSpeed();
  chooseSpeed2();
}
void draw(){
  background(0);
  drawEllipse();
  trail1[0]=x;
  trail2[0]=y;
  //ellipse(x,y,r,r);
  drawPaddle();
  movePaddle();
  limitPaddle();
  touchPaddle();
  drawPaddle2();
  movePaddle2();
  limitPaddle2();
  touchPaddle2();
  live();
  //start the ball
  if(start==true){
    x+=speed;
    y+=speed2; 
  // The ball moves and bounces well at the top and bottom canvas boundary
    if(y>height-r/2||y<0+r/2){
   speed2*=-1;
  }
   if(x==0){
    live1-=1;
  }
  if(x==width){
    live2-=1;
  }
  //Displaying Game Over messages
  if(live1<0){
    background(0);
    textSize(100);
    text("Game Over",150,300);
    text("Player2 wins",140,400);
  }
  if(live2<0){
    background(0);
    textSize(100);
    text("Game Over",150,300);
    text("Player1 wins",140,400);
  }
    //noloop();

if(x+r/2<0||x-r/2>width){
  speed=0;
  speed2=0;
}
}
}
void keyPressed(){
    // press key t to start the game or pause the game
    if (key=='t'||key=='T'){
      start=true;
    }
    //The paddles are controlled properly with the designated keys
  // press key to make the paddle go up
    if (key=='w'||key=='W'){
    move1=true;
  }
  // press key to make the paddle to go down
   if (key=='s'||key=='S'){
    move2=true;
  }
  // press key to make the paddle2 to go up
   if (key=='i'||key=='I'){
    move3=true;
  }
  // press key to make the paddle2 to go down
   if (key=='k'||key=='K'){
    move4=true;
  }
  
   if (key=='n'||key=='N'){
     setup();
     draw();
  }
  
  save("Project3version1.pde");
  }
  
void keyReleased(){
    // press key to make the paddle go up
  if (key=='w'||key=='W'){
    move1=false;
  }
  // press key to make the paddle to go down
   if (key=='s'||key=='S'){
    move2=false;
  }
  if (key=='i'||key=='I'){
    move3=false;
  }
  if (key=='k'||key=='K'){
    move4=false;
  }
}  
//visualized trail
void drawEllipse(){
float t1=trail1[0];
float t2=trail2[0];
  for(int i=trail1.length-1;i>0;i--){
    trail1[0]=t1;
    trail1[i]=trail1[i-1];
    trail2[0]=t2;
    trail2[i]=trail2[i-1];
  }
  for(int i=0;i<trail1.length-1;i++){
  fill(255);
  noStroke();
  ellipse(trail1[i],trail2[i],r-i,r-i);
  }
}
void drawPaddle(){
  fill(255);
  rect(paddleX,paddleY,paddleW,paddleH);
}
void movePaddle(){
  if(move1){
    paddleY-=paddleS;
  }
  if(move2){
    paddleY+=paddleS;
  }
}
//limit the paddle, dont let it move out of the canvas
void limitPaddle(){
  if(paddleY-paddleH/2<0){
    paddleY= paddleY+paddleS;
  }
  if(paddleY+paddleH/2>height){
    paddleY=paddleY-paddleS;
}
}
//The ball bounces correctly at left paddle
void touchPaddle(){
  if(paddleX+paddleW/2>x-r/2&&y-r/2<paddleY+paddleH/2&&y+r/2>paddleY-paddleH/2){
    speed=-speed;
    
  }
}
// the right paddle
void drawPaddle2(){
  fill(255);
  rect(paddleX2,paddleY2,paddleW,paddleH);
}
void movePaddle2(){
  if(move3){
    paddleY2-=paddleS;
  }
  if(move4){
    paddleY2+=paddleS;
  }
}
//limit the paddle2, dont let it move out of the canvas
void limitPaddle2(){
  if(paddleY2-paddleH/2<0){
    paddleY2= paddleY2+paddleS;
  }
  if(paddleY2+paddleH/2>height){
    paddleY2=paddleY2-paddleS;
}
}
//The ball bounces correctly at paddle2
void touchPaddle2(){
  if(paddleX2-paddleW/2<x+r/2&&y-r/2<paddleY2+paddleH/2&&y+r/2>paddleY2-paddleH/2){
    speed=-speed;
  }
}
void chooseSpeed(){
  float choose=random(0,10);
  if(choose>=5){
    speed=4;
  }else{
    speed=-4;
  }
}
void chooseSpeed2(){
  float choose2=random(0,10);
  if(choose2>=5){
    speed2=random(3,10);
  }else{
    speed2=random(-10,-3);
  }
}
//Displaying the remaining lives of each player
void live(){
  fill(255);
  textSize(20);
  text("Player 1 Lives remain: "+live1,20,30);
  text("Player 2 Lives remain: "+live2,520,height-20);
}
