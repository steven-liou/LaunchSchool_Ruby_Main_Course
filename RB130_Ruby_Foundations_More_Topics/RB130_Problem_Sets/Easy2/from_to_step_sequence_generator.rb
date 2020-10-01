def step(start_point, last_point, step)
  current_point = start_point
  while current_point <= last_point
    yield(current_point)
    current_point += step
  end
  current_point
end


step(1, 10, 3) { |value| puts "value = #{value}" }
