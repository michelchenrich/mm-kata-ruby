class PurchaseOrderItem
  def initialize(bundle, expected_arrival_date)
    @bundle = bundle
    @expected_arrival_date = expected_arrival_date
  end

  def bundle
    @bundle
  end

  def expected_arrival_date
    @expected_arrival_date
  end

  def expected_until?(date)
    expected_arrival_date <= date
  end

  def method_missing(method, *arguments)
    bundle.send(method, *arguments)
  end
end
