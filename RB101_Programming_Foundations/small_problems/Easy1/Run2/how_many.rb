def count_occurrences(vehicles)
  hash = Hash.new(0)

  vehicles.each do |vehicle|
    hash[vehicle] += 1
  end
  hash
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

puts count_occurrences(vehicles)
