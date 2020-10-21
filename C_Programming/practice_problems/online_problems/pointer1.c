#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int x = 4;
  printf("x lives at %p\n", &x);

  int *y = &x;
  printf("y points to memory address  %p\n", y);
  printf("the value that y points to is %i\n", *y);
  *y = 10;

  printf("x is now %i\n", x);
  return 0;
}
