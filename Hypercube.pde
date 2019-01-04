class Hypercube extends Shape { //this is a n-cube, inheriting from the Shape class

  Hypercube(int dim, float multi) { //constructor
    super(dim, multi, color(255, 0, 0));
    this.pointAmount = (int)pow(2, dim); // number of points of a hypercube = 2^dimension of the hypercube
    points = new ArrayList<Vector>();

    for (int i = 0; i < this.pointAmount; i++) {
      float[] m = new float[dim]; 
      points.add(new Vector(m));
    }
  }

  void createCoord() {
    String SBin = Binary(0, dim); 
    this.pointAmount = (int)pow(2, dim); 
    int index = 0;
    for (Vector v : points) { //browsing the points in the hypercube 
      for (int r = 0; r < dim; r++) //
      {
        if ( SBin.charAt(r) == '0') {
          v.coord[r] = -1;
        } else {
          v.coord[r] = 1;
        }
      }
      SBin = Binary(index+1, dim);
      index++;
    }
  }

  String Binary(int bin, int digits) {
    String number = ""; 
    String line = binary(bin, digits); 
    if (digits != line.length()) {
      for (int i = 0; i < digits - line.length(); i++) {
        number += "0";
      }
    }
    number += line; 
    return number;
  }
}
