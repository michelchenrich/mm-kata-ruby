class Inventory
  def initialize(invoices, purchase_orders, currency)
    @inventories = [invoices.clone.extend(ValuatableInvoices),
                    purchase_orders.clone.extend(ValuatablePurchaseOrders)]
    @currency = currency
  end

  def total_value(as_of_date)
    @inventories.map { |inventory| inventory.value(as_of_date) }
                .map { |value| value.as(@currency) }
                .sum
  end
end
