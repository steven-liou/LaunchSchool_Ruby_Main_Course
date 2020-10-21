#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int numbers[] = {1, 2, 3, 4};

  for (int index = 0; index < sizeof(numbers) / sizeof(int); index += 1) {
    printf("The address of %i index element is %p\n", index,
           &(*(numbers + index)));
  }
  return 0;
}
