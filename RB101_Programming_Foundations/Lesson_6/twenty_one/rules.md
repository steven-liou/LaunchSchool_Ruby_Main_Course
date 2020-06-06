# Twenty one game rules

1. Start with a normal 52-card deck, with 4 suits (hears, diamonds, clubs, and spades)
2. 1 dealer, and 1 player. Start with 2 cards each. Player can see both of his cards, but only one of dealer's cards
3. Card values
  - 2-10 face value
  - jack, queen, king - 10
  - ace 1 or 11
4. Each player's goal is to have total card values close to 21, but no over 'bust'.
5. for ace, it is counted as 11 if total value of cards don't go over 21, but it is counted as 1 if total values go over 21
6. Player turn Player starts first, and can decide either 'hit' or 'stay'
7. Dealer turn: when the player stays, it's the dealer's turn. Dealer follows the same rule
8. Compare cards: the player with higher total values is the winner. When tie, the dealer wins



## Steps

1. Initialize the deck
2. Deal cards to player and dealer
3. Player turnL hit or stay
  - repeat until bust or "stay"
4. If player bust, dealer wins
5. Dealer turn: hit or stay
  -repeat until total >= 17
6. If dealer bust, player wins
7. COmpare cards and declare winner

[{['Spade', '2'] => 2]}]
