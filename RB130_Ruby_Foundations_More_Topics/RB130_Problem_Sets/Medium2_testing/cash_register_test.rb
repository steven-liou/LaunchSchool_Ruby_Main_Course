require 'minitest/autorun'
require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < MiniTest::Test
  def test_accept_money
    register = CashRegister.new(0)
    transaction = Transaction.new(100)
    transaction.amount_paid = 100
    register.accept_money(transaction)
    assert_equal(100, register.total_money)
  end

  def test_change
    register = CashRegister.new(0)
    transaction = Transaction.new(100)
    transaction.amount_paid = 120
    assert_equal(20, register.change(transaction))
  end

  def test_give_receipt
    register = CashRegister.new(0)
    transaction = Transaction.new(100)
    assert_output("You've paid $100.\n") { register.give_receipt(transaction) }
  end

  def test_prompt_for_payment
    transaction = Transaction.new(100)
    input = StringIO.new("100\n")
    output = StringIO.new
    transaction.prompt_for_payment(input:input, output: output)
    assert_equal(100, transaction.amount_paid)

  end
end
