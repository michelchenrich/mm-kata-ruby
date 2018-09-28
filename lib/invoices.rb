class Invoices < Array
  def total_price(as_of_date)
    self.map { |invoice| invoice.total_price(as_of_date) }
        .reduce(&:+)
  end
end
