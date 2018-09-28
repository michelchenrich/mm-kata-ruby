class InvoiceItem < Decorator
  def initialize(bundle, arrival_date)
    super(bundle)
    @arrival_date = arrival_date
  end

  def arrived_by?(date)
    @arrival_date <= date
  end
end
