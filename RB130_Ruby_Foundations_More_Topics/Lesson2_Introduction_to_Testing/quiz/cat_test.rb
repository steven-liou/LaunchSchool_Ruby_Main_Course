require 'minitest/autorun'

require_relative 'cat'

class CatTest < MiniTest::Test
  def setup
    @kitty = Cat.new('Kitty', 1)
  end

  def test_name
    assert_equal('Kitty', @kitty.name)
    assert(@kitty.name == 'Kitty')
  end

  def test_miaow
    assert_equal('Kitty is miaowing.', @kitty.miaow)
    assert(@kitty.miaow.include?(' is miaowing.'))
    assert_match(/ is miaowing\./, @kitty.miaow)
  end

  def test_raises_error
    assert_raises(ArgumentError) { Cat.new }
    assert_raises do
      Cat.new
    end
  end

  def test_is_not_purrier
    patch = Cat.new('Patch', 5)
    milo = Cat.new('Milo', 3)
    refute(patch.purr_factor < milo.purr_factor)
  end

end