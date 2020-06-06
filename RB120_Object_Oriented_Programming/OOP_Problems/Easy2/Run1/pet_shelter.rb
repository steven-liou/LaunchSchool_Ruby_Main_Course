class Pet
  attr_reader :species, :name
  def initialize(species, name)
    @species = species
    @name = name
  end

  def to_s
    "a #{species} named #{name}"
  end

end

class Owner
  attr_accessor :pets, :number_of_pets
  attr_reader :name
  def initialize(name)
    @name = name
    @pets = []
    @number_of_pets = 0
  end

end

class Shelter
  attr_accessor :owners, :animal_adoptions

  def initialize
    @animal_adoptions = []
    @owners = {}
  end

  def add_adopt_list(pet)
    animal_adoptions << pet
  end

  def print_adopt_list
    puts "The Animal Sehlter has the following unadopted pets:"

    animal_adoptions.each do |pet|
      puts pet
    end

    puts "The Animal shelter has #{animal_adoptions.size} unadopted pets\n\n"
  end



  def adopt(owner, pet)
    self.owners[owner.name] ||= owner
    owner.pets << pet
    owner.number_of_pets += 1
  end

  def print_adoptions

    owners.each do |name, owner|
      puts "#{name} has adopted the following pets:"

      owner.pets.each do |pet|
        puts pet
      end
      puts
    end

    puts
  end

end


butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')
asta         = Pet.new('dog', 'Asta')
laddie       = Pet.new('dog', 'Laddie')
fluffy       = Pet.new('cat', 'Fluffy')
kat          = Pet.new('cat', 'Kat')
ben          = Pet.new('cat', 'Ben')
chatterbox   = Pet.new('parakeet', 'Chatterbox')
bluebell     = Pet.new('parakeet', 'Bluebell')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)

shelter.add_adopt_list(asta)
shelter.add_adopt_list(laddie)
shelter.add_adopt_list(fluffy)
shelter.add_adopt_list(kat)
shelter.add_adopt_list(ben)
shelter.add_adopt_list(chatterbox)
shelter.add_adopt_list(bluebell)

shelter.print_adoptions


shelter.print_adopt_list
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."