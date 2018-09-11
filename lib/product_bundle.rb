class ProductBundle
  def initialize(product, quantity)
    @product = product
    @quantity = quantity
  end

  def method_missing(method, *arguments)
    @product.send(method, *arguments)
  end
  
  def total_price
    unitary_price * quantity
  end

  def quantity
    @quantity
  end
end
