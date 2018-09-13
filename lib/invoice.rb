class Invoice
  def initialize
    @items = []
  end

  def items
    @items
  end

  def with_item(item)
    @items.push(item)
    self
  end
end
