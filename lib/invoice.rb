class Invoice
  def initialize
    @items = []
  end

  def with_item(item)
    @items.push(item)
    self
  end

  def total_price(as_of_date)
    @items.select { |item| item.arrived_by? as_of_date }
          .map(&:total_price)
          .reduce(&:+)
  end
end
