class InvoiceItems < Array
  def total_price(as_of_date)
    self.select_arrived_by(as_of_date)
        .sum(&:total_price)
  end

  def select_arrived_by(as_of_date)
    self.select { |item| item.arrived_by? as_of_date }
  end
end
