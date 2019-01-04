class Shape { //<>// //<>// //<>// //<>// //<>// //<>// //<>//
  ArrayList<Vector> points; //each points of the shape are contained in the array
  int dim;
  int pointAmount;
  float multi;
  color pointColor;

  Shape(int dim, float multi, color c) {
    this.dim = dim;
    this.multi = multi;
    this.pointColor = c;
  }

  void show(float ang, int[] turnDimension, char[] around, float size) { //type an angle of 0, if you don't want to rotate the points and DIM is for the axis you want to turn, for Z-axis, type 3

    Vector[] rotated = new Vector[points.size()];

    int index = 0;

    for (Vector v : points) {
      Vector rot = new Vector(v.coord, v.c);
      for (int  i = 0; i < turnDimension.length; i++) {
        if (turnDimension[i] <= dim && turnDimension[i] > 0 && turnDimension[i] != 1) { //checking that the shape is defined on the dimension

          rot.rotation(turnDimension[i], around[i], ang);
        } else {
          rot.rotation(2, 'x', 0);
        }
      }
      while (rot.size != 3) {
        rot.project();
      }
      rot.multiple(multi);
      rotated[index] = rot;
      index++;
    }

    for (Vector v : rotated) {
      stroke(this.pointColor); 
      strokeWeight(size); 
      point(v.coord[0], v.coord[1], v.coord[2]);
    }
  }

  void changeScale(int s) {
    multi += s;
  }

  void createCoord() { //this function is written in every shapes because they aren't build the same way
  }
}
