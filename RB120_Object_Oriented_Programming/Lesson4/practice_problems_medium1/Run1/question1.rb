class BankAccount
  attr_reader :balance

  def initialize(starting_balance)
    @balance = starting_balance
  end

  def positive_balance?
    balance >= 0
  end
end

# Ben is right because on line 9, we are calling the getter method for the instance variable @balance, and not trying to reference the instance variable directly

