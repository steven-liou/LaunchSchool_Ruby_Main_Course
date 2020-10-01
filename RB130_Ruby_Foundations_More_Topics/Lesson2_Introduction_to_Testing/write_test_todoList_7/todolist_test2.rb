require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

require_relative 'todolist'

class TodoListTest < Minitest::Test
  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todo3, @list.last)
  end

  def test_shift
    assert_equal(@todo1, @list.shift)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    assert_equal(@todo3, @list.pop)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done?
    assert_equal(false, @list.done?)
    @list.done!
    assert_equal(true, @list.done?)
  end

  def test_type_error
    assert_raises(TypeError) { @list << "hello" }
    assert_raises(TypeError) { @list << 1 }
  end

  def test_shuffle
    new_task = Todo.new('')
    @todos << new_task
    @list << new_task
    assert_equal(@todos, @list.to_a )
  end

  def test_add
    new_task = Todo.new('')
    @todos << new_task
    @list << new_task
    assert_equal(@todos, @list.to_a)
  end

  def test_item_at
    assert_equal(@todos[1], @list.item_at(1))
    assert_raises(IndexError) { @list.item_at(100) }
  end

  def test_mark_done_at
    assert_raises(IndexError) { @list.mark_done_at(100) }
    @list.mark_done_at(0)
    assert_equal(true, @todo1.done?)
  end

  def test_mark_undone_at
    assert_raises(IndexError) { @list.mark_undone_at(100) }
    @todo1.done!
    assert_equal(true, @todo1.done?)
    @list.mark_undone_at(0)
    assert_equal(false, @todo1.done? )
  end

  def test_done!
    @list.done!
    assert_equal(true, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)
    assert_equal(true, @list.done?)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(100) }
    @list.remove_at(1)
    assert_equal([@todo1, @todo3], @list.to_a)
  end

  def test_to_s
    text = <<~Todolist.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    Todolist
    assert_equal(text, @list.to_s)
  end

  def test_to_s_2
    text = <<~Todolist.chomp
    ---- Today's Todos ----
    [ ] Buy milk
    [X] Clean room
    [ ] Go to gym
    Todolist
    @list.mark_done_at(1)
    assert_equal(text, @list.to_s)
  end

  def test_to_s_3
    text = <<~Todolist.chomp
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    Todolist
    @list.done!
    assert_equal(text, @list.to_s )
  end

  def test_each
    index = 0
    @list.each do |todo|
      assert_equal(@todos[index], todo)
      index += 1
    end
  end
  def test_each_return_value
    result = @list.each {}
    assert_same(@list, result)
  end

  def test_select
    @list.mark_done_at(1)
    result = @list.select { |todo| todo.done? }
    refute_equal(@list, result)
    refute_same(@list, result)
  end

  def test_find_by_title
    todo = @list.find_by_title('Buy milk')
    assert_equal(@todo1, todo)
    assert_nil(@list.find_by_title('hello'))
  end

  def test_all_done
    assert_equal([], @list.all_done.to_a)
    @list.mark_done_at(1)
    assert_equal([@todo2], @list.all_done.to_a)
    @list.done!
    assert_equal([@todo1, @todo2, @todo3], @list.all_done.to_a)
  end

  def test_all_not_done
    assert_equal([@todo1, @todo2, @todo3], @list.all_not_done.to_a)
    @list.mark_done_at(1)
    assert_equal([@todo1, @todo3], @list.all_not_done.to_a)
    @list.done!
    assert_equal([], @list.all_not_done.to_a)
  end

  def test_mark_done
    @list.mark_done('Buy milk')
    assert_equal(true, @todo1.done?)
  end

  def test_mark_all_done
    @list.mark_all_done
    assert_equal(@todos, @list.all_done.to_a)
  end

  def test_mark_all_undone
    @list.mark_all_done
    @list.mark_all_undone
    assert_equal(@todos, @list.all_not_done.to_a)
  end
end
