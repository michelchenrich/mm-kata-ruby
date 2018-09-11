class Numeric
  def as_currency(currency)
    Money.new(self, currency)
  end
end
