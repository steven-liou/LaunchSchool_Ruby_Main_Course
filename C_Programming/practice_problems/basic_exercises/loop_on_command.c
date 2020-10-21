#include <stdbool.h>
#include <stdio.h>
#include <string.h>

int main(void) {
  while (true) {
    char answer[4];
    printf("Should I stop looping?\n");
    getchar();
    scanf("%3s", answer);
    if (strcmp(answer, "yes") == 0) {
      break;
    }
  }
  return 0;
}
