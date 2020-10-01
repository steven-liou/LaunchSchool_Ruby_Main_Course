def sort_raptors(animals)
  yield(animals)
end

animals = %w(raven finch hawk eagle)
sort_raptors(animals) {|_, _, *raptors| puts "Here are the raptors: #{raptors.join(', ')}"}