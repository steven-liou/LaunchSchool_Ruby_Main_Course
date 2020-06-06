# To allow Enumerable module mixins to traverse your collection, the class must provide a method each, which yields successive members of the collection

# If comparison methods of Enumerable module is used, then the class must also supply a meaningful <=> operator for ordering between members of the collection

class Tree
  include Enumerable

  def each
  end

  def <=>
  end
end