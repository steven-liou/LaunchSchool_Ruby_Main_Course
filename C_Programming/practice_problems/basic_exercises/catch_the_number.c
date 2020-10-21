#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <time.h>

int main() {

  while (true) {
    srand(time(NULL));
    int number = rand() % 100;
    printf("%d\n", number);
    if (0 <= number && number <= 10) {
      break;
    }
  }

  return 0;
}
