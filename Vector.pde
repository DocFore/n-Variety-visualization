class Vector {
  float[] coord;
  int size;
  float norm;
  color c;

  Vector(float[] coord) {
    this.coord = coord;
    this.size = this.coord.length;
    this.c = color(random(255), random(255), random(255));
  }

  Vector(float[] coord, color c) {
    this.coord = coord;
    this.c = c;
    this.size = this.coord.length;
  }

  void rotation(int turnDimension, char around, float rangle) {
    RotationMatrix rt = new RotationMatrix(size, turnDimension, around, rangle);
    
    coord = matmul(rt.value, coord);
  }

  void project() {
    float distance = 2;
    float p = 1/(distance - coord[size-1]);
    ProjectionMatrix pm = new ProjectionMatrix(size, p);
    coord = matmul(pm.value, coord);
    size--;
  }

  void multiple(float m) {
    for (int t = 0; t<coord.length; t++) {
      coord[t] *= m;
    }
  }

  void randomize() {
    for (int i = 0; i < size; i++) {
      coord[i] = random(-100, 100)/100;
    }
  }

  void Norm() {
    norm = 0;
    for (float f : coord) {
      norm += pow(f, 2);
    }
    norm = sqrt(norm);
  }

  void unit() {
    Norm();
    for (int i =0; i < coord.length; i++) {
      coord[i] /= norm;
    }
  }
}
