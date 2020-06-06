# have an index that tracks the oldest position
  # When an item is removed, it should be removed at the oldest position
  # update the oldest position by incrementing it by 1
# have an index that tracks the newest position
# if the queue is full, remove the item on oldest position, and increment oldest position by 1
  # Each new item is added, update the new position by incrementing its index by 1

# the new index is the (current_idx + 1 ) % size_array

class CircularQueue
  attr_reader :queue
  attr_accessor :old_index, :new_index
  def initialize(size)
    @queue = Array.new(size)
    @old_index = 0
    @new_index = 0
  end

  def enqueue(value)
    dequeue if queue_full?
    queue[new_index] = value
    self.new_index = increment_index(new_index)
  end

  def dequeue
    old_value = queue[old_index]
    queue[old_index] = nil
    self.old_index = increment_index(old_index) if old_value
    old_value
  end

  private
  def index_empty?
    queue[new_index].nil?
  end

  def queue_full?
    queue.none?(nil)
  end

  def increment_index(index)
    (index + 1) % queue.size
  end
end

queue = CircularQueue.new(3)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil