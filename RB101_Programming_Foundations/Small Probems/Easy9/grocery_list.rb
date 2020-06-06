# input : array of subarray ([fruit, quantity])
# output : simple array of fruits that repeats their respective count numbers

# iterate through the outer array, for each subarray, add push that fruit's name as many times to a storage array with the fruit's counts

def buy_fruit(fruits)
  fruits_bucket = []

  fruits.each do | fruit, quantity|
    quantity.times { fruits_bucket << fruit }
  end

  fruits_bucket
end

puts buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"]