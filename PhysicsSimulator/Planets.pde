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

  Planet(float x, float y, float rad, String nm) { //Planet class
    radius = rad; //(float) Math.random() * 50;
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
    centerx = xCor - 2 * sunX; //I don't think these coordinates for center of ellipse are right
    centery = yCor - 2 * sunY;
    a = (float) Math.sqrt((sunX-xCor)*(sunX-xCor) + (sunY-yCor)*(sunY-yCor)) / (1+e); //half of major axis of ellipse
    angle = 0;
    speed = random(-PI/180, PI/180); //to be determined by mass/force of gravity
    name = nm;
    c = e/a;
    b = (float)Math.sqrt(a*a - c*c);
  }

  void display() {
    fill(255, 255, 0);
    circle(xCor, yCor, radius);
  }

  void move() { //will determine elliptical motion of each planet
    angle += speed;
    xCor = sin(angle) * a + sunX; 
    yCor = cos(angle) * b + sunY;
  }

  void setName(String nm) {
    name = nm;
  }

  void setE(float ecc) {
    e = ecc;
  }

  void findXY(float ecc) {
    float radius = (float) Math.sqrt((sunX-xCor)*(sunX-xCor) + (sunY-yCor)*(sunY-yCor));
    //radius *= radius;
    //float partition= radius/(ecc+1);
    float a = radius/(ecc+1);
    float partition= ecc*a/radius;
    //  float b = partition;
    //float c=ecc;
    centerx = sunX + partition*(xCor-sunX);
    centery= sunY+partition*(yCor-sunY);
    //ellipse(centerx,centery,20,20);
  }
}
