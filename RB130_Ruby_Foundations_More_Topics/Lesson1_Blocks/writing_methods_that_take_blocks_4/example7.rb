#return value of yielding to the block

def compare(str)
  puts "Before: #{str}"
  after = yield(str)
  puts "After #{after}"
end

compare('hi') { |word| word.upcase }

