def welcome(str)
  puts str + ' ' + (block_given? ? yield: '')
end


welcome('Hello') { 'there' } # => Hello there
welcome('Hey') { 'Joe' } # => Hey Joe