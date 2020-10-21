#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void skip(char *msg) { printf("%s\n", (msg + 6)); }

int main() {
  char *msg_from_amy = "Don't call me";
  skip(msg_from_amy);
  return 0;
}
