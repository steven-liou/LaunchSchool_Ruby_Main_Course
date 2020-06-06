=begin

Input : starting value, ending value, and a step value

Output : an array of the values in each step

Rules


Data structure / Algorithms
  set the current value to the initial value
  set an array for storing the step values
  while the current value is <= the end value,
    yield to the block with current value as argument
    add the current value to the array
    increment the current value by the step size
  return the array
=end

def step(initial_value, end_value, step)
  current_value = initial_value
  array = []
  while current_value <= end_value
    yield(current_value)
    array << current_value
    current_value += step
  end
  array
end

p step(1, 10, 3) { |value| puts "value = #{value}" }