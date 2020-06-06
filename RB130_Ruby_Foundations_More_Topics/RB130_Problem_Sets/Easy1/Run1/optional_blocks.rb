# def compute
#   block_given? ? yield : "Does not compute."
# end

def compute
  return "Does not compute." unless block_given?
  yield
end

puts compute { 5 + 3 } == 8
puts compute { 'a' + 'b' } == 'ab'
puts compute == 'Does not compute.'

def compute2(ele)
  return "Does not compute." unless block_given?
  yield(ele)
end

puts compute2(5) { |ele| ele + 3 } == 8
puts compute2('a') { |ele| ele + 'b' } == 'ab'
puts compute2(5) == 'Does not compute.'