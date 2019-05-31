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
  float totaldistance;
  Projectile(float startx, float starty,float totalv,float totala){
    initialx=startx;
    initialy=starty;
    velocity= 80;
    angle = radians(10);
    println(sin(angle));
    vy= sin(angle)* velocity;
    vx=cos(angle)*velocity;
    t=0;
    currentx=initialx;
    currenty=initialy;
    totaldistance=velocity*velocity*sin(2*angle)/9.8;
    println("Velocities: " +vx+", "+vy);
  }
  void display(){
    fill(0,0,0);
    ellipse(currentx,currenty, 10,10);
}
void move(){
  t=0;
  while(currentx>0 &&currentx<totaldistance){//&& currenty>0 && currentx<width && currenty<height){
  currentx=initialx+vx*t;
  currenty=initialy+vy*t-4.9*t*t;
  t+=.1;
 // fill(0,0,0);
  //ellipse(initialx,initialy,5,5);
  println("vy*t is: " +(vy*t)+ "4.9*t*t is: "+(4.9*t*t)+"difference is, "+(currenty-initialy)+" " + currenty);
  }
}
//range= velocty*sin(2*angle)
}
