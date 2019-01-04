Shape h;
float angle = PI/360;
int t = 0;
int pmX;
int pmY;
float magnitude;
float longitude;

void setup() {
  background(0);
  fullScreen(P3D);
  pmX = width/2;
  pmY = height/2;
  magnitude = 0;
  longitude = 0;
  ortho();
  h = new Hypersphere(4, 30, 910);
  h.createCoord();
}

void draw() {

  background(30);
  translate(width/2, height/2);
  rotateX(PI/3); //PI/3 or longitude
  rotateZ(-PI/3); //-PI/3 or magnitude
  int[] turn = {4};
  char[] around = {'x'};

  h.show(angle * t, turn, around, 4);
  t++;

  if(t < 721){
    saveFrame("framesHypersphere/####.png");
  }
}




//functions to turn the shape
void mouseWheel(MouseEvent event) {
  int scale = -10 * event.getCount();
  h.changeScale(scale);
  println(h.multi);
}

void mouseMoved() {
  pmX = mouseX;
  pmY = mouseY;
}
void mouseDragged() { // use to turn the shape while clicking
  int mX = mouseX;
  int mY = mouseY;
  int dX = pmX - mX;
  int dY = pmY - mY;
  if (dX > 0) {
    magnitude += map(dX, 0, width, 0, 2*PI);
  } else {
    magnitude -= map(-dX, 0, width, 0, 2*PI);
  }
  if (dY > 0) {
    longitude += map(dY, 0, height, 0, PI);
  } else {
    longitude -= map(-dY, 0, height, 0, PI);
  }
  pmX = mouseX;
  pmY = mouseY;
}
