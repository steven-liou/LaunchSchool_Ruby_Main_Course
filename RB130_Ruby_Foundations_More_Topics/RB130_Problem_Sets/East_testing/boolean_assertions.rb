require 'minitest/autorun'

class OddTest < MiniTest::Test
  def test_value_odd
    assert(value.odd?, 'value is not odd')
  end
end