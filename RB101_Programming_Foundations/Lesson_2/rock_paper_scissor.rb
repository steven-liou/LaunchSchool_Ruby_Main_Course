# Add the two bonus moves "lizard", "Spock" to the game

VALID_CHOICES = %w(rock paper scissors)


def prompt(message)
  puts "=> #{message}"
end

def list_choices(moves)
  moves.each_with_index do |val, idx|
    puts "#{idx+1}. #{val.capitalize}"
  end
end

def valid_choice?(choices, number)
  matched = /^\d$/.match(number)
  if matched
    number = number.to_i
    return true if number <= choices.size && number > 0
  end
  false
end

def pick_choice(choices, number)
  choices[number - 1]
end




def get_results(player, computer)
  if win?(player, computer)
    "You win!"
  elsif win?(computer, player)
    "You lose!"
  else
    "It's a tie!"
  end
end

def win?(player1, player2)
  (player1 == 'rock' && player2 == 'scissors')||
    (player1 == 'paper' && player2 == 'rock') ||
    (player1 == 'scissors' && player2 == 'paper')
end



loop do
  # ask the user to pick a move
  prompt("Please select a move from the list:")
  list_choices(VALID_CHOICES)

  choice = ''
  loop do
    choice = gets.chomp

    if VALID_CHOICES.include?(choice)
      break
    elsif valid_choice?(VALID_CHOICES, choice)
      choice = pick_choice(VALID_CHOICES, choice.to_i)
      break
    else
      prompt("That is not a valid move, pick again")
    end
  end

  computer_choice = VALID_CHOICES.sample

  prompt("You picked #{choice}; Computer picked #{computer_choice}")
  # print the results
  result = get_results(choice, computer_choice)
  puts result

  prompt("Do you want to play again? [y/n]")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt("Thanks for playing rock, paper, and scissors! Come again!")



