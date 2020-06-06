class InvoiceEntry

  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end

  private
  attr_accessor :quantity, :product_name

end

# fixing it this way would create public accessible setters for @quantity and @product_name, which shouldn't be available to public
# we can move them to private methods to prevent the quality control update_quantity method provides being bypassed by the user

