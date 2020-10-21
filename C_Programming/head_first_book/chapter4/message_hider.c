#include "encrypt.h"
#include <stdio.h>

int main(void) {
  char msg[80];
  while (fgets(msg, 79, stdin)) {
    encrypt(msg);
    printf("%s", msg);
  }
  return 0;
}
