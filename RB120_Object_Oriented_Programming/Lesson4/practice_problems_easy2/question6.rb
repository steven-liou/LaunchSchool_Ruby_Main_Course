class Television
  def self.manufacturer
  end

  def model
  end
end

# manufacturer is a class method because it is defined on the class object using the self keyword
# This particular Television instance of class Class has a singleton method manufacturer

# You can call a class method by invoking the method on the class name

# Television.manufacturer