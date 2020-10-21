#include <stdio.h>
#include <stdlib.h>

void skip(char *msg) { puts((msg + 6)); }
int main() {
  int nums[] = {1, 2, 3};
  printf("name is at %p\n", nums);
  printf("name + 1 is at %p\n", nums + 1);
  return 0;
}
