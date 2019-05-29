class Projectile implements Displayable, Moveable{
  float initialx;
  float velocity;
  float initialy;
  float angle;
  float vx;
  float vy;
  float t;
  float currenty;
  float currentx;
  Projectile(float startx, float starty,float totalv,float totala){
    initialx=startx;
    initialy=starty;
    velocity= 10;
    angle = radians(10);
    println(sin(angle));
    vy= sin(angle)* velocity;
    vx=cos(angle)*velocity;
    t=0;
    currentx=initialx;
    currenty=initialy;
    println("Velocities: " +vx+", "+vy);
  }
  void display(){
    fill(0,0,0);
    triangle(currentx,currenty, initialx+20,initialy,initialx+10,initialy+13);
}
void move(){
  t=0;
  float currentvy=vy;
  while(currentx>0 && currenty>0 && currentx<width && currenty<height){
  currentx=initialx+vx*t;
  currentvy=-9.8*t+vy;
  float highestheight=vy*vy/(2*9.8);
  float totaltime=2*highestheight/vy;
  if( t<totaltime/2) currenty=initialy-vy*t;//+0.5*9.8*t*t;
  else currenty=initialy+vy*t;
  t+=0.1;
  println(""+ currentx+","+currenty+" "+t+", "+currentvy);
 // fill(0,0,0);
  //ellipse(initialx,initialy,5,5);
  }
}
}
