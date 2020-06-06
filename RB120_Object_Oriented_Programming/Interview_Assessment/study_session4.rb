class VendingMachine
  def initialize
    @items = {}
  end

  def [](key)
    @items[key]
  end

  def []=(key, value)
    @items[key] = value
  end

  def to_s
    string = "Machine has:\n"
    items = @items.values.map {|snack| snack.to_s}.join("\n")
    string + items
  end
end

class Snack
  attr_reader :name
  def initialize(name, price)
    @name = name
    @price = price
  end

  def to_s
    "#{@name} is $#{@price}"
  end
end

machine = VendingMachine.new
kitkat = Snack.new('KitKat', 1.25)
mm = Snack.new('M&M', 0.5)
butterfinger = Snack.new('Butterfinger', 0.75)
machine[kitkat.name] = kitkat
machine[mm.name] = mm
machine[butterfinger.name] = butterfinger
puts (machine)