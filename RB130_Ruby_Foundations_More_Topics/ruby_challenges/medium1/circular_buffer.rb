=begin

Input :

Output :

Rules
  - The first element goes into the middle index of the array
  new elements are added after the last index being added to
  - The user removes the elements at "oldest" index
  - if the slots are all occupied, then the user must remove the elements at the "oldest" index

Data structure / Algorithms


=end



class CircularBuffer
  attr_accessor :buffer, :read_index, :write_index

  def initialize(size)
    @buffer = Array.new(size)
    @read_index = 0
    @write_index = 0
  end

  def read
    raise BufferEmptyException, "Buffer is empty!" unless buffer[read_index]
    value = buffer[read_index]
    buffer[read_index] = nil
    self.read_index = next_index(read_index)
    value
  end

  def write(value)
    return unless value
    if buffer[write_index]
      raise BufferFullException
    else
      buffer[write_index] = value
      self.write_index = next_index(write_index)
    end
  end

  def write!(value)
      return unless value
      buffer[write_index] = value
      self.write_index = next_index(write_index)
      self.read_index = write_index
  end

  def next_index(index)
    (index + 1) % buffer.size
  end

  def clear
    self.buffer = Array.new(buffer.size)
    self.read_index = 0
    self.write_index = 0
  end

  class BufferEmptyException < StandardError
  end
  class BufferFullException < StandardError
  end

end

