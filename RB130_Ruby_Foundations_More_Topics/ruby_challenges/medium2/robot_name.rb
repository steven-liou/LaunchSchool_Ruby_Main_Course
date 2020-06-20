# robot name starts with 2 uppercase letters, followed by 3 decimal digits

class Robot
  LETTERS = ('A'..'Z').to_a
  DIGITS = (0..9).to_a

  attr_accessor :name
  @@previous_names = []

  def initialize
    @name = reset_name
  end

  def reset
    reset_name
  end

  def reset_name
    random_name = (choose(LETTERS, 2)+ choose(DIGITS, 3)).join
    if @@previous_names.include?(random_name)
      reset_name
    else
      @@previous_names << random_name
      self.name = random_name
    end
  end

  def choose(set, number)
    number.times.map { set.sample }
  end
end

