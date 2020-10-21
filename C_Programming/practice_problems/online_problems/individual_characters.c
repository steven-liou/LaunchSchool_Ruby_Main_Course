#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char string[100];

  printf("Enter some string\n");
  fgets(string, sizeof string, stdin);

  for (int index = 0; index < 99; index++) {
    char currentChar = string[index];
    if (currentChar == '\0') {
      break;
    }
    printf("%c ", string[index]);
  }

  return 0;
}
