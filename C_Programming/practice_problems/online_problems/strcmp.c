#include <stdio.h>
#include <string.h>
#include <strings.h>
int main() {
  char *string = "AaBBccDd";
  char *left;
  char *right;
  for (int i = 0; i < strlen(string) - 1; i++) {
    left = &string[i];
    right = &string[i + 1];
    printf("Are %c and %c the same?\n", *left, *right);
    int result = strcasecmp(*left, *right);
    printf("result: %d\n\n", result);
  }
  return 0;
}
