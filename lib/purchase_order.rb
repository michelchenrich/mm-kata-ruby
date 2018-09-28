class PurchaseOrder
  def initialize
    @items = PurchaseOrderItems.new 
  end

  def with_item(quantity, product, expected_arrival_date)
    bundle = ProductBundle.new(product, quantity)
    @items.push(PurchaseOrderItem.new(bundle, expected_arrival_date))
    self
  end

  def check_in(date)
    to_invoice(date)
  end

  def to_invoice(date)
    @items.map { |item| item.check_in(date) }
          .reduce(Invoice.new, &:with_item) 
  end

  def outstanding_order(invoice)
    
  end

  def unconfirmed_value(as_of_date)
    @items.unconfirmed_value(as_of_date)
  end
end
