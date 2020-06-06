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

  private
  attr_reader :todos
end




list = TodoList.new("Today's Todos")
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

# add
list.add(todo1)                 # adds todo1 to end of list, returns list
list.add(todo2)                 # adds todo2 to end of list, returns list
list << todo3                # adds todo3 to end of list, returns list
# list.add(1)                     # raises TypeError with message "Can only add Todo objects"

p list.size
p list.first
p list.last
p list.to_a
p list.done?

# p list.item_at
p list.item_at(1)
# p list.item_at(100)

list.mark_done_at(1)
puts list
list.mark_undone_at(1)
puts list

list.done!
puts list
p list.done?

list.remove_at(1)
puts list
