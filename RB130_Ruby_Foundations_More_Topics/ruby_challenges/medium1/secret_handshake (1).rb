=begin

Input : a number

Output : the secret handshake string

Rules


Data structure / Algorithms
  - convert the number to binary number
    if the input is a string, check if it contains only digits
      if so, turn it into numbers
      else, make it 0

  - look up the secret handshake array
      - ['wink', 'double blink', 'close your eyes', 'jump']

    create an array for result
    iterate through the digits from lower power to higher power by index
      if the current digit is 1, then
        look up the table by the index to get the secret handshake if index < 4
        reverse the result array if index == 4
    return result
=end

class SecretHandshake
  HANDSHAKES = %w(wink double\ blink close\ your\ eyes jump)

  def initialize(input)
    @binary = convert_to_bin(input)
  end

  def commands
    result = []
    @binary.digits.each_with_index do |digit, index|
      if digit == 1
        result << HANDSHAKES[index] if index < 4
        result.reverse! if index == 4
      end
    end
    result
  end

  def convert_to_bin(input)
    if input.instance_of?(String)
      input =~ /[^01]/ ? 0 : input.to_i
    elsif input.instance_of?(Integer) && input > 0
      input.to_s(2).to_i
    else
      0
    end
  end
end
