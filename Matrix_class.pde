class Matrix { //this class was only made to rotate matrixes such as vectors

  int Width;
  int Height;
  float[][] value;


  Matrix(int Width, int Height) {

    value = new float[Width][Height];
  }
}

class RotationMatrix extends Matrix {
  float angle;

  RotationMatrix(int size, int turnDimension, float a) {
    super(size, size);
    this.angle = a;
    turnDimension--;
    value = buildMatrix(size, 0, 1);

    value[turnDimension-1][turnDimension-1] =  cos(angle);
    value[turnDimension][turnDimension-1]   = -sin(angle);
    value[turnDimension-1][turnDimension]   =  sin(angle);
    value[turnDimension][turnDimension]     =  cos(angle);
  }
}

class ProjectionMatrix extends Matrix {
  float projection;

  ProjectionMatrix(int size, float projection) {
    super(size, size-1);
    this.projection = projection;
    value = buildMatrix(size, 1, projection);
  }
}
