class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def play
    "Starts the Bingo game!"
  end

  def rules_of_play
  end
end

# There are two possibilities
# You can completely override the same method in the superclass by defining the same method name in your subclass
# You can extend the functinoality of the method in your subclass by calling super method and add additional body to the method with the smae name
