class Shape { //<>// //<>// //<>// //<>//
  Vector[] points;
  int dim;
  int pointAmount;
  float multi;
  color couleurPoint;

  Shape(int dim, float multi, color c) {
    this.dim = dim;
    this.multi = multi;
    this.couleurPoint = c;
  }

  void display(float ang, int turnDimension, float mass) { //type an angle of 0, if you don't want to rotate the points and DIM is for the axis you want to turn, for Z-axis, type 3

    background(0);
    Vector[] rotated = new Vector[points.length];

    //PVector CoM = new PVector();
    int index = 0;

    for (Vector v : points) {
      Vector rot = new Vector(v.coord);

      if (turnDimension <= dim && turnDimension > 0 && turnDimension != 1) {
        rot.rotation(turnDimension, ang);
      } else {
        rot.rotation(2, 0);
      }

      while (rot.size != 3) {
        rot.project();
      }
      rot.multiple(multi);
      rotated[index] = rot;
      //CoM.x += rot.coord[0];
      //CoM.y += rot.coord[1];
      //CoM.z += rot.coord[2];
      index++;
    }

    //CoM.x /= pointAmount;
    //CoM.y /= pointAmount;
    //CoM.z /= pointAmount;

    for (Vector v : rotated) {
      stroke(couleurPoint); 
      strokeWeight(mass); 
      point(v.coord[0], v.coord[1], v.coord[2]);
    }
  }

  void changeScale(int s) {
    multi += s;
  }
  void createCoord(){}
}

class Hypercube extends Shape { //this is a n-cube, inheriting from the shape class

  Hypercube(int dim, float multi) { //constructor
    super(dim, multi, color(255,0,0)); 
    this.pointAmount = (int)pow(2, dim); 
    points = new Vector[(int)pow(2, dim)]; 
    for (int i = 0; i < pow(2, dim); i++) {
      float[] m = new float[dim]; 
      points[i] = new Vector(m);
    }
  }

  void createCoord() {
    String SBin = Binary(0, dim); 
    this.pointAmount = (int)pow(2, dim); 

    for (int i = 0; i < pointAmount; i++) { //browsing the points in the hypercube
      Vector v = points[i]; 
      for (int r = 0; r < points[i].coord.length; r++)
      {
        if ( SBin.charAt(r) == '0') {
          v.coord[r] = -1;
        } else {
          points[i].coord[r] = 1;
        }
      }
      SBin = Binary(i+1, dim);
    }
  }
  String Binary(int bin, int digits) {
    String number = ""; 
    String line = binary(bin, digits); 
    if (digits != line.length()) {
      for (int i = 0; i < digits-line.length(); i++) {
        number += "0";
      }
    }
    number += line; 
    return number;
  }
}

class Randomed extends Shape {
  
  Randomed(int dim, int numberPoints, float multi) { //constructor
    super(dim, multi, color(0,0,255)); 
    this.pointAmount = numberPoints; 
    points = new Vector[this.pointAmount]; 
    for (int i = 0; i < pointAmount; i++) {
      float[] m = new float[dim]; 
      points[i] = new Vector(m);
    }
  }

  void createCoord() {
    for (int i = 0; i < pointAmount; i++) {
      points[i].randomize();
    }
  }
}
