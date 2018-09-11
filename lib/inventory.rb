class Inventory
  def initialize(purchase_orders, currency)
    @purchase_orders = purchase_orders
    @currency = currency
  end

  def currency
    @currency
  end

  def total_value(as_of_date)
    @purchase_orders.flat_map(&:items)
                    .map(&:bundle)
                    .map(&:total_price)
                    .reduce(0.as(currency), &:+)
  end
end
