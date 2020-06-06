class Oracle
  def predict_the_future
    "You will " + choices.sample
  end

  def choices
    ["eat a nice lunch", "take a nap soon", "stay at work late"]
  end
end

class RoadTrip < Oracle
  def choices
    ["visit Vegas", "fly to Fiji", "ramp in Rome"]
  end
end


# Since RoadTrip inherits from Oracle class, and it overrides the choices instance method, the predict_the_future in the Oracle class will call the choices method in Roundtrip class instead

# Ruby will first lookup the definition for choices in the class that the object belongs to, then continue up the inheritance hierarchy tree

trip = RoadTrip.new
p trip.predict_the_future
