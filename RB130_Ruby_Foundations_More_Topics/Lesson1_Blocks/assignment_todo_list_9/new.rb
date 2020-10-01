class TodoList

  def initialize
    @todos = []
  end

  def add(todo)
    raise TypeError, "Must be a Todo object" unless todo.instance_of?(Todo)
    @todos << todo
  end

  def each
    @todos.each do |todo|
       yield(todo)
    end
    self
  end

  def select
    result = self.class.new
    each { |todo| result.add(todo) if yield(todo) }
    result
  end
end

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done?
    done
  end

  def done!
    self.done = true
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")
list = TodoList.new

list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select {|todo| todo.done? }
puts results.inspect