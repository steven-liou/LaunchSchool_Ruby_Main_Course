#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char first_name[20];
  char last_name[20];
  puts("Enter your first and last name");
  scanf("%19s %19s", first_name, last_name);
  printf("First name: %s, Last name: %s\n", first_name, last_name);

  int age;
  printf("Enter your age: ");
  scanf("%i", &age);
  printf("Your age is %i\n", age);
  return 0;
}
