=begin
Algorithm :
  write a method to print # number of beer

=end

class BeerSong
  class NBottle
    def verse(bottle_number)
      "#{bottle_number} bottles of beer on the wall, #{bottle_number} bottles of beer.\nTake one down and pass it around, #{bottle_number - 1} bottles of beer on the wall.\n"
    end
  end

  class ZeroBottle
    def verse(_)
      "No more bottles of beer on the wall, no more bottles of beer.\n" \
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  class OneBottle
    def verse(_)
      "1 bottle of beer on the wall, 1 bottle of beer.\n" \
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class TwoBottle
    def verse(_)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  BOTTLES = [ZeroBottle, OneBottle, TwoBottle].freeze

  def verse(number)
    bottle = BOTTLES.fetch(number, NBottle)
    bottle.new.verse(number)
  end

  def verses(start_bottle, end_bottle)
    start_bottle.downto(end_bottle).map { |bottle| verse(bottle) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end

puts BeerSong.new.verses(99, 98)