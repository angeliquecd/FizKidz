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
String simMode = "MENU";
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
void drawGrid() {
  for (int x =0; x<width; x+=10) {
    fill(0, 0, 0);
    line(x, 0, x, 1000);
    line(0, x, 1000, x);
  }
}
void setup() {
  size(1000, 800);
  //background(255);
  //pushMatrix();
  toDisplay = new ArrayList<Displayable>();
  toMove = new ArrayList<Moveable>();
  //drawGrid();
}


void draw() {
  background(255);
  println(simMode);
  if (simMode.equals("MENU")) {
    displayMenu();
  }
  if (simMode.equals("ORBIT")) {
    Planet sun = new Planet(sunX, sunY, 100, "Sun", 1, 0);
    toDisplay.add(sun);
    displayOrbit();
  }
  for (Displayable x : toDisplay) { //displays all the things
    x.display();
  }
  for (Moveable x : toMove) {
    x.move();
  }
}

void displayMenu() {
  rect(width/2-200, height/2-200, 400, 100);
  rect(width/2-200, height/2-100, 400, 100);
  fill(0);
  textSize(32);
  text("Orbit simulator", width/2-110, height/2-150);
  text("Projectile Motion", width/2-120, height/2-50);
  fill(255);
}

void displayOrbit() {
  //fill(0, 0, 0);
  //fill(255, 255, 0);
  textSize(14);
  fill(0);
  if (mode.equals("CHOOSING")) {
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
    //mode = "CHOSEN";
  }    
  if (mode.equals("CHOSEN")) {
    text("Drop the planet by clicking the desired location", 10, 20);
    triangle(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+20, mouseY);
  }
  if (mode.equals("CUSTOM") || mode.equals("CUSTOM2")) {
    if (mode.equals("CUSTOM")) {
      text("Set the mass of the planet by clicking the up-down arrows", 10, 20);
      text("Hit enter once you've selected your mass", 10, 40);
      text ("Mass is: "+ massy +" kg", 10, 240);
    }
    if (mode.equals("CUSTOM2")) {
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
}

void mouseClicked() {
  if (simMode.equals("ORBIT")) {
    if (mode.equals("CHOSEN")) {
      Planet p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Venus", .206, 45);
      if (mercury) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Mercury", .206, .241);
        mercury = false;
      } else if (venus) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Venus", .0068, .615);
        venus = false;
      } else if (earth) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Earth", .0167, 1);
        earth = false;
      } else if (mars) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Mars", .0934, 1.88);
        mars = false;
      } else if (jupiter) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Jupiter", .0485, 11.9);
        jupiter = false;
      } else if (saturn) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Saturn", .0556, 29.5);
        saturn = false;
      } else if (uranus) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Uranus", .0472, 84);
        uranus = false;
      } else if (neptune) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Neptune", .0086, 165);
      } else if (pluto) {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Pluto", .25, 248);
      } else {
        p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Custom", .206, 45); //have to choose interactively
      }
      toDisplay.add(p);
      toMove.add(p);
      mode="CHOOSING";
    }
    if (mode.equals("CUSTOM") || mode.equals("CUSTOM2")) {
      if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
        if (mode.equals("CUSTOM")) massy+=10;
        else radiussy+=10;
      }
      if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
        if (mode.equals("CUSTOM") && massy>0) massy-=10;
        else if (radiussy>0) radiussy-=10;
      }
    }
  }
  if (simMode.equals("MENU")) {
    if (mouseX> width/2-200 && mouseX < width/2+200 && mouseY > height/2-200 && mouseY < height/2-100) {
      simMode="ORBIT";
    }
  }
}

void keyPressed() {
  if (simMode.equals("ORBIT")) {
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
    if (mode.equals("CHOOSING")) mode="CHOSEN";
    if (key == '9') mode= "CUSTOM";
    if (mode.equals("CUSTOM")) {
      if (keyCode==ENTER) {
        mode="CUSTOM2";
      }
    }
  }
}
