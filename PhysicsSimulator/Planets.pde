class Planet implements Displayable, Moveable {
  float radius;
  float xCor;
  float yCor;
  float mass;
  float angle;
  float speed;
  float a;
  float centerx;
  float centery;
  String name;
  float e;
  float b;
  float c;
  float period;

  Planet(float x, float y, float rad, String nm, float ecc, float period) { //Planet class
    e=ecc;
    radius = rad; 
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
    a = (float) Math.sqrt((sunX-xCor)*(sunX-xCor) + (sunY-yCor)*(sunY-yCor)) / (1+e); //half of major axis of ellipse
    angle = 0; 
    speed = PI/180/period;//random(-PI/180, PI/180); //to be determined by mass/force of gravity
    name = nm;
    c = e*a;
    b = (float)Math.sqrt(a*a - c*c);
    centerx = sunX + (c/(a+c))*(xCor - sunX);
    centery = sunY + (c/(a+c))*(yCor - sunY);
    println(e);
  }

  void display() {
    fill(255, 255, 0);
    circle(xCor, yCor, radius);
  }

  void move() { //will determine elliptical motion of each planet
    angle += speed;
    xCor = sin(angle) * a + centerx; 
    yCor = cos(angle) * b + centery;
  } 

  void setName(String nm) {
    name = nm;
  }

  void setE(float ecc) {
    e = ecc;
  }

}
