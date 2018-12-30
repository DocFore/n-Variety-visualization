Shape h;
float angle = 0;
void setup() {
  background(0);
  fullScreen(P3D);
  ortho();
  h = new Hypercube(4, 150);
  h.createCoord();
}

void draw() {
  translate(width/2, height/2);
  float magnitude = map(mouseX, 0, width, 0, 2*PI);
  float longitude = map(mouseY, 0, height, 0, PI);
  rotateX(longitude); //PI/3
  rotateZ(magnitude);

  h.display(angle, 9, 4);
  angle += 0.01;
}

void mouseWheel(MouseEvent event) {
  int scale = -10 * event.getCount();
  h.changeScale(scale);
}
