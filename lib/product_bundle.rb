class ProductBundle < Decorator
  def initialize(product, quantity)
    super(product)
    @quantity = quantity
  end

  def total_price
    unitary_price * quantity
  end

  def quantity
    @quantity
  end
end
