#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int drinks[] = {4, 2, 3};
  printf("1st order: %i drinks\n", drinks[0]);
  printf("1st order: %i drinks\n", *drinks);
  printf("2nd order: %i drinks\n", drinks[1]);
  printf("2nd order: %i drinks\n", *(drinks + 1));
  return 0;
}
