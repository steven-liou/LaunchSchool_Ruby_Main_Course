# make a car loan calculator
# Get the loan amount from user
# Get the annual percentage rate (apr)
# Get the loan duration

# Use those information to calculate
# monthly interest rate
# Loan duration in months

require 'pry'

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(number)
  integer?(number) || float?(number)
end

def integer?(number)
  /^\d+$/.match(number)
end

def float?(number)
  /\d/.match(number) && /^\d*\.?\d*$/.match(number)
end

def car_loan_calculator
  prompt 'Welcome to the car loan calculator'
  prompt 'What is your loan amount?'
  loan_amount = nil

  loop do
    loan_amount = gets.chomp
    if valid_number?(loan_amount) && loan_amount.to_f >= 0
      break 
    else
      prompt("Must enter positive number or valid number")
    end
  end

  prompt 'What is the Annual Percentage Rate (apr) of your loan?'
  prompt("(Example: 5 for 5% or 2.5 for 2.5%)")
  apr = nil

  loop do 
    apr = gets.chomp
    if valid_number?(apr) && apr.to_f >= 0
      break
    else
      prompt("Must enter positive number or valid interest rate")
    end
  end

  prompt 'What is your loan duration (in years)?'
  loan_duration = nil

  loop do
    loan_duration = gets.chomp

    if valid_number?(loan_duration) && loan_duration.to_f >= 0
      break
    else
      prompt("Enter a valid number")
    end
  end

  monthly_interest_rate = apr.to_f / 12 / 100
  months = loan_duration.to_f * 12

  monthly_payment = loan_amount.to_f * monthly_interest_rate / (1 - (1 + monthly_interest_rate)**(-months))

  prompt "Your monthly interest rate is #{format('%.3f', monthly_interest_rate * 100)}%"
  prompt "Your monthly payment is $#{format('%.2f', monthly_payment)}"
end

loop do
  car_loan_calculator
  prompt("Another calculation? (y)")
  answer = gets.chomp
  break unless answer.downcase.start_with?('y')
end
prompt("Thank you for using the car loan calculator!\nGood Bye!")
