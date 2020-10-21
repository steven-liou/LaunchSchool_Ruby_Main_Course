#include <math.h>
#include <stdbool.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

const char *repeatChar(char character) {
  char *characters = malloc(4);
  for (int index = 0; index < strlen(characters) - 1; index++) {
    characters[index] = character;
  }
  printf("%s\n", characters);
  return characters;
}

int main() {
  char sentence[] = "Hello";
  char delim[] = " ";
  char character = 's';
  char word[50];

  sprintf(word, "%s\n", repeatChar(character));
  printf("%s\n", word);

  /* char *ptr = strtok(sentence, delim); */

  /* while (ptr != NULL) { */
  /*   char word[50]; */
  /*   sprintf(word, "%s%s", ptr, repeatChar(ptr[strlen(ptr) - 1])); */
  /*   /1* printf("%s\n", word); *1/ */
  /*   printf("'%s'\n", ptr); */
  /*   ptr = strtok(NULL, delim); */
  /* } */

  return 0;
}
