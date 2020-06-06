

def general_select(produce, selection_criteria)
  fruits = produce.keys
  selected_fruits = {}
  counter = 0

  loop do
    break if counter == fruits.size
    current_fruit = fruits[counter]

    if produce[current_fruit] == selection_criteria
      selected_fruits[current_fruit] = produce[current_fruit]
    end

    counter += 1
  end

  selected_fruits
end


produce = {
  'apple' => 'Fruit',
  'carrot' => 'Vegetable',
  'pear' => 'Fruit',
  'broccoli' => 'Vegetable'
}

puts general_select(produce, 'Vegetable')

