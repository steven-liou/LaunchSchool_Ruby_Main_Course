/*
   1. If you run mecho without arguments, it will output what you type, in a
   loop
   2. If you run mecho with arguments, it will just output the argument as a
   string
   3. Redirect the output to a file
      Works with an argument
      Works also without an argument
   4. Redirect input from a file
   5. Append to a file
   6. Mecho adheres to parental guidelines

*/
#include <stdio.h>
#include <string.h>

int main(int argc, char *argv[]) {
  char input[100];

  if (argc > 1) {
    for (int index = 1; index < argc; index++) {
      strcat(input, argv[index]);
      strcat(input, " ");
    }
    printf("%s\n", input);
  } else {
    while (scanf("%99[^\n]", input) > 0) {
      if (strstr(input, "*")) {
        fprintf(stderr, "Explicits are not allowed in this echo chamber!\n");
        return 2;
      }
      printf("%s\n", input);
      getchar(); // remove the \n character from stream to allow reading next
                 // line of text
    }
  }
  return 0;
}
