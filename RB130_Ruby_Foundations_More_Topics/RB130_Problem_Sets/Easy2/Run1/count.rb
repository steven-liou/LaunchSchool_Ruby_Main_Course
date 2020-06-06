=begin

Input : arbitrary number of arguments and a block

Output : the number that results in the instances of block returning true

Rules


Data structure / Algorithms
  store the arbitrary parameters into an array
  start counter at 0
  iterate through the array
    yield to the block, if the block returns true, add 1 to counter
  return counter

=end

def count(*args)
  counter = 0

  args.each { |ele| counter += 1 if yield(ele) }
  counter
end

p count(1, 3, 6) { |value| value.odd? } == 2
p count(1, 3, 6) { |value| value.even? } == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { |value| true } == 3
p count() { |value| true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3