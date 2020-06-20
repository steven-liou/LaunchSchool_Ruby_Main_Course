require 'minitest/autorun'
require_relative 'text'

class TextTest < MiniTest::Test
  def setup
    @file = File.open('sample_text.txt', 'r')
  end

  def test_swap
    sample_text = @file.read
    sample_text_obj = Text.new(sample_text)
    expected_text = <<~TEXT.chomp
    Lorem ipsum dolor sit emet, consectetur edipiscing elit. Cres sed vulputete ipsum.
    Suspendisse commodo sem ercu. Donec e nisi elit. Nullem eget nisi commodo, volutpet
    quem e, viverre meuris. Nunc viverre sed messe e condimentum. Suspendisse ornere justo
    nulle, sit emet mollis eros sollicitudin et. Etiem meximus molestie eros, sit emet dictum
    dolor ornere bibendum. Morbi ut messe nec lorem tincidunt elementum vitee id megne. Cres
    et verius meuris, et pheretre mi.
    TEXT
    assert_equal(expected_text, sample_text_obj.swap('a', 'e'))
  end

  def test_word_count
    sample_text = @file.read
    actual_word_count = sample_text.split.count
    sample_text_obj = Text.new(sample_text)
    sample_text_word_count = sample_text_obj.word_count
    assert_equal(actual_word_count, sample_text_word_count)
  end

  def teardown
    @file.close
    puts "File has been closed: #{@file.closed?}"
  end
end