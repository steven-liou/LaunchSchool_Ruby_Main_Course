a = 1



def example
  yield
end



def print1
  puts 1
end

example do
  puts a
end

def print1
  puts 2
end

a = 2