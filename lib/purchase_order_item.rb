class PurchaseOrderItem < Decorator
  def initialize(bundle, expected_arrival_date)
    super(bundle)
    @bundle = bundle
    @expected_arrival_date = expected_arrival_date
    @checked_in = false
  end

  def expected_arrival_date
    @expected_arrival_date
  end

  def checked_in?
    @checked_in
  end

  def expected_until?(date)
    expected_arrival_date <= date
  end

  def check_in(date)
    @checked_in = true
    InvoiceItem.new(@bundle, date)
  end
end
