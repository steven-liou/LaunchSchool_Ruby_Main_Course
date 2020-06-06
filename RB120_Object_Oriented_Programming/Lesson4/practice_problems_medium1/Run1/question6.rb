class Computer
  attr_accessor :template

  def create_template
    @template = "template 14231"
  end

  def show_template
    template
  end
end

class Computer
  attr_accessor :template

  def create_templse
    self.template = "template 14231"
  end

  def show_template
    self.template
  end
end

=begin

The two ways achieve the same results
First implementation on line 5, we directly access the instance variable @template
IN second implementation, we instead uses the setter method for @template

Both implementation use the getter methods on line 9, so they are the same
Ruby guide suggests to avoid using self keyword if not needed (first implmeentation is more concise)