=begin

Input :

Output :

Rules
  If the phone number is less than 10 digits assume that it is bad number
  If the phone number is 10 digits assume that it is good
  If the phone number is 11 digits and the first number is 1, trim the 1 and use the last 10 digits
  If the phone number is 11 digits and the first number is not 1, then it is a bad number
  If the phone number is more than 11 digits assume that it is a bad number


Data structure / Algorithms


=end

class PhoneNumber
  def initialize(phone_number_string)
    @phone_number_string = phone_number_string
    @phone_digits = phone_number_string.scan(/\d/)
  end

  def area_code
    number[0, 3]
  end

  def number
    return '0' * 10 unless valid_phone_number?
    @phone_digits.shift if @phone_digits.size == 11
    @phone_digits.join('')
  end

  def valid_phone_number?
    !@phone_number_string.match(/[A-Za-z]/) && ( @phone_digits.size == 10 || (@phone_digits.size == 11 && @phone_digits.first == '1') )
  end

  def to_s
    phone_number = number
    "(#{phone_number[0, 3]}) #{phone_number[3, 3]}-#{phone_number[-4, 4]}"
  end
end

PhoneNumber.new('19876543210').number