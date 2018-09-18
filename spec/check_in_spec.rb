describe 'Check in of purchase orders' do
  it 'does nothing' do
    dollars = Currency.new(:USD)
    today = Date.today
    order = PurchaseOrder.new
    order = order.with_item(1, Product.new("Name", 10.as(dollars)), today)
    invoice = order.to_invoice(today)
    expect(invoice.items.count).to eq 1
    expect(invoice.items[0].arrived_by?(today)).to be true

    order = order.outstanding_order(invoice: invoice)
  end
end
