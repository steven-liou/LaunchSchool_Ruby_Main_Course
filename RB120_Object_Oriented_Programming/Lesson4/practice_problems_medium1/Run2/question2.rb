class InvoiceEntry
  attr_reader :quantity, :product_name
  attr_writer :quantity
  def initialize(product_name, number_purchased)
    @quantity = number_purchased
    @product_name = product_name
  end

  def update_quantity(updated_count)
    self.quantity = updated_count if updated_count >= 0
  end
end


