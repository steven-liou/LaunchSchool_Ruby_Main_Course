# Proc group test
my_proc = proc { |thing| puts "This is a #{thing}." }
puts my_proc
puts my_proc.class
my_proc.call
my_proc.call('cat')

# a new Proc object can be created with a call of proc, instead of Proc.new
# If you under-supply arguments to a Proc object call, the parameter variable is assigned a nil value

# Lambda group
my_lambda = lambda { |thing| puts "This is a #{thing}." }
my_second_lambda = -> (thing) { puts "This is a a #{thing}." }
puts my_lambda
puts my_second_lambda
puts my_lambda.class
puts my_second_lambda.class
my_lambda.call('dog')
# my_lambda.call    #ArgumentError

# a new lambda object can be created with a call to lambda or ->, but not Lambda.new
# my_third_lambda = Lambda.new { |thing| puts "This is a #{thing}" }   # Name error

# You must supply the expected arguments to a lambda, or ArgumentError is raised
# lambdas is a Proc instance

# Block group
def block_method_1(animal)
  yield
end

block_method_1('seal') { |seal| puts "This is a #{seal}." }
# block_method_1('seal')  # LocalJumpError
# If you under-supply arguments to a block, then the parameters in the block would be assigned nil values

# Block group 2
def block_method_2(animal)
  yield(animal)
end
block_method_2('turtle') { |turtle| puts "This is a #{turtle}." }
block_method_2('turtle') do |turtle, seal|
  puts "This is a #{turtle} and a #{seal}"
end
# block_method_2('turtle') { puts "This is a #{animal}." } # Name error


# Both Proc and block have loose arity rules, whereas lambda has strict arity rule and the arguments must match the parameters in the { }

# You can reference a Proc or a lambda by a variable
# lambdas are instances of Proc
# An implicit block is a grouping of code, a type of closure, but it is not an Object