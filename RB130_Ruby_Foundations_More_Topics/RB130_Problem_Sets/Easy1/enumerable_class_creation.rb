class Tree
  include Enumerable

  # each is required for Enumerable module to traverse your collection object
  def each
  end

  # the <=> method is necessary for Enumerable module to compare 'values' in your collection object
  def <=>
  end

end