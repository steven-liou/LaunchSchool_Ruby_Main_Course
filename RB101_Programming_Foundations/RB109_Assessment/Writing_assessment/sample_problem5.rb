a = "hello"

def what(a)
  a = "what's up"
  yield
end


what(a) do
  puts a
end


# 7. Explain what is each occurance of a, and what will happen when the script is run