# While the string has "multiplied by" or "divided by", compute the operation
# While the string has "plus" or "minus", compute the operation


class WordProblem
  OPERATORS = { "plus" => :+, "minus" => :-, "multiplied by" => :*, "divided by" => :/}
  def initialize(question)
    @question = question
  end

  def answer
    question = parse_question(@question)
    raise ArgumentError unless question
    loop do
      question = parse_question(question) || break
    end
    question.match(/-?\d+/)[0].to_i

  end

  private

  def parse_question(string)
    operations = string.match(/(-?\d+) (plus|minus|multiplied by|divided by) (-?\d+)/)

    if operations
      number1, operation, number2 = operations[1].to_i, OPERATORS[operations[2]], operations[3].to_i
      number = number1.send(operation, number2)
      string.gsub(operations[0], number.to_s)
    end
  end
end

WordProblem.new('What is -3 multiplied by 25?').answer

