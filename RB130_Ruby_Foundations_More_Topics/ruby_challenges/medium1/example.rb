def test_block
  yield
  puts "I'm in method"
end

test_block do
  puts "I'm in block"
  break
end


def test_proc(proc_obj)
  proc_obj.call
  puts "I'm in method"
end

example_proc = Proc.new do
  puts "I'm in Proc"
  return
end

test_proc(example_proc)