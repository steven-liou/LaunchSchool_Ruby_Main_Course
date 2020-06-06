#the idea being demonstrated is that the do...end have a lower priorty then the method call, so method p is invoked with arr.sort as arugment, since p returns nil and not a method, the block is not invoked

# the p method is separate from say a long method chain like arr.split.map do ... end

arr = ["9", "8", "7", "10", "11"]
p (arr.sort do |x, y|

    y.to_i <=> x.to_i
  end)

# Expected output: ["11", "10", "9", "8", "7"]
# Actual output: ["10", "11", "7", "8", "9"]