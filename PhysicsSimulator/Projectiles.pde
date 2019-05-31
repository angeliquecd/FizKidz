class Projectile implements Displayable, Moveable {
  float initialx;
  float velocity;
  float initialy;
  float angle;
  float vx;
  float vy;
  float t;
  float currenty;
  float currentx;
  float speed;
  float totaldistance;

  Projectile(float startx, float starty, float totalv, float totala) {
    initialx=startx;
    initialy=starty;
    velocity= totalv;
    angle = radians(totala);
    println(sin(angle));
    vy= sin(angle)* velocity;
    vx=cos(angle)*velocity;
    vx/=10;
    vy/=10;
    t=0; //parameter for parametric equations, determined by time of flight equation: T = 2*vy/g
    speed = 2;
    currentx=initialx;
    currenty=initialy;
    totaldistance=velocity*velocity*sin(2*angle)/9.8;
    println("Velocities: " +vx+", "+vy);
  }
  void display() {
    setupDisplay();
    fill(0, 0, 0);
    //triangle(currentx, currenty, initialx+20, initialy, initialx+10, initialy+13);
    ellipse(currentx, currenty, 40, 40);
    println(""+currentx+", "+currenty);
  }

  void setupDisplay() {
    fill(124, 252, 0);
    rect(0, height - 50, width, 50);
  }

  void move() {
    //while (currenty >= initialy) {
    t+=speed;
    currentx = vx * t + initialx;
    currenty = -vy * t + 1/2*9.81*t*t + initialy;
    println(currenty);
    //}
    //t=0;
    //float currentvy=vy;
    //while (currentx>0 && currenty>0 && currentx<width && currenty<height) {
    //  currentx=initialx+vx*t;
    //  currentvy=-9.8*t+vy;
    //  float highestheight=vy*vy/(2*9.8);
    //  float totaltime=2*highestheight/vy;
    //  if ( t<totaltime/2) currenty=initialy-vy*t;//+0.5*9.8*t*t;
    //  else currenty=initialy+vy*t;
    //  t+=speed;
    //  println(""+ currentx+","+currenty+" "+t+", "+currentvy);
    //  // fill(0,0,0);
    //  //ellipse(initialx,initialy,5,5);
    //}
  }
}
