## Bonus Features Added
- All minimum bonus features
- Computer AI difficulty
  - Easy : Random
  - Medium difficulty : offense, defense
  - God difficulty : minMax algorithm
- Bigger board
- Game menu option to select:
  1. Rounds to win
  2. Bigger board size (3-10 for now)
  3. Player selection
  4. Player start round order
  5. Computer difficulty (Default is easy)


## Game Oragnization
### Classes

- TTTGame
  - Collaborative Objects :
    - Options
    - GamePlay
  - Functions
    - Greeting and goodbye messages
    - Set game options using Options object
    - Allow multiple games (each game has multiple rounds) by instantiating GamePlay object with gameplay options

- Options
  - Collaborative Objects :
    - Player
    - Computer
  - Functions :
    - Set player and computer properties
    - Options for GamePlay instances

- GamePlay
  - Collaborative Objects :
    - Player
    - Computer
    - Board
  - Functions :
    - Execute each round of tic tac toe game
    - Allow players to mark board with their markers
      - Handle Computer move logic
    - Keep track of round

- Player
  - Marker
  - Score

- Computer < Player
  - Difficulty level

- Board
  - Collaborative Objects :
    - Squares
  - Functions :
    - Handles the current board state
    - Self aware of whether a line connects

- Square
  - Empty or marked