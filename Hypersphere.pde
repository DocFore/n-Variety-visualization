class Hypersphere extends Shape { //<>//
  int circlePart = 0;
  Hypersphere(int dim, int numberPoints, float multi) {
    super(dim, multi, color(255, 63));
    this.pointAmount = (int) pow(numberPoints, dim);
    this.circlePart = numberPoints;
    points = new ArrayList<Vector>();
  }

  void createCoord() {
    float deltaAngle = 2*PI/circlePart; 
    for (int  i = 0; i < pointAmount; i++) { //creation of all the points thanks to this loop
      float[] coordinates = new float[dim];
      float[] CoAngles = changeBase(circlePart, i, dim, deltaAngle); //all the factor are contained in this array
      boolean canContinue = true;

      for (int j = 0; j < CoAngles.length - 1; j++) { //cking if the angle is > to PI, to prevent doubles
        if (CoAngles[j] > PI) {
          canContinue = false;
        }
      }
      if (canContinue) {
        for (int  j = 0; j < coordinates.length; j++) {
          coordinates[j] = 1;
          boolean last = false;

          if (j == coordinates.length - 1) { // loop to make the whole coordinates like x, y, or z
            last = true;
          }

          for (int k = 0; k <= j; k++) { // loop that multiply by the sinus or cosinus
            if (k != j || last) {
              coordinates[j] *= sin(CoAngles[k]);
            } else {
              coordinates[j] *= cos(CoAngles[k]);
            }
          }
        }
        Vector v = new Vector(coordinates);
        points.add(v);
      }
    }
  }

  float[] changeBase(int base, int number, int dimension, float mult) {

    float[] ret = new float[dimension];
    //for (int i = 0; i < dimension; i++) {
    //  ret.append(0);
    //}
    int index = 0;
    while (number != 0) {
      int reste = number %base;
      ret[index] = reste;
      number -= reste;
      number /= base;
      index++;
    }
    for (int i = 0; i < ret.length; i++) {
      ret[i] *= mult;
    }
    return ret;
  }
}
