require 'minitest/autorun'

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def setup
    @register = CashRegister.new(0)
    @transaction = Transaction.new(100)
    @transaction.amount_paid = 100
  end

  def test_accept_money
    previous_amount = @register.total_money
    @register.accept_money(@transaction)
    current_amount = @register.total_money
    assert_equal(previous_amount + @transaction.amount_paid, current_amount)
  end

  def test_change
    assert_equal(0, @register.change(@transaction))
    @transaction.amount_paid += 10
    assert_equal(10, @register.change(@transaction))
  end

  def test_give_receipt
    assert_output("You've paid $#{100}.\n") { @register.give_receipt(@transaction) }
  end


end