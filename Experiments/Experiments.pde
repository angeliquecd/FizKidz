
import java.util.*;



void setup() {
  size(600, 600);
  fill(255, 255, 0);
  circle(300, 300, 125);
}

void draw() {
  //mouseClicked();
}

void mouseClicked() {
  float radius = (float)Math.random() * 50 + 25;
  circle(mouseX, mouseY, radius);
}
