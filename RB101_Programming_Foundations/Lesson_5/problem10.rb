#  without modifying the original array use the map method to return a new array identical in structure to the original but where the value of each integer is incremented by 1.


[{a: 1}, {b: 2, c: 3}, {d: 4, e: 5, f: 6}].map do |hsh|
  incremented_hsh = {}
  hsh.each do | key, val|
    incremented_hsh[key] = val + 1
  end
  incremented_hsh
end.tap {|val| p val}

