#Problem 1
# words = ["laboratory", "experiment", "Pans Labyrinth", "elaborate", "polar bear"]
# check = []
# words.each do |word|
#   if word =~ /lab/
#     check.push(true)
#   else
#     check.push(false)
#   end
# end

# p check

#Problem 2
#Nothing will be printed on the screen because the proc object is not executed with .call. it would return the block object,
# def execute(&block)
#   block
# end

# puts(execute {puts "Hello from inside the execute method!"})


#Problem 3
# When a program runs into unexpected errors, or a certain type of anticipated errors, we can catch it and prevent the program from terminating. A catch or rescue block is run instead to handle the error.


#Problem 4
# def execute(&block)
#   block.call
# end

# puts(execute {puts "Hello from inside the execute method!"})


#Problem 5
# Without the & symbol, the program is expecting a variable, and since on line 5, a block is passed, the program says there is a wrong argument input.