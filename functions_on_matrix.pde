float[] matmul(float[][] a, float[] b) {
  int columnsA = a[0].length;
  int rowsA = a.length;
  int rowsB = b.length;

  if (columnsA != rowsB) {
    println(columnsA + "!=" + rowsB);
  }

  float[] result = new float[rowsA];

  for (int i = 0; i < rowsA; i++) {
    float sum = 0;
    for (int j = 0; j < columnsA; j++) {
      sum += a[i][j] * b[j];
    }
    result[i] = sum;
  }
  return result;
}

float[][] buildMatrix(int size, int offset, float value) {
  float[][] mat = new float[size-offset][size];
  for (int i = 0; i < size-offset; i++) {
    for (int j = 0; j < size; j++) {
      if (j == i) {
        mat[i][j] = value;
      } else {
        mat[i][j] = 0;
      }
    }
  }
  return mat;
}
