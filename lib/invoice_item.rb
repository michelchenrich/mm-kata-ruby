class InvoiceItem
  def initialize(bundle, arrival_date)
    @bundle = bundle
    @arrival_date = arrival_date
  end

  def bundle
    @bundle
  end

  def method_missing(method, *arguments)
    bundle.send(method, *arguments)
  end

  def arrived_by?(date)
    @arrival_date <= date
  end
end
