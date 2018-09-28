class PurchaseOrderItems < Array
  def unconfirmed_value(as_of_date) 
    self.select_unconfirmed
        .select_expected_until(as_of_date)
        .sum(&:total_price)
  end

  def select_unconfirmed
    self.select { |item| not item.checked_in? }.as(PurchaseOrderItems)
  end

  def select_expected_until(as_of_date)
    self.select { |item| item.expected_until? as_of_date }
  end

  def self.new_from(array)
    self.new.push(*array) 
  end
end
