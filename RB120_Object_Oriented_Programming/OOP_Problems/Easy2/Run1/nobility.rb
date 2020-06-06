module Movable
  def walk
    puts "#{self} #{gait} foward"
  end
end

class Person
  attr_reader :name
  include Movable

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
  
  private

  def gait
    "strolls"
  end
end

class Noble < Person
  attr_reader :name, :title

  def initialize(name, title)
    super(name)
    @title = title
  end

  def to_s
    "#{title} #{name}"
  end

  private

  def gait
    "struts"
  end
end


byron = Noble.new('Byron', 'Lord')
p byron.walk

p byron.name
p byron.title