require 'pry'

# VALUE_TABLE = { 'ace' => nil, '2' => 2, '3' => 3, '4' => 4,
#                 '5' => 5, '6' => 6, '7' => 7, '8' => 8, '9' => 9,
#                 '10' => 10, 'Jack' => 10, 'Queen' => 10, 'King' => 10 }

GAME_POINT = 21

def initialize_deck
  suits = ['hearts', 'diamonds', 'clubs', 'spades']
  values = ['ace', '2', '3', '4', '5', '6', '7', '8',
            '9', '10', 'Jack', 'Queen', 'King']
  suits.product(values).shuffle
end

def check_total_value(player1_cards, player2_cards = nil)
  if !player2_cards
    check_one_value(player1_cards)
  else
    player1_total = check_one_value(player1_cards)
    player2_total = check_one_value(player2_cards)
    return player1_total, player2_total
  end
end

def check_one_value(cards)
  card_values = cards.map { |card| card[1] }
  ace_cards = []

  total_value = card_values.reduce(0) do |acc, card_value|
    if card_value == 'ace'
      ace_cards << 'ace'
      acc
    else
      acc + check_card_value(card_value)
    end
  end

  ace_cards.each do |ace_card|
    total_value += check_card_value(ace_card, total_value)
  end
  total_value
end

def check_card_value(card_value, total_value=0)
  case card_value
  when 'ace' then determine_ace(total_value)
  when 'Jack', 'Queen', 'King' then 10
  else card_value.to_i
  end
end

def determine_ace(total_value)
  total_value + 10 > GAME_POINT ? 1 : 10
end

def valid_choice(choice)
  if valid_integer(choice)
    valid_number_option(choice)
  elsif %w(hit stay).include?(choice.downcase)
    choice.downcase
  elsif %w(h s).include?(choice.downcase[0])
    choice[0] == 'h' ? 'hit' : 'stay'
  end
end

def valid_integer(string)
  string.match(/^\d$/)
end

def valid_number_option(choice)
  num = valid_integer(choice)[0].to_i
  if (1..2).cover?(num)
    num == 1 ? 'hit' : 'stay'
  end
end

def player_turn(deck, cards, total)
  puts "Player's turn:"
  loop do
    puts "Your current total is #{total}\n\n"
    answer = hit_or_stay('player')
    break if answer == 'stay'
    draw_card = deal!(deck)
    total += check_card_value(draw_card[1], total)
    cards << draw_card
    display_hand(cards, 'player')
    break if total >= GAME_POINT
  end
  return cards, total
end

def dealer_turn(deck, player_total, dealer_cards, dealer_total)
  puts "Dealer's turn:"

  loop do
    break if dealer_total >= GAME_POINT || dealer_total >= player_total
    display_hand(dealer_cards, 'dealer')
    puts "Dealer's current total is #{dealer_total}\n\n"
    dealer_needs(player_total, dealer_total)
    answer = hit_or_stay('dealer')
    break if answer == 'stay'
    draw_card = deal!(deck)
    dealer_total += check_card_value(draw_card[1], dealer_total)
    dealer_cards << draw_card
  end
  return dealer_cards, dealer_total
end

def hit_or_stay(player)
  answer = ''
  loop do
    if player == 'player'
      prompt 'Do you want to "hit" or "stay"? Pick a number or type in choice.'\
          "\n1. Hit\n2. Stay"
    else
      prompt 'Does dealer wants to "hit" or "stay"? Pick a number or type in '\
      "choice.\n1. Hit\n2. Stay"
    end
    answer = gets.chomp
    if valid_choice(answer)
      answer = valid_choice(answer)
      break
    end
    puts "Please enter a valid input."
  end
  answer
end

def dealer_needs(player_total, dealer_total)
  need_points = player_total - dealer_total
  puts "Dealer needs #{need_points} to win or tie"
end

def deal!(deck, num_cards= 1)
  num_cards == 1 ? deck.pop : deck.pop(num_cards)
end

def initialize_game(deck)
  player_cards = []
  dealer_cards = []
  player_cards.concat(deal!(deck, 2))
  dealer_cards.concat(deal!(deck, 2))
  display_inital_hand(player_cards, dealer_cards)
  return player_cards, dealer_cards
end

def display_inital_hand(player, dealer)
  display_hand(player, 'player')
  puts "Dealer has a #{dealer[0][1]} of #{dealer[0][0]} and a ..."
end

def display_hand(cards, player)
  player == "player" ? (print "You have a ") : (print "Dealer has a ")

  last_card_idx = cards.size - 1

  cards.each_with_index do |card, idx|
    if idx == 0 then print "#{card[1]} of #{card[0]}"
    elsif idx == 1 && last_card_idx == 1 then print " and a #{card[1]} of #{card[0]}"
    elsif idx == last_card_idx then print ", and a #{card[1]} of #{card[0]}"
    else print ", a #{card[1]} of #{card[0]}"
    end
  end
  puts
end

def who_wins(player_total: nil, dealer_total: nil)
  if player_total > GAME_POINT
    puts "Your final total is #{player_total}"
    player_lost_message(player_total)
    return 'dealer'
  end

  if dealer_total && dealer_total > GAME_POINT
    puts "Dealer's final total is #{dealer_total}"
    dealer_lost_message(dealer_total)
    return 'player'
  end

  if player_total && dealer_total
    difference = player_total - dealer_total

    if difference == 0 && player_total == GAME_POINT then 'tie'
    elsif difference <= 0 then 'dealer'
    else 'player'
    end
  end
end

def player_lost_message(total)
  case total
  when 22, 23 then puts "Darn... you were so close!"
  when 24..27 then puts "Nice round... better luck next time..."
  when 28..31 then puts "Busted... go big or go home right?"
  end
end

def dealer_lost_message(total)
  case total
  when 22, 23 then puts "Unbelieveable... dealer was so close!"
  when 24..27 then puts "A gift to you from the house..."
  when 28..30 then puts "Boom... what a terrible house?"
  end
end

def display_result(result, player_cards, player_total, dealer_cards, dealer_total)
  case result
  when 'player'
    puts "Congradulation! Your total is #{player_total}. Dealer total is #{dealer_total}"
  when 'dealer'
    puts "You lost! Your total is #{player_total}. Dealer total is #{dealer_total}"
  else
    puts "Tie game gentlemen! Your total is #{player_total}. Dealer total is #{dealer_total}"
  end
  display_hand(player_cards, 'player')
  display_hand(dealer_cards, 'dealer')
end

def prompt(msg)
  puts "==> #{msg}"
end

def play_again?
  puts "-------------------"
  answer = nil
  loop do
    prompt "Do you want to play again? [y/n]"
    answer = gets.chomp
    if %w(y n).include?(answer.downcase[0])
      answer = answer.downcase.start_with?('y')
      break
    end
    puts "Please answer y or no"
  end
  answer
end

player_score = 0
dealer_score = 0
round = 1

puts "Welcome to Twenty-One!"
loop do
  puts "Round #{round}:\n\n"
  deck = initialize_deck
  player_cards, dealer_cards = initialize_game(deck)
  player_total, dealer_total = check_total_value(player_cards, dealer_cards)
  player_cards, player_total = player_turn(deck, player_cards, player_total)
  result = who_wins(player_total: player_total)
  puts

  unless result
    (system 'clear') || (system 'cls')
    dealer_cards, dealer_total = dealer_turn(deck, player_total, dealer_cards, dealer_total)
  end

  result = who_wins(player_total: player_total,
                    dealer_total: dealer_total) unless result
  puts

  case result
  when 'player'
    display_result('player', player_cards, player_total,
                   dealer_cards, dealer_total)
    player_score += 1
  when 'dealer'
    display_result('dealer', player_cards, player_total,
                   dealer_cards, dealer_total)
    dealer_score += 1
  else
    display_result('tie', player_cards, player_total,
                   dealer_cards, dealer_total)
  end

  puts
  puts "Player score is #{player_score}. Dealer score is #{dealer_score}\n\n"

  break unless play_again?
  round += 1
  (system 'clear') || (system 'cls')
end

puts "Thank you for playing the game! Goodbye!"
