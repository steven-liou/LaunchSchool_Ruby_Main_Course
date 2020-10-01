# InputL user input string with 1+ words
# space shouldn't be counted as characters
# output: number of characters in the input string

print "Please write word or multiple words: "
words = gets.chomp
words_arr = words.split

counts = words_arr.reduce(0) {|count, word| count += word.size}
puts "There are #{counts} characters in \"#{words}\""

#alternative
# words = gets.chomp
# number_of_characters = words.delete(' ').size
# number_of_characters = words.split.join.size



