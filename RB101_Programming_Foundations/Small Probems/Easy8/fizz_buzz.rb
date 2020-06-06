def fizzbuzz(num1, num2)
  array = []
  (num1..num2).each do |num|
    array << fizzbuzz_value(num)
  end
  p array.join(', ')
end

def fizzbuzz_value(num)
  case
  when num % 3 == 0 && num % 5 == 0
    'FizzBuzz'
  when num % 3 == 0
    'Fizz'
  when num % 5 == 0
    'Buzz'
  else
    num
  end
end

fizzbuzz(1, 15)
