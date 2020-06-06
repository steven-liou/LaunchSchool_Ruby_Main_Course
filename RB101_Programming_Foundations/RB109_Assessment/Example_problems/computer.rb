# write a method that takes a string with math operations written in English, and return the number1 in integer

# input : string
# output : a number that computes the math operation in the given string

# a hash with key the english number, and value, the corresponding integer
# two cases for the operations, plus, minus,
# separate the words into array
# convert the first and third element into numbers using the hash element reference
# have a variable that stores the operation in string
# test that variable as a case

NUMBERS = {'zero' => 0, 'one' => 1, 'two' => 2, 'three' => 3, 'four' => 4, 'five' => 5, 'six' => 6, 'seven' => 7, 'eight' => 8, 'nine' => 9, 'ten' => 10}

def computer(string)
  string.delete!('by')
  numbers_operations_array = string.split.map do |string|
                                if NUMBERS.key?(string)
                                  NUMBERS[string]
                                else
                                  string
                                end
                             end

  while numbers_operations_array.size > 1
    if numbers_operations_array.include?('times')
      times_idx = numbers_operations_array.index('times')
    end

    if numbers_operations_array.include?('divided')
      divided_idx = numbers_operations_array.index('divided')
    end

    if times_idx && divided_idx
      idx = times_idx < divided_idx ? times_idx : divided_idx
    elsif times_idx
      idx = times_idx
    else
      idx = divided_idx
    end

    if idx
      idx -= 1
      number1 = numbers_operations_array[idx]
      number2 = numbers_operations_array[idx + 2]
      operation = numbers_operations_array[idx + 1]
    else
      idx = 0
      number1 = numbers_operations_array[0]
      number2 = numbers_operations_array[2]
      operation = numbers_operations_array[1]
    end

    result =  case operation
              when 'plus'    then number1 += number2
              when 'minus'   then number1 -= number2
              when 'times'   then number1 *= number2
              when 'divided' then number1 /= number2
              end
    numbers_operations_array.slice!(idx..idx + 2)
    numbers_operations_array.insert(idx, result)
  end
  numbers_operations_array.first
end

# p computer("two plus two") # == 4
# p computer("seven minus six") #== 1
# p computer("zero plus eight")   #== 8

# p computer("two plus two minus three") #== 1
# p computer("three minus one plus five minus four plus six plus ten minus four") #==5

# p computer("eight times four plus six divided by two minus two")  #==  33
# p computer("one plus four times two minus two")  #== 7
p computer("nine divided by three times six")  #== 18
