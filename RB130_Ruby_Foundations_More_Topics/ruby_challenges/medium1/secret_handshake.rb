# first convert the number into binary number, and get the digits into an array in reverse order

class SecretHandshake
  COMMANDS = ['wink', 'double blink', 'close your eyes', 'jump']
  def initialize(input)
    binary_string = input.instance_of?(Integer) ? input.to_s(2) : input
    binary_string = '0' if binary_string =~ /[^01]/
    @binary_digits = binary_string.to_i.digits
  end

  def commands
    @binary_digits.each_with_index.with_object([]) do |(value, index), command_list|
      next if value == 0
      if index > COMMANDS.size - 1
        command_list.reverse! if value == 1
      else
        command_list << COMMANDS[index] if value == 1
      end
    end
  end
end
