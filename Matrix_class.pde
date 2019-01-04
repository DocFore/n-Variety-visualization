class Matrix { //this class was only made to rotate matrixes such as vectors

  int Width;
  int Height;
  float[][] value;


  Matrix(int Width, int Height) {

    value = new float[Width][Height];
  }
}

class RotationMatrix extends Matrix {
  float Rangle;

  RotationMatrix(int size, int turnDimension, char around, float a) {
    super(size, size);
    this.Rangle = a;
    turnDimension--;
    value = buildMatrix(size, 0, 1);

    switch(around) {
    case 'x':
      value[turnDimension-1][turnDimension-1] =  cos(Rangle);
      value[turnDimension][turnDimension-1]   = -sin(Rangle);
      value[turnDimension-1][turnDimension]   =  sin(Rangle);
      value[turnDimension][turnDimension]     =  cos(Rangle);
      break;

    case 'y':
      value[0][0]                             =  cos(Rangle);
      value[turnDimension][0]                 =  sin(Rangle);
      value[0][turnDimension]                 = -sin(Rangle);
      value[turnDimension][turnDimension]     =  cos(Rangle);
      break;

    case 'z':
      value[0][0]                             =  cos(Rangle);
      value[1][0]                             = -sin(Rangle);
      value[0][1]                             =  sin(Rangle);
      value[1][1]                             =  cos(Rangle);
      break;
    }
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
