#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  short x = 15;
  int y = x;
  printf("The value of y = %i\n", y);

  int j = 100000;
  short k = j;
  printf("The value of k = %hi\n", k);
  return 0;
}
