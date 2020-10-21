#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char string[100];
  int length = 0;

  printf("Enter the string\n");
  fgets(string, sizeof string, stdin);

  while (string[length] != '\0') {
    length++;
  }
  printf("Length of the string is : %i\n", length);

  return 0;
}
