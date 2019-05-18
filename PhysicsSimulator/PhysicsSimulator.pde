final float sunX = 300;
final float sunY = 300;
import java.util.*;
ArrayList<Planet> planets = new ArrayList<Planet>();


class Planet {
  float radius;
  float xCor;
  float yCor;
  float mass;

  Planet(float x, float y, float rad) {
    radius = rad; //(float) Math.random() * 50;
    mass = radius * radius * PI * 5.51;
    xCor = x;
    yCor = y;
  }

  void display() {
    circle(xCor, yCor, radius);
  }
  
  void move() {
  }
}

void setup() {
  size(600, 600);
  fill(255, 255, 0);
  Planet sun = new Planet(sunX, sunY, 100);
  sun.display();
}

void draw() {
  for (Planet x : planets) {
    x.display();
  }
}

void mouseClicked() {
  planets.add(new Planet(mouseX, mouseY, (float)Math.random()*100));
  //xCor = mouseX;
  //yCor = mouseY;
}
