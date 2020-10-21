#include <stdio.h>
#include <stdlib.h>

int main() {
  char card_name[3];
  int val = 0;
  int count = 0;

  while (card_name[0] != 'X') {
    puts("Enter the card_name: ");
    scanf("%2s", card_name);

    switch (card_name[0]) {
    case 'K':
    case 'Q':
    case 'J':
      val = 10;
      break;
    case 'A':
      val = 11;
      break;
    case 'X':
      val = 'X';
      continue;
    default:
      val = atoi(card_name);
      if (val < 1 || val > 10) {
        puts("You must enter value between 1 and 10");
        continue;
      }
      break;
    }

    if (3 <= val && val <= 6) {
      puts("Count has gone up");
      count += 1;
    } else if (val == 10) {
      puts("Count has gone down");
      count -= 1;
    }
    printf("The card value is : %i\n", val);
    printf("Current count: %i\n", count);
  }
  return 0;
}
