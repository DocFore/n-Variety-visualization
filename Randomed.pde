class Randomed extends Shape {

  Randomed(int dim, int numberPoints, float multi) { //constructor
    super(dim, multi, color(230, 127, 255)); 
    this.pointAmount = numberPoints; 
    points = new ArrayList<Vector>(); 
    for (int i = 0; i < pointAmount; i++) {
      float[] m = new float[dim]; 
      points.add(new Vector(m));
    }
  }

  void createCoord() {
    for (Vector v : points) {
      v.randomize();
    }
  }
}
