class Test
  attr_accessor :name
  def name=(string)
    string.downcase!
  end
end

obj = Test.new

p obj.name = "STEVEN"