class AngryCat
  def initialize(age, name)
    @age = age
    @name = name
  end

  def age
    puts @age
  end

  def name
    puts @name
  end

  def hiss
    puts "Hissss!!!"
  end
end

cat1 = AngryCat.new(5, "cat1")
cat2 = AngryCat.new(2, "cat2")

cat1.age
cat1.name
cat2.age
cat2.name