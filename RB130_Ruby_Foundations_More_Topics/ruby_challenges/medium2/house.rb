HOUSE = ['This is the house that Jack built.
', 'that lay in the house that Jack built.
']

ANIMALS = %w(malt rat cat dog)


class House
  def self.recite
    phrases = House.new.send(:pieces)
    song = []
    verse_num = phrases.size

    verse_num.times do |at_verse|

      song << create_verse(verse_num, at_verse, phrases)
    end
    song.join("\n\n") + "\n"
  end


  private

  def self.create_verse(verse_num, at_verse, phrases)
    verse = "This is "
    (verse_num - at_verse - 1).upto(verse_num - 1) do |phrase_num|
      phrase = phrases[phrase_num]
      verse = add_phrase_to_verse(verse, phrase)
    end
    verse + '.'
  end

  def self.add_phrase_to_verse(verse, phrase)
    verse += phrase.first
    verse += "\n" + phrase[1] + " " if phrase[1]
    verse
  end

  def pieces
    [
      ['the horse and the hound and the horn', 'that belonged to'],
      ['the farmer sowing his corn', 'that kept'],
      ['the rooster that crowed in the morn', 'that woke'],
      ['the priest all shaven and shorn', 'that married'],
      ['the man all tattered and torn', 'that kissed'],
      ['the maiden all forlorn', 'that milked'],
      ['the cow with the crumpled horn', 'that tossed'],
      ['the dog', 'that worried'],
      ['the cat', 'that killed'],
      ['the rat', 'that ate'],
      ['the malt', 'that lay in'],
      ['the house that Jack built']
    ]
  end
end

