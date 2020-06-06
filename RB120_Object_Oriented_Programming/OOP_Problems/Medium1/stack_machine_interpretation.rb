class MiniLangError < StandardError; end
class BadTokenError < MiniLangError; end
class EmptyStackError < MiniLangError; end

class Minilang
  OPERATIONS = %w(PUSH ADD SUB MULT DIV MOD POP PRINT)

  attr_reader :stack, :operations
  attr_accessor :register

  def initialize(operations)
    @register = 0
    @stack = []
    @operations = operations
  end

  def eval(degrees_c: nil)
    interp_operations = format(operations, degrees_c: degrees_c)
    interp_operations.split.each do |token|
      eval_token(token)
    end
  rescue MiniLangError => error
    puts error
  end

  def eval_token(token)
    if OPERATIONS.include?(token)
      send(token.downcase)
    elsif token =~ /\A[+-]?\d+\z/
      self.register = token.to_i
    else
      raise BadTokenError, "Invalid token: #{token}"
    end
  end

  def print
    puts register
  end

  def push
    stack << register
  end

  def pop(update_register= true)
    raise EmptyStackError, "Empty stack!" if stack.empty?
    if update_register
      self.register = stack.pop
    else
      stack.pop
    end
  end

  def add
    self.register += pop(false)
  end

  def sub
    self.register -= pop(false)
  end

  def mult
    self.register *= pop(false)
  end

  def div
    self.register /= pop(false)
  end

  def mod
    self.register %= pop(false)
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


CENTIGRADE_TO_FAHRENHEIT =
  '5 PUSH %<degrees_c>d PUSH 9 MULT DIV PUSH 32 ADD PRINT'
minilang = Minilang.new(CENTIGRADE_TO_FAHRENHEIT)
minilang.eval(degrees_c: 100)
# 212
minilang.eval(degrees_c: 0)
# 32
minilang.eval(degrees_c: -40)
# -40