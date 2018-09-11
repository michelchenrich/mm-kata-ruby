class PurchaseOrderItem
  def initialize(bundle, expected_arrival_date)
    @bundle = bundle
    @expected_arrival_date = expected_arrival_date
  end

  def bundle
    @bundle
  end
end
