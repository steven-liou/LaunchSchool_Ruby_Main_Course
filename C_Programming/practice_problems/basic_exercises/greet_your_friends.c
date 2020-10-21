#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char names[][7] = {"Sarah", "John", "Hannah", "Dave"};
  for (int index = 0; index < sizeof(names) / sizeof(names[0]); index++) {
    printf("Hello, %s!\n", names[index]);
  }
  return 0;
}
