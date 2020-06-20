items = %w(apples corn cabbage wheat)

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*firsts, last|
  puts firsts.join(', ')
  puts last
end

gather(items) do |first, *middles, last|
  puts first
  puts middles.join(', ')
  puts last
end

gather(items) do |first, *lasts|
  puts first
  puts lasts.join(', ')
end

gather(items) do |first, second, third, fourth|
  puts "#{first}, #{second}, #{third}, #{fourth}"
end