final float sunX;

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
