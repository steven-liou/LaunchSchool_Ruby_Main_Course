# < a number that indicates how many switches.
# return an array that identifies which lights are on after n repetitions

# Rules
# n number of switches, each connected to exactly one light, initially off
# first pass, from the beginning toggle every one of the switch
# second pass, from the beginning, toggle 2, 4, 6 ...
# third pass, from the beginning, toggle 3, 6, 9...

# Algo
# create an array of n elements, initally off, false
# have a step variable that holds the current step size, start at 1
# outer loop : iterate through each element of the array
# inner loop : start at current index, iterate to the end of the array based on step size, flip the switch

# create another empty array that holds the light numbers that are on
# iterate through the final array with index, and if the element is true, add the index + 1 to the new array

def lights(number)
  switches = Array.new(number, false)
  step = 1

  for status, index in switches.each.with_index
    for x in index.step(number - 1, step)
      switches[x] = !switches[x]
    end
    step += 1
  end
  on_array = []

  for switch, index in switches.each.with_index
    on_array << index + 1 if switch
  end
  on_array
end

# p lights(5)
p lights(1000)