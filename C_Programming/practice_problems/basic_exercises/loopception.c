#include <stdbool.h>
#include <stdio.h>

int main(void) {
  while (true) {
    printf("This is the outer loop.\n");

    while (true) {
      printf("This is the inner loop.\n");
      break;
    }
    break;
  }
  printf("This is outside all loops.\n");
  return 0;
}
