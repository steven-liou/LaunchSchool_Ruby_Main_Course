#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  int count = 1;
  while (true) {
    if (count % 2 == 0) {
      printf("%i is even!\n", count);
    } else {
      printf("%i is odd!\n", count);
    }
    count += 1;
    if (count > 5)
      break;
  }
  return 0;
}
