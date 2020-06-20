=begin

Input :

Output :

Rules
  Listen for something, and if anything is said, record it for later use
  Else, then do not record anything

Data structure / Algorithms


=end

class Device
  def initialize
    @recordings = []
  end

  def listen
    return unless block_given?
    record(yield())
  end

  def play
    puts @recordings.last
  end

  private
  def record(recording)
    @recordings << recording
  end
end


listener = Device.new
listener.listen { "Hello World!" }
listener.listen
listener.play # Outputs "Hello World!"
