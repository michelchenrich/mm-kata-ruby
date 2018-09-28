class Invoice
  def initialize
    @items = InvoiceItems.new
  end

  def with_item(item)
    @items.push(item)
    self
  end

  def total_price(as_of_date)
    @items.total_price(as_of_date)
  end
end
