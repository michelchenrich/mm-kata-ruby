class Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def amount
    @amount
  end

  def currency
    @currency
  end

  def to_s
    "%s %.2f" % [currency.code, amount]
  end

  def inspect
    to_s
  end

  def == other
    amount == other.amount && currency == other.currency
  end

  def * multiplier
    (amount * multiplier).as(currency)
  end

  def + augend
    (amount + augend.as(currency).amount).as(currency)
  end

  def as_currency(currency)
    self
  end
end
