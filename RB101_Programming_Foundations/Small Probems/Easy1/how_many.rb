#Write a method that counts the number of occurrences of each element in a given array.


def count_occurances(vehicles)
  garage = {}

  vehicles.each do |vehicle|
    if garage.has_key?(vehicle.downcase) #case omsemsotove
      garage[vehicle] += 1
    else
      garage[vehicle] = 1
    end
  end

  garage.each do |key, val|
    puts "#{key} => #{val}"
  end
end

vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'car', 'truck'
]

count_occurances(vehicles)