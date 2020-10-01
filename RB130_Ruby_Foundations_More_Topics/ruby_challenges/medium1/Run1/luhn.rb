=begin

Input : a number

Output : valid Luhn number or not
         checksum or remainder from using the Luhn method

Rules
  - counting from rightmost digit, double the every second digit value
    - if the doubled value is greater than 10, subtract 9 from it
  - Add the new digits together to get the sum

  - if the total sum is divisible by 10, then it is a valid Luhn number, else it is not

  - a method that can add the necessary value at the rightmost digit to turn an invalid Luhn number to a valid one

Data structure / Algorithms
    break up the number into array of digits, with rightmost digits starting in index

    perform transformation of the digits
      iterate through the digits,
        if the current index is "even", then double the digit.
        if the value of the doubling is greater than or equal to 10, subtract 9 from it
    reverse the transformed digits
    get the sum of the transformed digits
    if the sum is divisible by 10, then it is a Luhn number

=end

class Luhn
  attr_reader :number

  def initialize(number)
    @number = number
  end

  def addends
    addends_arr = number.digits.map.with_index do |digit, index|
      value = index.odd? ? digit * 2 : digit
      value -= 9 if value >= 10
      value
    end
    addends_arr.reverse
  end

  def checksum
    addends.reduce(&:+)
  end

  def valid?
    checksum % 10 == 0
  end

  def self.create(number)
    luhn = new(number)
    luhn.valid? ? number : make_luhn(number)
  end

  def self.make_luhn(number)
    number *= 10
    luhn = new(number)

    if luhn.valid?
      number
    else
      ones = luhn.checksum % 10
      complement = 10 - ones
      number + complement
    end
  end
end

p Luhn.new(837_263_756).checksum