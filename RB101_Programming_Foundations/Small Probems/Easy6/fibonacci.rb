# input : a number that asks for the first index of Fibo sequence that has that many digits
# output : the index number of Fibo that has the specified number of digits

# Approach : generate the Fibo sequence, in each iteration, check if the number's digits length

# the fibo seqseunce index starts at 1

require 'pry'

def find_fibonacci_index_by_length(digits)
  fibo_num = 0
  prev_num1 = 1
  prev_num2 = 1
  fibo_idx = 1

  loop do
    if fibo_idx <= 2
      fibo_num += 1
    else
      fibo_num = prev_num1 + prev_num2
      prev_num2 = prev_num1
      prev_num1 = fibo_num
    end
    break if fibo_num.to_s.size >= digits
    fibo_idx += 1
  end
  fibo_idx
end


p find_fibonacci_index_by_length(2) == 7          # 1 1 2 3 5 8 13
p find_fibonacci_index_by_length(3) == 12         # 1 1 2 3 5 8 13 21 34 55 89 144
p find_fibonacci_index_by_length(10) == 45
p find_fibonacci_index_by_length(100) == 476
p find_fibonacci_index_by_length(1000) == 4782
p find_fibonacci_index_by_length(10000) == 47847