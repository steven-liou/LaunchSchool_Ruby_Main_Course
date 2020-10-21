#include <stdio.h>

int main(void) {
  char firstName[100];
  char lastName[100];
  printf("What is your first and last name?");
  scanf("%99s ", firstName);
  printf("Your name is %s\n", firstName);

  return 0;
}
