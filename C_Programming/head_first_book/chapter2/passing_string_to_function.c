#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void fortune_cookie(char msg[]) {
  printf("Message reads: %s\n", msg);
  printf("msg occupies %i bytes\n", sizeof(msg));
  printf("The pointer to the message is at address %p\n", msg);
}

int main() {
  char quote[] = "Cookies make you fat";
  fortune_cookie(quote);
  return 0;
}
