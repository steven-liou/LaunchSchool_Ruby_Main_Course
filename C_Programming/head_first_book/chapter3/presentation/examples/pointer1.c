#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char response[6];
  printf("Input something\n");
  scanf("%5s", response);
  printf("The stdin current points to address %p\n", stdin);

  char remainingText[100];
  fgets(remainingText, 100, stdin);
  printf("Your response\n%s\n", response);
  printf("Characters left in stdin:\n");
  printf("%s\n", remainingText);
  return 0;
}
