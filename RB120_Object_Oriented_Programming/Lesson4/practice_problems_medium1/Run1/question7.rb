class Light
  attr_accessor :brightness, :color

  def initialize(brightness, color)
    @brightness = brightness
    @color = color
  end

  def self.information
    "I want to turn on the light with a brightness level of super high and a colour of green"
  end
end

# In general, don't include class information in your method names, as the invocation would be repetitive and awkward

# Originally, it would look like Light.light_information
# Now we cn just call Light.information