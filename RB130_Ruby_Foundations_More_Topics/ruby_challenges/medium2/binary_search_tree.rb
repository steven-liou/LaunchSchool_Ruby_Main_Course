=begin
Rule
  each binary tree node has a value, a reference to a left node whose value is smaller than iself. It also has a reference to a right node whose value is greater than itself

Algorithm :
  Insert a value into the binary search tree
    create a new node with the new value
    - first determine if the new value is smaller or larger than the current node's value
      - if it is smaller, and the left node is nil, add the new node as left node
      else, set the current node to its left node
      - if it is larger, and the right node is nil, add the new node as right node
      else, set the current node ot its right node

  Implment the each method
    set the current node to caller object
    - while the current node has a left node, set the current node to its left node
=end

class Bst
  attr_reader :data
  attr_accessor :left, :right

  def initialize(data)
    @data = data
    @left = nil
    @right = nil
  end

  # def insert(value)
  #   new_node = Bst.new(value)
  #   insert_node = find_insert_node(value)
  #   if value <= insert_node.data
  #     insert_node.left = new_node
  #   else
  #     insert_node.right = new_node
  #   end
  # end

  def insert(value)
    new_node = Bst.new(value)
    current_node = self

    loop do
      if value <= current_node.data
        if current_node.left
          current_node = current_node.left
        else
          current_node.left = new_node
          break
        end
      else
        if current_node.right
          current_node = current_node.right
        else
          current_node.right = new_node
          break
        end
      end
    end
  end

  def find_insert_node(value)
    if value <= data
      left ? left.find_insert_node(value) : self
    else
      right ? right.find_insert_node(value) : self
    end
  end

  def each(&block)
    return to_enum(:each) unless block_given?

    left&.each(&block)
    yield(data)
    right&.each(&block)
  end


end


