#write a method that will determine whether an integer is a prime


# a prime number is only divisible by 1 and itself
# check if any number in between them can divides the number evenly

# have a variable that checks whether the number is prime.
# Iterate from 2 to the number - 1, if the number is divisible by the current iterator, then break out of the loop and retun false


def prime?(number)
  return false if number == 1

  prime = true
  for divisor in (2..number - 1)
    if number % divisor == 0
      prime = false
      break
    end
  end

  prime
end

# p prime?(1)
# p prime?(3)
# p prime?(4)


# write a method that will take an array of numbers, and only return those that are prime

# create a new array that holds the prime numbers
# iterate through the given array, check if the element is a prime number
# if it is, then add it to the new array, else next

def select_primes(arr)
  primes = []

 arr.select { |number| prime?(number)}
end


# p select_primes([1, 2, 3, 4])
# p select_primes([4, 6, 8, 10])


#write a method that will take an array of numbers, and return the number of primes in the array

def count_primes(arr)
  count = 0

  arr.each { |number| count += 1 if prime?(number) }
  count
end

p count_primes([1, 2, 3, 4])
p count_primes([4, 6, 8, 10])