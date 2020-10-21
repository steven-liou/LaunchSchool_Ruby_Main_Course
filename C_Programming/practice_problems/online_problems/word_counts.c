#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char str[100];
  int wordCount = 1;
  int index = 0;

  printf("Enter some words\n");
  fgets(str, sizeof str, stdin);

  while (str[index] != '\0') {
    if (str[index] == ' ') {
      wordCount++;
    }
    index++;
  }

  printf("Total number of words in the string is %d\n", wordCount);
  return 0;
}
