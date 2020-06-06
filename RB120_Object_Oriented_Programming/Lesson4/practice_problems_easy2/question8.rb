class Game
  def play
    "Start the game!"
  end
end

class Bingo < Game
  def rules_of_play
  end
end


# To inherit from a parent class, use the < symbol in the class signature
# class <subclass> < <superclass>

bingo = Bingo.new
p bingo.play