class Television
  def self.manufacturer
  end

  def model
  end
end

tv = Television.new
# tv.manufacturer  # NomethodError because manufacturer is a class method
# Television.model # NomethodError becuase model is an instance method