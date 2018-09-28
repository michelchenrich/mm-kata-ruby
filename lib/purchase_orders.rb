class PurchaseOrders < Array
  def unconfirmed_value(as_of_date)
    self.map { |purchase_order| purchase_order.unconfirmed_value(as_of_date) }
        .reduce(&:+)
  end
end
