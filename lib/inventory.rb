class Inventory
  def initialize(invoices, purchase_orders, currency)
    @invoices = invoices
    @purchase_orders = purchase_orders
    @currency = currency
  end

  def total_value(as_of_date)
    confirmed_value(as_of_date) + unconfirmed_value(as_of_date)
  end

  def confirmed_value(as_of_date)
    @invoices.total_price(as_of_date)
             .as(@currency)
  end

  def unconfirmed_value(as_of_date)
    @purchase_orders.unconfirmed_value(as_of_date)
                    .as(@currency)
  end
end
