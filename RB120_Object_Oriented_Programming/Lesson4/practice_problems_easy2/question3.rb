module Taste
  def flavor(flavor)
    puts "#{flavor}"
  end
end

class Orange
  include Taste
end

class HotSauce
  include Taste
end



# The lookup chain for Orange
# Orange
# Taste
# Object
# Kernel
# BasicObject

# The lookup chain for HotSauce
# HotSauce
# Taste
# Object
# Kernel
# BasicObject

p Orange.ancestors
p HotSauce.ancestors

