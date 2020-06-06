# It takes two already-sorted lists (arrays, in this example) and returns one large sorted list.

# The name of the function in this example is "mergesorted". It should return a big sorted array from two smaller sorted arrays: e.g.

# without using #sort

def merged(first, second)
  merged = Array.new(first + second)

  first_idx = 0
  second_idx = 0

  while true
    if first_idx < first.size && second_idx < second.size && first[first_idx] <= second[second_idx]
      merged[first_idx + second_idx] = first[first_idx]
      first_idx += 1
    elsif first_idx < first.size && second_idx < second.size && first[first_idx] > second[second_idx]
      merged[first_idx + second_idx] = second[second_idx]
      second_idx += 1
    elsif first_idx >= first.size
      merged[first_idx + second_idx] = second[second_idx]
      second_idx += 1
    elsif second_idx >= second.size
      merged[first_idx + second_idx] = first[first_idx]
      first_idx += 1
    end
    break if first_idx + second_idx == merged.size
  end
  merged
end


p merged([1,2],[3,4]) #== [1,2,3,4]
p merged([1,2],[3])   #== [1,2,3]
p merged([1],[2, 3])  #== [1,2,3]
p merged([1,2,3],[1,2,3]) #== [1,1,2,2,3,3]

