=begin

Scoring
1 point for every whole boat sank.
0.5 points for each boat hit at least once (not including boats that are sunk).
-1 point for each whole boat that was not hit at least once.
Sunk or Damaged
`sunk` = all boats that are sunk
`damaged` = all boats that have been hit at least once but not sunk
`notTouched/not_touched` = all boats that have not been hit at least once
Output
You should return a hash with the following data

`sunk`, `damaged`, `not_touched`, `points`

Example Game Output
In our above example..

First attack: `boat 3` was damaged, which increases the `points` by `0.5`
Second attack: miss nothing happens
Third attack: `boat 1` was damaged, which increases the `points` by `0.5`
`boat 2` was untouched so `points -1` and `notTouched +1` in Javascript/Java/C# and `not_touched +1` in Python/Ruby.
No whole boats sank
Return Hash
{ 'sunk': 0, 'damaged': 2 , 'not_touched': 1, 'points': 0 }


=end

=begin

Input : a matrix for board, and array of coordinates for attacks

Output :  specified result hash

Rules :
  1 point for every whole boat sunk
  0.5 points for each boat hit at least once (not including boats that are sunk)
  -1 point for each whole boat that was not hit at least once
Algorithm:

  create a hash with keys the boat number, and values the tiles that it occupy
    - loop through the board, and add the count accordingly to the hash

    loop through the attacks, and set the coordinate specified to 0
    - recount the board
    - check the scores

=end


def damaged_or_sunk (board, attacks)
  ships = check_board(board)
  board = attack(board, attacks)
  result_ships = check_board(board)
  results = {'sunk'=> 0, 'damaged' => 0, 'not_touched' => 0, 'points' => 0}

  for ship, start_health in ships
    remain_health = result_ships[ship] ? result_ships[ship] : 0

    if start_health == remain_health
      results['not_touched'] += 1
      results['points'] -= 1
    elsif remain_health == 0
      results['sunk'] += 1
      results['points'] += 1
    else
      results['damaged'] += 1
      results['points'] += 0.5
    end

  end
  results
end

def attack(board, attacks)
  rows = board.size

  for attack in attacks
    row_idx = rows - attack[1]
    column_idx = attack[0] - 1
    board[row_idx][column_idx] = 0
  end
  board
end

def check_board(board)
  ships = Hash.new(0)
  for array, arr_idx in board.each_with_index
    for sub_array, sub_idx in array.each_with_index
      if board[arr_idx][sub_idx] != 0
        ships[board[arr_idx][sub_idx]] += 1
      end
    end
  end
  ships
end




board = [[0,0,0,2,2,0],
[0,3,0,0,0,0],
[0,3,0,1,0,0],
[0,3,0,1,0,0]]

board = [ [3, 0, 1],
          [3, 0, 1],
          [0, 2, 1],
          [0, 2, 0] ]
attacks = [[2, 1], [2, 2], [ 3, 2], [3, 3]]

p damaged_or_sunk(board, attacks)