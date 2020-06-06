class Transform
  attr_reader :chars

  def initialize(chars)
    @chars = chars
  end

  def uppercase
    chars.upcase
  end

  def self.lowercase(chars)
    chars.downcase
  end

end


my_data = Transform.new('abc')
puts my_data.uppercase
puts Transform.lowercase('XYZ')