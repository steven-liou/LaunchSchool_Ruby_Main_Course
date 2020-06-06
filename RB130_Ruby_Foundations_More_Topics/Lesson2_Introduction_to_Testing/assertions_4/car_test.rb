require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!


class CarTest < Minitest::Test

  # assert
  def test_car_exists
    car = Car.new
    assert(car)
  end

  #assert_equal
  def test_wheels
    car = Car.new
    assert_equal(4, car.wheels)
  end

  # assert_nil
  def test_name_is_nil
    car = Car.new
    assert_nil(car.name)
  end

  # assert_raises
  def test_raise_initialize_with_org
    assert_raises(ArgumentError) do
      car = Car.new(name: "Joey") # this code raises ArgumentError, so this assertion passes
    end
  end

  # assert_instance_of, this is more useful when dealing with inheritance. This example is contrived
  def test_instance_of_car
    car = Car.new
    assert_instance_of(Car, car)
  end

  # assert_includes
  def test_includes_car
    car = Car.new
    arr = [1, 2, 3]
    arr << car

    assert_includes(arr, car)
  end
  # assert_includes calls assert_equal in its implementation, and Minitest counts that call
  # as a separate assertion. For each assert_includes call, you will get 2 assertions, not 1.

end