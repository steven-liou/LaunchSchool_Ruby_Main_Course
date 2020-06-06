class Machine

  def start
    flip_switch(:on)
  end

  def stop
    flip_switch(:off)
  end



  def to_s
    "Bul is #{switch}"
  end

  private
  attr_writer :switch
  attr_reader :switch

  def flip_switch(desired_state)
    self.switch = desired_state
  end
end


bulb = Machine.new
bulb.start
puts bulb
 bulb.stop
puts bulb