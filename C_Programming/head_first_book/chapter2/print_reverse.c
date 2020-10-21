#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void print_reverse(char *s) {
  size_t len = strlen(s);

  char *t = s + len - 1;

  while (t >= s) {
    printf("%c", *t);
    t = t - 1;
  }
}
int main() {
  char string[40];
  printf("What string to reverse? ");
  fgets(string, 40, stdin);
  print_reverse(string);

  return 0;
}
