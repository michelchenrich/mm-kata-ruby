class Currency
  def initialize(code)
    @code = code
  end

  def new_from(monetary_amount)
    Money.new(monetary_amount, self)
  end

  def code
    @code
  end
end
