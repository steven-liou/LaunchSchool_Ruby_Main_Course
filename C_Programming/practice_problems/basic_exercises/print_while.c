#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int counter = 0;

  while (counter < 5) {
    int randomNumber = rand() % 99;
    printf("%i\n", randomNumber);
    counter += 1;
  }
  return 0;
}
