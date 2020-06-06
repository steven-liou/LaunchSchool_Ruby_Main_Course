class Person
  attr_reader :first_name, :last_name
  attr_writer :last_name

  def initialize(name)

    parsed_names = name.split
    @first_name = parsed_names.first

    if parsed_names.size > 1
      @last_name = parsed_names.last
    else
      @last_name = ''
    end

  end


  def name
    if @last_name.empty?
      @first_name
    else
      @first_name + ' ' + @last_name
    end
  end


end


bob = Person.new('Robert')
p bob.name
p bob.first_name
p bob.last_name
bob.last_name = 'Smith'
p bob.name
"hello".split