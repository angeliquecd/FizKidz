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
    vy= sin(angle)*velocity/10;
    vx= cos(angle)*velocity/10;
    t=0; //parameter for parametric equations, determined by time of flight equation: T = 2*vy/g
    speed = 1;
    currentx=initialx;
    currenty=initialy;
    //totaldistance=velocity*velocity*sin(2*angle)/9.8;
    //println("Velocities: " +vx+", "+vy);
  }
  void display() {
    setupDisplay();
    fill(0, 0, 0);
    ellipse(currentx, currenty, 40, 40);
    //println(""+currentx+", "+currenty);
  }

  void setupDisplay() {
    fill(124, 252, 0);
    noStroke();
    rect(0, height - 50, width, 50);
    stroke(0);
  }

  void move() {
    if (currenty <= initialy) {
      t+=speed;
      currentx = vx * t + initialx;
      currenty = .5*.00981*t*t - vy*t + initialy;
    }
  }
}
