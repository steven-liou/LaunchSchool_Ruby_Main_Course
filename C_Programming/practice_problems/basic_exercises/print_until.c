#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

int main() {
  int[] numbers = new int[]{7, 9, 13, 25, 18};

  for (int index = 0; index < sizeof(numbers); index += 1) {
    printf("%i\n", numbers[index]);
  }
  return 0;
}
