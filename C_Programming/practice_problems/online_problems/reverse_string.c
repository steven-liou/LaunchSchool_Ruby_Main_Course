#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char string[100];
  printf("Input some string\n");
  fgets(string, sizeof string, stdin);

  int length = strlen(string);
  printf("The characters in reverse are : \n");

  for (int index = length; index >= 0; index--) {
    printf("%c ", string[index]);
  }
  printf("\n");

  return 0;
}
