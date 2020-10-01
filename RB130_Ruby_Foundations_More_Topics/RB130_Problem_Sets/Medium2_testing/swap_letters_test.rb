require 'minitest/autorun'
require_relative 'swap_letters'

class TextTest < Minitest::Test
  def setup
    @file = File.open('swap_sample_text.txt')
    @text_obj = Text.new(@file.read)
  end

  def test_swap
    expected_output = <<~SUB.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.\nSuspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet\nquem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo\nnulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum\ndolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres\net verius meuris, et pheretre mi.
    SUB
    assert_equal(expected_output, @text_obj.swap('a', 'e'))
  end

  def test_word_count
    assert_equal(72, @text_obj.word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end