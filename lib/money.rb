class Money
  def initialize(amount, currency)
    @amount = amount
    @currency = currency
  end

  def to_s
    "%s %.2f" % [@currency.code, @amount]
  end

  def inspect
    to_s
  end

  def ==(other)
    self.to_s == other.to_s
  end

  def *(multiplier)
    (@amount * multiplier).as(@currency)
  end

  def +(augend)
    augend.as(@currency).increase_by(@amount)
  end

  def increase_by(number)
    (@amount + number).as(@currency)
  end

  def as_currency(currency)
    self
  end

  def coerce(number)
    [self, number]
  end
end
