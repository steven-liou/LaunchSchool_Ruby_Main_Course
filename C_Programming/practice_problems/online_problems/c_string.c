#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char sentence[50];
  printf("Accept a string from keyboard :\n");
  fgets(sentence, sizeof sentence, stdin);
  printf("The string you entered is : %s\n", sentence);
  return 0;
}
