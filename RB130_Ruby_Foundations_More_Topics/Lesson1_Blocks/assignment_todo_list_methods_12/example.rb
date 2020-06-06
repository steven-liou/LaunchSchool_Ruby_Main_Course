# implement TodoList methods

# This class represents a todo item and its associated
# data: name and description. There's also a "done"
# flag to show whether this todo item is done.

class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end

  def ==(otherTodo)
    title == otherTodo.title &&
      description == otherTodo.description &&
      done == otherTodo.done
  end
end


# This class represents a collection of Todo objects.
# You can perform typical collection-oriented actions
# on a TodoList object, including iteration and selection.
class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(todo)
    raise TypeError, "Can only add Todo objects" unless todo.instance_of? Todo
    todos << todo
  end
  alias_method(:<<, :add)


  def size
    todos.size
  end

  def first
    todos.first
  end

  def last
    todos.last
  end

  def item_at(index)
    todos.fetch(index)
  end

  def to_a
    todos.clone
  end

  def done?
    todos.all?(&:done?)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    todos.each(&:done!)
  end

  def shift
    todos.shift
  end

  def pop
    todos.pop
  end

  def remove_at(index)
    todos.delete(item_at(idx))
  end

  def to_s
    items_list = todos.reduce("") {|acc, todo| acc + todo.to_s + "\n"}
    "---- #{title} ----\n" + items_list
  end


  def each
    counter = 0

    while counter < todos.size
      yield(item_at(counter))
      counter += 1
    end
    self
  end

  def select
    new_todo = TodoList.new(title)
    each {|item| new_todo << item if yield(item) }
    new_todo
  end

  def find_by_title(search_title)
    select {|todo| todo.title == search_title}.first
  end

  def all_done
    select {|todo| todo.done?}
  end

  def all_not_done
    select {|todo| !todo.done? }
  end

  def mark_done(mark_title)
    find_by_title(mark_title) && find_by_title(title).done!  # only mark the Todo as done if found, using && short circuit
  end

  def mark_all_done
    each {|todo| todo.done!}
  end

  def mark_all_undone
    each(&:undone!)
  end

  private
  attr_reader :todos
end


todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")
list.add(todo1)
list.add(todo2)
list.add(todo3)

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect
puts results.class

