def convert_to_base_8(n)
  n.to_s(8).to_i
end

base8_proc = method(:convert_to_base_8).to_proc
# This looks like
# Proc.new { |n| n.to_s(8).to_i }
# look at how the parameter of convert_to_base_8 is now the parameter of the Proc

result = [8, 10, 12, 14, 16, 33].map(&base8_proc)
p result