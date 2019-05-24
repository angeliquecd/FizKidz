final float sunX = 500;
final float sunY = 500;
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
  Planet sun = new Planet(sunX, sunY, 100, "Sun", 1);
  drawGrid();
  toDisplay.add(sun);
}


void draw() {
  background(255);
  fill(0, 0, 0);
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
  if (mode=="CUSTOM") {
    text("Set the mass of the planet by clicking the up-down arrows", 10, 20);
    text("Hit enter once you've selected your mass", 10, 30);
    fill(255);
    rect(10, 100, 110, 60);
    fill (0, 0, 0);
    triangle(45, 150, 75, 150, 60, 120);
    fill(255);
    rect(10, 160, 110, 60);
    fill(0, 0, 0);
    triangle(45, 180, 75, 180, 60, 210);
    text ("Mass is: "+ massy +" kg", 10, 240);
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
    Planet p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Venus", .206);
    if (mercury) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Mercury", .206);
    }
    else if(venus) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Venus", .206);
    }
    else if(earth) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Earth", .206);
    }
    else if(mars) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Mars", .206);
    }
    else if(jupiter) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Jupiter", .206);
    }
    else if(saturn) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Saturn", .206);
    }
    else if(uranus) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Uranus", .206);
    }
    else if(neptune) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Neptune", .206);
    }
    else if(pluto) {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Pluto", .206);
    }
    else {
      p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Custom", .206);
    }
    toDisplay.add(p);
    toMove.add(p);
    mode="CHOOSING";
  }
  if (mode=="CUSTOM") {
    if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
      massy+=10;
    }
    if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
      massy-=10;
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
  mode="CHOSEN";
  if (key == '9') mode= "CUSTOM";
  if (mode=="CUSTOM") {
    if (keyCode==ENTER) {
      mode="CUSTOM2";
    }
  }
}
