#include <stdbool.h>
#include <stdio.h>

int main(void) {
  int iterations = 1;
  while (true) {
    printf("Number of iterations = %i\n", iterations);
    iterations += 1;

    if (iterations > 5)
      break;
  }
  return 0;
}
