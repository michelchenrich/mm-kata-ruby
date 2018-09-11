class Currency
  def initialize(code)
    @code = code
  end

  def new_from(monetary_amount)
    monetary_amount.as_currency(self)
  end

  def code
    @code
  end
end
