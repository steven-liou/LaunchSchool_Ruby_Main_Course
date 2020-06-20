class Fibonacci
  def self.nth(n)
    raise ArgumentError, 'N has to be greater than 0' if n <= 0

    fibos = [1, 1]
    3.upto(n) do
      fibos[0], fibos[1] = fibos[1], (fibos[0] + fibos[1])
    end
    fibos.last
  end
end

require 'minitest/autorun'


class FibonacciTest < Minitest::Test
  def test_first_fibo
    assert_equal 1, Fibonacci.nth(1)
  end

  def test_second_fibo
    assert_equal 1, Fibonacci.nth(2)
  end

  def test_3rd_fibo
    assert_equal 2, Fibonacci.nth(3)
  end

  def test_4th_fibo
    assert_equal 3, Fibonacci.nth(4)
  end

  def test_5th_fibo
    assert_equal 5, Fibonacci.nth(5)
  end

  def test_7th_fibo
    assert_equal 13, Fibonacci.nth(7)
  end

  def test_negative_n
    assert_raises(ArgumentError) { Fibonacci.nth(0) }
  end
end