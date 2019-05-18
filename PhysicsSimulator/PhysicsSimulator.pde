final float sunX = 300;
final float sunY = 300;
import java.util.*;
ArrayList<Planet> planets = new ArrayList<Planet>(); //keep track of all planets

interface Displayable { 
  void display();
}

interface Moveable {
 void move(); 
}

class Planet implements Displayable, Moveable {
  float radius;
  float xCor;
  float yCor;
  float mass;
  float angle;
  float speed;
  float spinradius;
  float centerx;
  float centery;

  Planet(float x, float y, float rad) { //Planet class
    radius = rad; //(float) Math.random() * 50;
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
    centerx = xCor - 2 * sunX; //I don't think these coordinates for center of ellipse are right
    centery = yCor - 2 * sunY;
    spinradius = (float)Math.sqrt((xCor - centerx)*(xCor - centerx) + (yCor - centery) * (yCor - centery)); //half of major axis of ellipse
    angle = 0;
    speed = random(-PI/180, PI/180); //to be determined by mass/force of gravity
}

  void display() {
    circle(xCor, yCor, radius);
  }

  void move() { //will determine elliptical motion of each planet
    angle += speed;
    xCor = sin(angle) * spinradius + centerx; 
    yCor = cos(angle) * spinradius + centery;
  }
}


ArrayList<Displayable> toDisplay;
ArrayList<Moveable> toMove;

void setup() {
  size(600, 600);
  fill(255, 255, 0);
  toDisplay = new ArrayList<Displayable>();
  toMove = new ArrayList<Moveable>();
  Planet sun = new Planet(sunX, sunY, 100); 
  sun.display();
}


void draw() {
  for (Displayable x : toDisplay) { //displays all planets
    x.display();
  }
  
  for (Moveable x : toMove) {
   x.move(); 
  }
}

void mouseClicked() {
  Planet p = new Planet(mouseX, mouseY, (float)Math.random()*100); //adds new planet with random radius
  toDisplay.add(p);
  toMove.add(p);
}
