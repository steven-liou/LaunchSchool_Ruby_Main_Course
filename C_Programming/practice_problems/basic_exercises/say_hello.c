#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <string.h>

int main() {
  bool say_hello = true;
  int counter = 0;
  while (say_hello) {
    puts("Hello!");
    counter += 1;
    if (counter >= 5) {
      say_hello = false;
    }
  }
  return 0;
}
