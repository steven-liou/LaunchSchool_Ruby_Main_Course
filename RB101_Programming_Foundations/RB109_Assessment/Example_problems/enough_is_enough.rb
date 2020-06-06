=begin
Given a list lst and a number N, create a new list that contains each number of lst at most N times without reordering. For example if N = 2, and the input is [1,2,3,1,2,1,2,3], you take [1,2,3,1,2], drop the next [1,2] since this would lead to 1 and 2 being in the result 3 times, and then take 3, which leads to [1,2,3,1,2,3].
=end

=begin

Input : an array, and a max number of repetitino

Output : original array without additional repeat

Rules :
    each element of the array cannot occur more than the specified number of times
Algorithm:
    - create an empty array that holds the elements up to the current iteration
    - iterate through each element of the array
      - check if the current element's count in the counting array is greater than the limit
        - if it is, do not add this element to the counting array
        - if it isn't add it to the counting array
    - return the counting array

=end


def delete_nth(order,max_e)
  counting_array = []

  for item in order.each
    if counting_array.count(item) < max_e
      counting_array << item
    end
  end
  counting_array
end


p delete_nth([1,1,1,1],2) # return [1,1]
p delete_nth([20,37,20,21],1) # return [20,37,21]