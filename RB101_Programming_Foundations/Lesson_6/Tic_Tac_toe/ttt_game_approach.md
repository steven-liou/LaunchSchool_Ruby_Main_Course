
## High level overview
1. Display the initial empty 3x3 board
2. Ask the user to mark a squre
3. Computer marks a square
4. Display the updated board state
5. If winner, display winner
6. if board is full, display tie
7. if neither wnner nor board is full, got o #2
8. Play again?
9. If yes, go to # 1
10. Good bye

### Board state
- [[3x], [3x], [3x]]
- total number of mark


Column 1 | Column 2 | Column 3
---------|----------|---------
 0 | 1 | 2
 3 | 4 | 5
 6 | 7 | 8

### Display board
- read the board state and print out the board

### Mark square
- lets player mark the square in each round
- remove potential position from the slot
- error check if the user input unavailable slot

### Winner?
- check if there are three consecutive marks,
  - Go row by row, column by column,
  - check diagonal at corner index on first row

### Board full?
- Check if total marks is 9
