# Write a method which takes a grocery list (array) of fruits with quantities and converts it into an array of the correct number of each fruit.



'''
Input: array of fruits

Output: expand the array of fruits

Rules


Data structure / Algorithms

    create an empty array for the results
    iterate through the array
        for each subarray, add the fruit * numbers into the result array
    return the result
'''

def buy_fruit(basket):
    result_array = []

    for item in basket:
        result_array +=  [item[0]] * item[1]
    return result_array










print(buy_fruit([["apples", 3], ["orange", 1], ["bananas", 2]]) ==
  ["apples", "apples", "apples", "orange", "bananas","bananas"])