#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char masked_raider[] = "Alive";
  char jimmy[] = masked_raider;
  printf("masked raider is %s, Jimmy is %s\n", masked_raider, jimmy);
  masked_raider[0] = 'D';
  masked_raider[1] = 'E';
  masked_raider[2] = 'A';
  masked_raider[3] = 'D';
  masked_raider[4] = '!';
  printf("masked raider is %s, Jimmy is %s\n", masked_raider, jimmy);
  return 0;
}
