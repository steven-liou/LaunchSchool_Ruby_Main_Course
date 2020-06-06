def greeting(message)
  yield
  puts message
end


arg1 = "hello world"
local_var = "block executed"

greeting(arg1) do
  puts local_var
end


def custom_map(array, )