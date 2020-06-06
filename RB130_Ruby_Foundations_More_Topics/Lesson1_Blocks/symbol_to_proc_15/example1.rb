[1, 2, 3, 4, 5].map do |num|
  num.to_s
end

[1, 2, 3, 4, 5].map(&:to_s)                     # => ["1", "2", "3", "4", "5"]

[1, 2, 3, 4, 5].map(&:to_s).map(&:to_i)         # => [1, 2, 3, 4, 5]










["hello", "world"].each(&:upcase!)
[1, 2, 3, 4, 5].select(&:odd?)
[1, 2 ,3 ,4, 5].select(&:odd?).any?(&:even?)
