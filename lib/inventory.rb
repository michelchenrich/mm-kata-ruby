class Inventory
  def initialize(invoices, purchase_orders, currency)
    @invoices = invoices
    @purchase_orders = purchase_orders
    @currency = currency
  end

  def currency
    @currency
  end

  def total_value(as_of_date)
    confirmed_value(as_of_date) + unconfirmed_value(as_of_date)
  end

  def confirmed_value(as_of_date)
    @invoices.flat_map(&:items)
              .select { |item| item.arrived_by? as_of_date }
              .map(&:total_price)
              .reduce(&:+)
              .as(currency)
  end

  def unconfirmed_value(as_of_date)
    @purchase_orders.flat_map(&:items)
                    .select { |item| not item.checked_in? }
                    .select { |item| item.expected_until? as_of_date }
                    .map(&:total_price)
                    .reduce(&:+)
                    .as(currency)
  end
end
