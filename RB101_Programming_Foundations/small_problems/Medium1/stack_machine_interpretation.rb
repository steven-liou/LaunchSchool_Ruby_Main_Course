
require 'pry'

def minilang(commands)
  register = 0
  stack = []

  commands.split.each do |token|
    # binding.pry
    case token
    when 'PRINT'   then print(register)
    when 'PUSH'    then push(stack, register)
    when 'POP'     then register = stack.pop
    when 'ADD'     then register = add(stack, register)
    when 'SUB'     then register = sub(stack, register)
    when 'MULT'    then register = mult(stack, register)
    when 'DIV'     then register = div(stack, register)
    when 'MOD'     then register = mod(stack, register)
    else                register = token.to_i
    end
  end

end

def print(register)
  puts register
end

def push(stack, register)
  stack << register
end

def mult(stack, register)
  register * stack.pop
end

def add(stack, register)
   register + stack.pop
end

def sub(stack, register)
  register - stack.pop
end

def div(stack, register)
  register / stack.pop
end

def mod(stack, register)
  register % stack.pop
end

minilang('3 PUSH 5 MOD PUSH 7 PUSH 3 SUB PUSH 4 PUSH 5 MULT ADD DIV PRINT')
