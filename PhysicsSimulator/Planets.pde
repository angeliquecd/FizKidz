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
  color style;
  Planet(float x, float y, float rad, String nm, float ecc, float period, color colory) { //Planet class
    style=colory;
    e=ecc;
    radius = rad*2; 
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
    a = (float) Math.sqrt((sunX-xCor)*(sunX-xCor) + (sunY-yCor)*(sunY-yCor)) / (1+e); //half of major axis of ellipse
    findAngle();
    period = (float)Math.sqrt(4*PI*PI*a*a*a/G/mass); //Kepler's Law of Periods
    speed = period/360; //to be determined by mass/force of gravity
    name = nm;
    c = e*a;
    b = (float)Math.sqrt(a*a - c*c);
    centerx = sunX + (c/(a+c))*(xCor - sunX);
    centery = sunY + (c/(a+c))*(yCor - sunY);
  }

  void display() {
    fill(style);
    noStroke();
    ellipse(xCor, yCor, radius, radius);
    stroke(0);
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
  float getX(){
    return xCor;
  }
  float getY(){
    return yCor;
  }

  void findAngle() {
    if (xCor > sunX && yCor > sunY) { //works
      angle = atan(Math.abs((xCor - sunX)/(yCor - sunY)));
    } else if (xCor > sunX && yCor < sunY) { //works
      angle = PI - atan(Math.abs((xCor - sunX)/(yCor - sunY)));
    } else if (xCor < sunX && yCor > sunY) { //works
      angle =  - atan(Math.abs((xCor - sunX)/(yCor - sunY)));
    } else if (xCor < sunX && yCor < sunY) { //works
      angle = PI + atan(Math.abs((xCor - sunX)/(yCor - sunY)));
    }
  }
}
