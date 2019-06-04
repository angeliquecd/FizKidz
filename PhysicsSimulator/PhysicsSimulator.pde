import java.util.*;
final float sunX = 500;
final float sunY = 400;
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
//possible simmodes are menu, projectile and orbits
String mode= "CHOOSING";
//modes for orbit are choosing, chosen, custom and custom2
//modes for projectile are velocityselector, angleselector and executing
//custom planets and projectile stuff
float massy =0;
float radiussy =0;
int angle=0;
int velocity =0;
//controls colors
color brown = color(139, 74, 74);//mercury
color red = color(209, 34, 98);//mars
color earthblue= color(34, 209, 193);//earth
color yellow = color(252, 232, 0);//sun
color purple = color(236, 178, 245);//venus
color darkblue = color (25, 33, 245);//neptune
color gray = color(124, 119, 111);//pluto
color uranusblue = color(53, 201, 165);//uranus
color jbrown = color(247, 208, 160); //jupiter
color sorange= color(245, 147, 27);
Random rcolor = new Random();
color randcolor = color(rcolor.nextInt()%255, rcolor.nextInt()%255, rcolor.nextInt()%255);
//controls moving sliders
int slider=0;
import java.util.*;
ArrayList<Planet> planets = new ArrayList<Planet>(); //keep track of all planets
interface Collidable{
  boolean isTouching(Planet other);
  void changeDisplay();
}
interface Displayable { 
  void display();
}

interface Moveable {
  void move();
  float getX();
  float getY();
}

ArrayList<Displayable> toDisplay;
ArrayList<Moveable> toMove;

Planet Sun = new Planet(sunX, sunY, 100, "Sun", 1, 0, yellow);
Projectile a = new Projectile(30, 730, velocity, angle);

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
  toDisplay.add(Sun);
}

void draw() {
  background(255);
  //println(mode);
  if (simMode.equals("MENU")) {
    setup();
    displayMenu();
  } else {
    fill(255);
    rect(width-110, 5, 100, 50);
    fill(0);
    text("Menu", width-75, 35); //Menu Button
    if (simMode.equals("ORBIT")) {
      background(0);
      stroke(255);
      fill(0);
      rect(width-110, 5, 100, 50);
      fill(255);
      text("Menu", width-75, 35); //Menu Button
      displayOrbit();
      for (Displayable x : toDisplay) { //displays all the things
        x.display();}
      for (Moveable x : toMove) {
        x.move();}
    }
    if (simMode.equals("PROJECTILE")) {
      displaylaunch();
      a.display();
      if (mode.equals("EXECUTING")) {
        a.move();}
    }}}

void displaylaunch() {
  fill(255);
  rect(width-110, 60, 100, 50);
  fill(0);
  text("Clear", width-75, 90); //Clear button
  if (mode.equals("ANGLESELECT") || mode.equals("VELOCITYSELECT")) {
    textSize(14);
    if (mode.equals("ANGLESELECT")) {
      text("Set the initial launch angle of the projectile by clicking the up-down arrows", 10, 20);
      text("Hit enter once you've selected your angle", 10, 40);
      text ("Angle is: "+ angle +" ˚", 10, 240);
    }
    if (mode.equals("VELOCITYSELECT")) {
      text("Set the initial launch velocity of the projectile by sliding the slider", 10, 20);
      text("Hit enter once you've selected your velocity", 10, 40);
      text ("Velocity is: "+ velocity +" m/s", 10, 240);
    }
    noStroke();
    fill(178,192,196);
    rect(30,100,266,50);
    fill(76,198,227);
    rect(30+slider,85,20,80);
   /* fill(255);
    rect(10, 100, 110, 60);
    fill (0, 0, 0);
    triangle(45, 150, 75, 150, 60, 120);
    fill(255);
    rect(10, 160, 110, 60);
    fill(0, 0, 0);
    triangle(45, 180, 75, 180, 60, 210);*/
  }
}
void mouseDragged(){
  if(mouseX>20 && mouseX<291){
  slider=mouseX-30;
  if (simMode.equals("PROJECTILE")){
    if (mode.equals("ANGLESELECT")) angle=(mouseX-21)/3;
    else velocity=(mouseX-21)/4;
  }
  else {
     if (mode.equals("CUSTOM")) massy=(mouseX-21)/10;
     else radiussy=(mouseX-21)/5;
  }
  }
}
void displayMenu() {
  rect(width/2-200, height/2-200, 400, 100);
  rect(width/2-200, height/2-100, 400, 100);
  fill(0);
  textSize(32);
  text("Planetary Orbit", width/2-110, height/2-150);
  text("Projectile Motion", width/2-120, height/2-50);
  fill(255);
}

void displayOrbit() {
  stroke(255);
  fill(0);
  rect(width-110, 60, 100, 50);
  fill(255);
  text("Clear", width-75, 90); //Clear button
  //fill(0, 0, 0);
  //fill(255, 255, 0);
  textSize(14);
  fill(255);
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
  }    
  if (mode.equals("CHOSEN")) {
    text("Drop the planet by clicking the desired location", 10, 20);
    triangle(mouseX, mouseY, mouseX+10, mouseY+10, mouseX+20, mouseY);
  }
  if (mode.equals("CUSTOM") || mode.equals("CUSTOM2")) {
    if (mode.equals("CUSTOM")) {
      text("Set the eccentricity of the planet by sliding the slider", 10, 20);
      text("Hit enter once you've selected your eccentricity", 10, 40);
      text ("Eccentricity is: "+ massy, 10, 240);
    }
    if (mode.equals("CUSTOM2")) {
      text("Set the radius of the planet by sliding the slider", 10, 20);
      text("Hit enter once you've selected your radius", 10, 40);
      text ("Radius is: "+ radiussy +" km", 10, 240);
    }
     noStroke();
    fill(178,192,196);
    rect(30,100,266,50);
    fill(76,198,227);
    rect(30+slider,85,20,80);
   /* fill(255);
    rect(10, 100, 110, 60);
    fill (0, 0, 0);
    triangle(45, 150, 75, 150, 60, 120);
    fill(255);
    rect(10, 160, 110, 60);
    fill(0, 0, 0);
    triangle(45, 180, 75, 180, 60, 210);*/
  }
}

void mouseClicked() {
  if (simMode.equals("ORBIT")) {
    if (mode.equals("CHOSEN")) {
      Planet p = new Planet(mouseX, mouseY, (float)Math.random()*50, "Venus", .206, 45, purple);
      if (mercury) {
        p = new Planet(mouseX, mouseY, 2.4, "Mercury", .206, .241, brown);
        mercury = false;
      } else if (venus) {
        p = new Planet(mouseX, mouseY, 6.1, "Venus", .0068, .615, purple);
        venus = false;
      } else if (earth) {
        p = new Planet(mouseX, mouseY, 6.3, "Earth", .0167, 1, earthblue);
        earth = false;
      } else if (mars) {
        p = new Planet(mouseX, mouseY, 3.4, "Mars", .0934, 1.88, red);
        mars = false;
      } else if (jupiter) {
        p = new Planet(mouseX, mouseY, 69.9, "Jupiter", .0485, 11.9, jbrown);
        jupiter = false;
      } else if (saturn) {
        p = new Planet(mouseX, mouseY, 58.2, "Saturn", .0556, 29.5, sorange);
        saturn = false;
      } else if (uranus) {
        p = new Planet(mouseX, mouseY, 25.4, "Uranus", .0472, 84, uranusblue);
        uranus = false;
      } else if (neptune) {
        p = new Planet(mouseX, mouseY, 24.6, "Neptune", .0086, 165, darkblue);
        neptune=false;
      } else if (pluto) {
        p = new Planet(mouseX, mouseY, 0.8, "Pluto", .25, 248, gray);
        pluto=false;
      } else {
        p = new Planet(mouseX, mouseY, radiussy/10, "Custom", massy%0.0001, 45, randcolor); //have to choose interactively
      massy=0;
      radiussy=0;
    }
      toDisplay.add(p);
      toMove.add(p);
      mode="CHOOSING";
    }
    if (mode.equals("CUSTOM") || mode.equals("CUSTOM2")) {
      if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
        if (mode.equals("CUSTOM")) massy+=0.01;
        else radiussy+=10;
      }
      if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
        if (mode.equals("CUSTOM") && massy>0) massy-=.010;
        else if (radiussy>0) radiussy-=10;
      }
    }
    if (mouseX > width-100 && mouseX < width-10 && mouseY > 60 && mouseY < 110) { //Clear planet screen
      toDisplay.clear();
      toMove.clear();
      toDisplay.add(Sun);
      mode = "CHOOSING";
    }
  }
  if (simMode.equals("PROJECTILE")) {
    //  println(""+mouseX+", "+mouseY);
   /* if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
      if (mode.equals("ANGLESELECT")) angle+=1;
      else velocity+=1;
    }
    if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
      if (mode.equals("ANGLESELECT") && angle>0) angle-=1;
      else if (velocity>0) velocity-=1;
    }*/
    if (mouseX > width-100 && mouseX < width-10 && mouseY > 60 && mouseY < 110) { //Clear projectile screen
      a = new Projectile(30, 730, velocity, angle);
      mode = "ANGLESELECT";
    }
  }
  if (simMode.equals("MENU")) {
    if (mouseX> width/2-200 && mouseX < width/2+200 && mouseY > height/2-200 && mouseY < height/2-100) {
      simMode="ORBIT";
    }
    if (mouseX> width/2-200 && mouseX < width/2+200 && mouseY > height/2-100 && mouseY < height/2) {
      simMode="PROJECTILE";
      mode="ANGLESELECT";
    }
  }
  if (mouseX > width-110 && mouseX < width-10 && mouseY > 5 && mouseY < 55) { //Go back to menu
    simMode = "MENU";
    mode = "CHOOSING";
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
        slider=0;
      }
    } else if (mode.equals("CUSTOM2")) {
      if (keyCode==ENTER) mode="CHOSEN";
      slider=0;
    }
  }
  if (simMode.equals("PROJECTILE")) {
    if (mode.equals("ANGLESELECT")) {
      if (keyCode==ENTER) {
        mode = "VELOCITYSELECT";
        slider=0;
      }
    } else if (mode.equals("VELOCITYSELECT")) {
      a = new Projectile(30, 730, velocity, angle);
      mode = "EXECUTING";
      slider=0;
    }
  }
}
/*void mousePressed(){
 while (mousePressed){
 if (mode.equals("CUSTOM") || mode.equals("CUSTOM2")) {
 if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
 if (mode.equals("CUSTOM")) massy+=0.01;
 else radiussy+=10;
 }
 if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
 if (mode.equals("CUSTOM") && massy>0) massy-=.010;
 else if (radiussy>0) radiussy-=10;
 }
 }
 if (simMode.equals("PROJECTILE")) {
 //  println(""+mouseX+", "+mouseY);
 if (mouseX>10 && mouseY>100 && mouseX<120 && mouseY<160) {
 if (mode.equals("ANGLESELECT")) angle+=1;
 else velocity+=1;
 }
 if (mouseX>10 && mouseY>160 && mouseX<120 && mouseY<220) {
 if (mode.equals("ANGLESELECT") && angle>0) angle-=1;
 else if (velocity>0) velocity-=1;
 }
 //if (mode.equals("SPOTFINDER")) {
 //  //Projectile a = new Projectile(mouseX, mouseY, velocity, angle);
 //  mode="EXECUTING";
 //  velocity=0;
 //  angle=0;
 //  //toDisplayp.add(a);
 //  //toMovep.add(a);
 //}
 
 }
 }
 }*/
