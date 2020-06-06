def echo_with_yield(str)
  yield if block_given?
  str
end

# echo_with_yield { puts "world" } #ArgumentError, expected 1, given 0
echo_with_yield("hello!") { puts "world" }
echo_with_yield("hello!")