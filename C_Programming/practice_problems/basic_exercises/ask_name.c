#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

int main() {
  char ex[20];
  puts("Enter boyfriend's name: ");
  scanf("%19s", ex);
  printf("Dear %s. \n\n\tYou're history.\n", ex);
  return 0;
}
