describe 'Check in of purchase orders' do
  it 'does nothing' do
    dollars = Currency.new(:USD)
    today = Date.today
    order = PurchaseOrder.new
    order = order.with_item(1, Product.new("Name", 10.as(dollars)), today)
    invoice = order.to_invoice(today)

    order = order.outstanding_order(invoice: invoice)
  end
end
