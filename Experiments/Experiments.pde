final float sunX = 500;
final float sunY = 500;
final float G = 667.408;
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
int radiussy =0;
import java.util.*;
ArrayList<Planet> planets = new ArrayList<Planet>(); //keep track of all planets

interface Displayable { 
  void display();
}

interface Moveable {
  void move();
}

ArrayList<Displayable> toDisplay;
ArrayList<Moveable> toMove;
void drawGrid(){
    for (int x =0;x<width;x+=10){
      fill(0,0,0);
      line(x,0,x,1000);
      line(0,x,1000,x);}
    
  }
void setup() {
  size(1000, 1000);
  //pushMatrix();
  fill(255, 255, 0);
  toDisplay = new ArrayList<Displayable>();
  toMove = new ArrayList<Moveable>();
  Planet sun = new Planet(sunX, sunY, 100, "Sun", 1, 0);
  drawGrid();
  toDisplay.add(sun);
}


void draw() {
  background(255);
  fill(0, 0, 0);
  //println(mode);
  //mode="CUSTOM";
  if (mode=="CHOOSING") {
    text("Select one of the keys to pick a planet: ", 10, 20);
    text("0: Mercury", 10, 40);
    text("1: Venus", 10, 60);
    text("2: Earth", 10, 80);
    text("3: Mars", 10, 100);
    text("4: Jupiter", 10, 120);
    text("5: Saturn", 10, 140);
    text("6: Uranus", 10, 160);
    text("7: Neptune", 10, 180);
    text("8: Pluto", 10, 200);
    text("9: Create your own", 10, 220);
  }    
  if (mode=="CHOSEN") {
    text("Drop the planet by clicking the desired location", 10, 20);
    triangle(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+20, mouseY);
  }
  if (mode=="CUSTOM" || mode == "CUSTOM2") {
    if (mode=="CUSTOM"){
    text("Set the mass of the planet by clicking the up-down arrows", 10, 20);
    text("Hit enter once you've selected your mass", 10, 40);
        text ("Mass is: "+ massy +" kg", 10, 240);
    }
        if (mode=="CUSTOM2"){
      text("Set the radius of the planet by clicking the up-down arrows", 10, 20);
    text("Hit enter once you've selected your radius", 10, 40);
    text ("Radius is: "+ radiussy +" km", 10, 240);
  }
    
    fill(255);
    rect(10, 100, 110, 60);
    fill (0, 0, 0);
    triangle(45, 150, 75, 150, 60, 120);
    fill(255);
    rect(10, 160, 110, 60);
    fill(0, 0, 0);
    triangle(45, 180, 75, 180, 60, 210);
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
  if (mode=="CHOSEN") {
    Planet p = new Planet(mouseX, mouseY, 50, "Venus", .206, 45);
    if (mercury) {
      p = new Planet(mouseX, mouseY, 50, "Mercury", .206, .241);
      mercury = false;
    }
    else if(venus) {
      p = new Planet(mouseX, mouseY, 50, "Venus", .0068, .615);
      venus = false;
    }
    else if(earth) {
      p = new Planet(mouseX, mouseY, 50, "Earth", .0167, 1);
      earth = false;
    }
    else if(mars) {
      p = new Planet(mouseX, mouseY, 50, "Mars", .0934, 1.88);
      mars = false;
    }
    else if(jupiter) {
      p = new Planet(mouseX, mouseY, 50, "Jupiter", .0485, 11.9);
      jupiter = false;
    }
    else if(saturn) {
      p = new Planet(mouseX, mouseY, 50, "Saturn", .0556, 29.5);
      saturn = false;
    }
    else if(uranus) {
      p = new Planet(mouseX, mouseY, 50, "Uranus", .0472, 84);
      uranus = false;
    }
    else if(neptune) {
      p = new Planet(mouseX, mouseY, 50, "Neptune", .0086, 165);
    }
    else if(pluto) {
      p = new Planet(mouseX, mouseY, 50, "Pluto", .25, 248);
    }
    else {
      p = new Planet(mouseX, mouseY, 50, "Custom", .206, 45); //have to choose interactively
    }
    toDisplay.add(p);
    toMove.add(p);
    mode="CHOOSING";
  }
  if (mode=="CUSTOM" || mode == "CUSTOM2") {
    if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
      if (mode=="CUSTOM") massy+=10;
      else radiussy+=10;
    }
    if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
      if (mode == "CUSTOM" && massy>0) massy-=10;
      else if (radiussy>0) radiussy-=10;
    }
  }
}

void keyPressed() {
  if (key == '0') mercury = true;
  if (key == '1') venus = true;
  if (key == '2') earth = true;
  if (key == '3') mars = true;
  if (key == '4') jupiter = true;
  if (key == '5') saturn = true;
  if (key == '6') uranus = true;
  if (key == '7') neptune = true;
  if (key == '8') pluto = true;
  if (key == '9') custom = true;
  if (mode=="CHOOSING") mode="CHOSEN";
  if (key == '9') mode= "CUSTOM";
  if (mode=="CUSTOM") {
    if (keyCode==ENTER) {
      mode="CUSTOM2";
    }
  }
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
  float period;

  Planet(float x, float y, float rad, String nm, float ecc, float period) { //Planet class
    e=ecc;
    radius = rad; 
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
    a = (float) Math.sqrt((sunX-xCor)*(sunX-xCor) + (sunY-yCor)*(sunY-yCor)) / (1+e); //half of major axis of ellipse
    angle = PI/2 - atan((xCor - sunX)/(yCor - sunY)); 
    period = (float)Math.sqrt(4*PI*PI*a*a*a/G/mass);
    speed = period/360;//random(-PI/180, PI/180); //to be determined by mass/force of gravity
    name = nm;
    c = e*a;
    b = (float)Math.sqrt(a*a - c*c);
    centerx = sunX + (c/(a+c))*(xCor - sunX);
    centery = sunY + (c/(a+c))*(yCor - sunY);
    println(a);
    println(period);
  }

  void display() {
    fill(255, 255, 0);
    circle(xCor, yCor, radius);
    //fill(0);
    text("" + mouseX + ", " + mouseY, mouseX, mouseY);
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
  
  void findAngle() {
    if (xCor > sunX && yCor > sunY) {
      angle = atan((xCor - sunX)/(yCor - sunY)) + PI/2;
    }
    else if (xCor > sunX && yCor < sunY) {
      angle = PI/2 - atan((xCor - sunX)/(yCor - sunY));
    }
    else if (xCor < sunX && yCor > sunY) {
      angle = 2*PI - atan((xCor - sunX)/(yCor - sunY));
    }
    else {
      angle = 3*PI/2 - atan((xCor - sunX)/(yCor - sunY));
    }
  }

}
