class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    return "I want to turn on the light with a brightness level of super high and a color of green"
  end
end


=begin
What is used in this class but doesn't add any value?
The return doesn't add any value since it is the last line of the function in information
=end