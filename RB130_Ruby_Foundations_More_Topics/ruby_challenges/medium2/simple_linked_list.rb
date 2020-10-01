class SimpleLinkedList
  attr_accessor :head


  def self.from_a(array)
    return new unless array
    array.reverse_each.with_object(new) do |ele, list|
      list.push(ele)
    end
  end

  def push(number)
    self.head = Element.new(number, head)
  end


  def size(current_element= head)
    return 0 unless current_element
    return 1 if current_element.tail?
    1 + size(current_element.next)
  end

  def empty?
    size == 0
  end

  def peek
    head&.datum
  end

  def pop
    element = peek
    self.head = head.next
    element
  end

  def to_a(current_ele=head)
    return [] unless current_ele
    return [current_ele.datum] unless current_ele.next
    [current_ele.datum] + to_a(current_ele.next)
  end

  def reverse
    current_ele=head
    reverse_list = SimpleLinkedList.new

    loop do
      reverse_list.push(current_ele.datum)
      current_ele = current_ele.next
      break unless current_ele
    end
    reverse_list
  end
end



class Element
  attr_reader :datum
  attr_accessor :next

  def initialize(datum, next_ele=nil)
    @datum = datum
    self.next = next_ele
  end

  def tail?
    !self.next
  end
end