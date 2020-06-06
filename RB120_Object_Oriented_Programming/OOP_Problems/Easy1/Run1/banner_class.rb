class Banner
  def initialize(message)
    @message = message
  end

  def to_s
    [horizontal_rule, empty_line, message_line, empty_line, horizontal_rule].join("\n")
  end

  private

  def horizontal_rule
    get_line('+', '-')
  end

  def empty_line
    get_line('|', ' ')
  end

  def get_line(symbol, padding)
    symbol + padding * (@message.length + 2) + symbol
  end

  def message_line
    "| #{@message} |"
  end
end

banner = Banner.new('To boldly go where no one has gone before.')
puts banner

banner = Banner.new('')
puts banner