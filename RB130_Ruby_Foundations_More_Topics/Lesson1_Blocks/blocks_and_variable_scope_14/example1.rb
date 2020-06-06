name = "Robert"
chunk_of_code = Proc.new {puts "hi #{name}"}


def call_me(some_code)
  some_code.call
end

call_me(chunk_of_code)

