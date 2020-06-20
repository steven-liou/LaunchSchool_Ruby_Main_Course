class TextAnalyzer
  def process
    file = File.open('simple_text.txt')
    text = file.read
    yield(text) if block_given?
    file.close
  end
end

analyzer = TextAnalyzer.new
analyzer.process { |text| puts "#{text.split("\n\n").size } paragraphs" }
analyzer.process { |text| puts "#{text.split("\n").size } lines" }
analyzer.process { |text| puts "#{text.split.size} words" }