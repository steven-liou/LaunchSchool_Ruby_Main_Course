# given

a = ['hi', 'hello', 'world']

def each(a)

  a.each_with_index do |b, index|
    a[index] = a[index] + index.to_s
  end
end

each(a)

# 5. explain what happen to a in each occurance, and what do you expect the result to be for a? Why?

 a


