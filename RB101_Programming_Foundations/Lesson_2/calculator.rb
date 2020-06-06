# ask the user for two numbers
# ask the user for an operation to perform
# perform the operation on the two numbers
# output the result

require 'yaml'
require 'pry'
LANG_MESSAGES = YAML.load_file('calculator_messages.yml')

def language(lang_messages, num)
  language =  case num
              when '2'
                'ch'
              else
                'en'
              end
  messages = lang_messages[language]
end


def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  number.to_i.to_s == number
end

def float?(number)
  number.to_f.to_s == number
end

def operation_to_message(op)
 message =  case op
            when '1'
              'Adding'
            when '2'
              'Sbtracting'
            when '3'
              'Multiplying'
            when '4'
              'Dividing'
            end
  x = "A random line of code"
  message
end

#ask the user to pick a language
language_selection = nil
loop do
  puts "1. Please select English\n2. 請選擇中文\n3. Default"
  language_selection = gets.chomp
  if valid_number?(language_selection)
    break
  end
  prompt(MESSAGES['invalid_number'])

end

MESSAGES = language(LANG_MESSAGES, language_selection)


prompt(MESSAGES['welcome'])

name = ''
loop do
  name = gets.chomp

  if name.empty?
    prompt(MESSAGES['valid_name'])
  else
    break
  end
end

prompt("Hi, #{name}")

loop do
  number1 = nil
  loop do
    prompt(MESSAGES["first_number"])
    number1 = gets().chomp

    if valid_number?(number1)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end

  number2 = nil
  loop do
    prompt(MESSAGES['second_number'])
    number2 = gets().chomp()

    if valid_number?(number2)
      break
    else
      prompt(MESSAGES['invalid_number'])
    end
  end


  prompt(MESSAGES['operator_prompt'])

  operator = nil
  loop do
    operator = gets().chomp()

    if %w(1 2 3 4).include?(operator)
      break
    else
      prompt("Must choose 1, 2, 3, 4")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers")

  result =  case operator
            when '1'
              number1.to_i + number2.to_i
            when '2'
              number1.to_i - number2.to_i
            when '3'
              number1.to_i * number2.to_i
            when '4'
              number1.to_f / number2.to_f
            end

  prompt("The result is #{result}")

  prompt(MESSAGES['again?'])
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end

prompt(MESSAGES['goodbye'])

