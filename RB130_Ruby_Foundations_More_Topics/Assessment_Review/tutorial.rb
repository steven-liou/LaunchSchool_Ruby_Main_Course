def take_block(array)
    array.each do |ele|
      result = yield(ele)
      puts "#{result} is printed from within method" if result
    end
end

take_block([1, 2, 3, 4]) do |number|
  if number.odd?
    puts "#{number} is printed from within block"
  else
    next(number * 2)
  end
end

