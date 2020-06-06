class Minilang
  attr_accessor :register
  attr_reader :stack
  def initialize(operations)
    @register = 0
    @stack = []
    @operations = operations.split
  end

  def eval
    @operations.each do |token|
      case token
      when 'PRINT' then puts register
      when 'PUSH'  then stack << @register
      when 'ADD'   then self.register += stack.pop
      when 'SUB'   then self.register -= stack.pop
      when 'MULT'  then self.register *= stack.pop
      when 'DIV'   then self.register /= stack.pop
      when 'MOD'   then self.register %= stack.pop
      when 'POP'
        if stack.empty?
          puts "Empty stack!"
          return
        end
        self.register = stack.pop
      when /^-?\d+$/ then self.register = token.to_i
      else
        invalid_token(token)
        return
      end
    end
  end

  def invalid_token(token)
    puts "Invalid token: #{token}"
  end

end


Minilang.new('PRINT').eval
# 0

Minilang.new('5 PUSH 3 MULT PRINT').eval
# 15

Minilang.new('5 PRINT PUSH 3 PRINT ADD PRINT').eval
# 5
# 3
# 8

Minilang.new('5 PUSH 10 PRINT POP PRINT').eval
# 10
# 5

Minilang.new('5 PUSH POP POP PRINT').eval
# Empty stack!

Minilang.new('3 PUSH PUSH 7 DIV MULT PRINT ').eval
# 6

Minilang.new('4 PUSH PUSH 7 MOD MULT PRINT ').eval
# 12

Minilang.new('-3 PUSH 5 XSUB PRINT').eval
# Invalid token: XSUB

Minilang.new('-3 PUSH 5 SUB PRINT').eval
# 8

Minilang.new('6 PUSH').eval
# (nothing printed; no PRINT commands)