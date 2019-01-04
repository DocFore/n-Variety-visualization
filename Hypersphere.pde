class Hypersphere extends Shape { //this object inherits of the class Shape
  int circlePart = 0;
  
  Hypersphere(int dim, int numberPoints, float multi) {
    super(dim, multi, color(255, 63));
    this.pointAmount = (int) pow(numberPoints, dim-1);
    this.circlePart = numberPoints;
    points = new ArrayList<Vector>();
  }

  void createCoord() {
    float deltaAngle = 2*PI/circlePart; 
    int lessPoint = 0;
    for (int  i = 0; i < pointAmount; i++) { //creation of all the points thanks to this loop
      float[] coordinates = new float[dim];
      float[] coAngles = changeBase(circlePart, i, dim - 1, deltaAngle); //all the factor are contained in this array
      boolean canContinue = true;

      for (int j = 0; j < coAngles.length - 1; j++) { //cking if the angle is > to PI, to prevent doubles
        if (coAngles[j] > PI || coAngles[coAngles.length - 1] >= 2*PI) {
          canContinue = false;
          lessPoint++;
          break;
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
            if (k != coAngles.length) {
              if (k != j || last) {
                coordinates[j] *= sin(coAngles[k]);
              } else {
                coordinates[j] *= cos(coAngles[k]);
              }
            }
          }
        }
        Vector v = new Vector(coordinates);
        points.add(v);
      }
    }
    println(this.pointAmount);
    this.pointAmount -= lessPoint;
    println(this.pointAmount);
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
