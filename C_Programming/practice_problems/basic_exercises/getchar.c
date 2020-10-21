#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char answer[10];
  char remaining[10];
  char last[10];
  puts("Enter some values");
  scanf("%4s", answer);
  fflush(stdin);
  fgets(remaining, 10, stdin);
  printf("%s\n", remaining);
  /* fgets(last, 10, stdin); */
  /* printf("%s\n", last); */
  return 0;
}
