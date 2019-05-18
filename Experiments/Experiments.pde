final int SUNX = 300;
final int SUNY = 300;

import java.util.*;



void setup() {
  size(600, 600);
  fill(255, 255, 0);
  circle(SUNX, SUNY, 125);
}

void draw() {
 // mouseClicked();
}

void mouseClicked() {
  fill((int)(Math.random() * 255));
  float radius = (float)Math.random() * 50 + 25;
  circle(mouseX, mouseY, radius);
}
