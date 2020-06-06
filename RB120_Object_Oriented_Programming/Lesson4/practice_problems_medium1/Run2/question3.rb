class Car
  attr_writer :year

  def initialize(year)
    @year = year
  end

  def change_year(year)
    self.year = year
  end
end

porsche = Car.new(1998)
porsche.change_year(1995)
