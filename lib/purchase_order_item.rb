class PurchaseOrderItem
  def initialize(bundle, expected_arrival_date)
    @bundle = bundle
    @expected_arrival_date = expected_arrival_date
    @checked_in = false
  end

  def bundle
    @bundle
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

  def method_missing(method, *arguments)
    bundle.send(method, *arguments)
  end

  def check_in(date)
    @checked_in = true
    InvoiceItem.new(bundle, date)
  end
end
