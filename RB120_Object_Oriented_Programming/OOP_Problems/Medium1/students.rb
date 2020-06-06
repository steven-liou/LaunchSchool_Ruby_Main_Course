class Student
  def initialize(name="prospect", year=0)
    @name = name
    @year = year
  end

  def to_s
    "#{@name} is year #{@year}"
  end
end

class Graduate < Student
  def initialize(name, year, parking)
    super(name, year)
    @parking = parking
  end
end

class Undergraduate < Student
end

class ProspectiveStudent < Student
  def initialize
    super()
  end
end

prospect = ProspectiveStudent.new
puts prospect