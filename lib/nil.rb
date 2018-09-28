class NilClass
  def as_currency(currency)
    0.as(currency)
  end

  def + other
    other
  end
end
