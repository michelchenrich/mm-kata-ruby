class PurchaseOrder
  def initialize
    @items = []
  end

  def items
    @items
  end

  def with_item(quantity, product, expected_arrival_date)
    bundle = ProductBundle.new(product, quantity)
    items.push(PurchaseOrderItem.new(bundle, expected_arrival_date))
  end
end
