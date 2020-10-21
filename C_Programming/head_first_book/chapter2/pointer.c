#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int x = 10;
  int y = 20;
  int *primePointer = &x;
  int **secPointer = &primePointer;

  **secPointer = y;
  int **point = secPointer;
  printf("Primary pointer now points to %i\n", *primePointer);

  return 0;
}
