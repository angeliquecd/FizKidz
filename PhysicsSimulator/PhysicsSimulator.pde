//final float sunX;
//final float sunY;

class Planets {
  float radius;
  float xCor;
  float yCor;
  float mass;

  Planets(float x, float y) {
    radius = (float) Math.random() * 50;
    mass = radius * radius * PI * 5.51;
  }

  void mouseClicked() {
    xCor = mouseX;
    yCor = mouseY;
  }
}

void setup() {
  size(600, 600);
  fill(100);
  circle(300, 300, 50);
}
