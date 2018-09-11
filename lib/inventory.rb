class Inventory
  def initialize(currency)
    @currency = currency
  end

  def currency
    @currency
  end

  def total_value(as_of_date)
    0.as(currency)
  end
end
