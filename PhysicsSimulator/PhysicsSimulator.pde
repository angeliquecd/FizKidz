final float sunX = 500;
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
boolean custom = true;
String mode= "CHOOSING";
int massy =0;

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
    fill(255,255,0);
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


ArrayList<Displayable> toDisplay;
ArrayList<Moveable> toMove;

void setup() {
  size(1000, 1000);
  //pushMatrix();
  fill(255, 255, 0);
  toDisplay = new ArrayList<Displayable>();
  toMove = new ArrayList<Moveable>();
  Planet sun = new Planet(sunX, sunY, 100, "Sun"); 
  toDisplay.add(sun);

}


void draw() {
  background(255);
  fill(0,0,0);
  //mode="CUSTOM";
  if (mode=="CHOOSING"){
    text("Select one of the keys to pick a planet: ",10,20);
    text("1: Earth",10,40);
     text("2: Jupiter",10,60);
     text("3: Mars",10,80);
     text("4: Neptune",10,100);
     text("5: Saturn",10,120);
     text("6: Uranus",10,140);
     text("7: Venus",10,160);
      text("8: Mercury",10,180);
     text("9: Create your own",10,200);
  }    
  if (mode=="CHOSEN"){
    text("Drop the planet by clicking the desired location",10,20);
    triangle(mouseX,mouseY,mouseX+10,mouseY+10,mouseX+20,mouseY);
  }
  if (mode=="CUSTOM"){
    text("Set the mass of the planet by clicking the up-down arrows",10,20);
    text("Hit enter once you've selected your mass",10,30);
    fill(255);
    rect(10,100,110,60);
    fill (0,0,0);
    triangle(45,150,75,150,60,120);
    fill(255);
    rect(10,160,110,60);
    fill(0,0,0);
    triangle(45,180,75,180,60,210);
    text ("Mass is: "+ massy +" kg", 10,240);
  }
  //translate(width/2, height/2);
  for (Displayable x : toDisplay) { //displays all planets
    x.display();
  }

  for (Moveable x : toMove) {
    x.move();
  }
}

void mouseClicked() {
  if (mode=="CHOSEN"){
  Planet p = new Planet(mouseX, mouseY, (float)Math.random()*100, "NAME"); //adds new planet with random radius
  if (mercury) {
    p.setName("Mercury");
    p.setE(.206);
  }
  toDisplay.add(p);
  toMove.add(p);
  mode="CHOOSING";}
  if (mode=="CUSTOM"){
    if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160){
      massy+=10;
  }
   if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220){
      massy-=10;
  }
}
}

void keyPressed() {
  if (key == '1') earth = true;
  if (key == '2') jupiter = true;
  if (key == '3') mars = true;
  if (key == '4') neptune = true;
  if (key == '5') saturn = true;
  if (key == '6') uranus = true;
  if (key == '7') venus = true;
  if (key == '8') mercury = true;
  if (key == '9') custom = true;
  mode="CHOSEN";
  if (key == '9') mode= "CUSTOM";
  if (mode=="CUSTOM"){
    if (keyCode==ENTER){
      mode="CUSTOM2";}
}
}
