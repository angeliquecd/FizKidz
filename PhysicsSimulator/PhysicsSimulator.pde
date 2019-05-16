//final float sunX;
//final float sunY;
import java.util.*;
ArrayList<Planet> planets = new ArrayList<Planet>();


class Planet {
  float radius;
  float xCor;
  float yCor;
  float mass;

  Planet(float x, float y) {
    radius = (float) Math.random() * 50;
    mass = radius * radius * PI * 5.51;
  }

  void mouseClicked() {
    planets.add(new Planet(mouseX, mouseY));
    //xCor = mouseX;
    //yCor = mouseY;
  }

  void display() {
    circle(xCor, yCor, radius);
  }
}

void setup() {
  size(600, 600);
  fill(255, 255, 0);
  circle(300, 300, 100);
}

void draw() {
  for(Planet x : planets) {
    x.display();
  }
}
