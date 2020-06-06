def array_partition(array)
  store_array = [[], []]
  counter = 0

  loop do
    break if counter == array.size
    if yield(array[counter])
      store_array.first << array[counter]
    else
      store_array.last << array[counter]
    end
    
    counter += 1
  end
  store_array
end


array_par = array_partition([1, 2, 3, 4, 5, 6]) do |num|
  num.odd?
end


p array_par  



def hash_partition(hsh)
  store_array = [[], []]
  counter = 0
  hsh_array = hsh.to_a

  loop do 
    break if counter == hsh_array.size

    if yield(hsh_array[counter].first, hsh_array[counter].last)
      store_array[0] << hsh_array[counter]
    else
      store_array[1] << hsh_array[counter]
    end
    
    counter += 1
  end

  store_array
end


hsh_arr = hash_partition({ a: "ant", b: "bear", c: "cat" }) do | key, val |
  val.size > 3
end

p hsh_arr