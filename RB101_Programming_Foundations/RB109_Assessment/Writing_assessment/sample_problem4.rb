# given

a = ['hi', 'hello', 'world']
b = a.clone

def each(a)

  a.each_with_index do |b, index|
    a[index] = a[index] + index.to_s
  end
end

each(b)

# 6. what do you expect a to be and why?
p a


