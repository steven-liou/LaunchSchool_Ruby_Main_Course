# ask user for a string
# Display the number of characters in the given string, exclude spaces


puts "Please write word or multiple words: "
answer = gets.chomp

count = answer.delete('[ ,\']').size

puts "There are #{count} characters in \"#{answer}\""
