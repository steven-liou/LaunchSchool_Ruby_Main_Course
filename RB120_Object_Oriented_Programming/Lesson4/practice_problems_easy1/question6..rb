class Cube
  attr_reader :volume

  def initialize(volume)
    @volume = volume
  end
end

# To access the instance variable of an object, you can either
# Include a getter method for that instance variable
# Call the Object#instance_variable_get method with the instance variable name as argument


big_cube = Cube.new(5000)
p big_cube.instance_variable_get("@volume")
p big_cube.volume