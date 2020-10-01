# Group 1
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# a proc object is an instance of class Proc. It has loose arity rule. If you don't give the arguments it seeks, it assigns nil to those parameters.

# Group 2
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
my_lambda.call('dog')
# my_lambda.call
# my_lhird_lambda = Lambda.new { |thing| puts "This is a #{thing}." }

# a lambda is actually a special type of Proc object. It has strict arity rule, and you must supply all the positional arguments like you would a method.

# Group 3

def block_method_1(animal)
  yield if block_given?
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
block_method_1('seal')

# Group 4

def block_method_2(animal)
  yield(animal)
end

block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}."
end

# block_method_2('turtle') {puts "this is a #{animal}." }

# A block is not an object, but part of Ruby syntax. If you yield to a block that is not supplied, you run into LocalJumpError. It is therefore good to check whether a block has been given to a method first.