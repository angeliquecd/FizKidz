final float sunX = 300;
final float sunY = 300;
boolean sun = true;
boolean mercury = false;
boolean venus = false;
boolean earth = false;
boolean mars = false;
boolean jupiter = false;
boolean saturn = false;
boolean uranus = false;
boolean neptune = false;
boolean pluto = false;



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
  String name;
  float e;

  Planet(float x, float y, float rad, String nm) { //Planet class
    radius = rad; //(float) Math.random() * 50;
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
    centerx = xCor - 2 * sunX; //I don't think these coordinates for center of ellipse are right
    centery = yCor - 2 * sunY;
    spinradius = (float)Math.sqrt((xCor - centerx)*(xCor - centerx) + (yCor - centery) * (yCor - centery)); //half of major axis of ellipse
    angle = 0;
    speed = random(-PI/180, PI/180); //to be determined by mass/force of gravity
    name = nm;
}

  void display() {
    circle(xCor, yCor, radius);
  }

  void move() { //will determine elliptical motion of each planet
    angle += speed;
    xCor = sin(angle) * spinradius + centerx; 
    yCor = cos(angle) * spinradius + centery;
  }
  
  void setName(String nm){
    name = nm;
  }
  
  void setE(float ecc) {
    e = ecc;
  }
}


ArrayList<Displayable> toDisplay;
ArrayList<Moveable> toMove;

void setup() {
  size(600, 600);
  fill(255, 255, 0);
  toDisplay = new ArrayList<Displayable>();
  toMove = new ArrayList<Moveable>();
  Planet sun = new Planet(sunX, sunY, 100, "Sun"); 
  toDisplay.add(sun);
}


void draw() {
  background(255);
  for (Displayable x : toDisplay) { //displays all planets
    x.display();
  }
  
  for (Moveable x : toMove) {
   x.move(); 
  }
}

void mouseClicked() {
  Planet p = new Planet(mouseX, mouseY, (float)Math.random()*100, "NAME"); //adds new planet with random radius
  if (mercury) {
    p.setName();
  }
  toDisplay.add(p);
  toMove.add(p);
}

void keyPressed() {
  if (key == '1') mercury = true;
  if(key == '2') venus = true;
  if(key == '3') earth = true;
  if(key == '4') mars = true;
  if(key == '5') jupiter = true;
  if(key == '6') saturn = true;
  if(key == '7') uranus = true;
  if(key == '8') neptune = true;
  if(key == '9') pluto = true;
  
}
