describe 'Inventory value' do
  let(:dollars) { Currency.new(:USD) }
  let(:today) { Date.today }
  let(:purchase_orders) { PurchaseOrders.new }
  let(:invoices) { Invoices.new }
  let(:inventory) { Inventory.new(invoices, purchase_orders, dollars) }

  context 'when there are no units' do
    it 'is zero' do
      expect(inventory.total_value(today)).to eq 0.as(dollars)
    end
  end

  context 'when there are units with expected arrival for yesterday' do
    it 'sums their value to the total value' do 
      order = PurchaseOrder.new
      order.with_item(1, Product.new("Name", 10.as(dollars)), today - 1)
      purchase_orders.push(order)

      expect(inventory.total_value(today)).to eq 10.as(dollars)
    end
  end

  context 'when there are units with expected arrival for today' do
    it 'sums their value to the total value' do 
      order = PurchaseOrder.new
      order.with_item(1, Product.new("Name", 10.as(dollars)), today)
      purchase_orders.push(order)
      invoices.push(order.check_in(today))

      expect(inventory.total_value(today)).to eq 10.as(dollars)
    end
  end
  
  context 'when there are units with expected arrival for tomorrow' do
    it 'does not sum their value to the total value' do 
      checked_in_order = PurchaseOrder.new
      checked_in_order.with_item(1, Product.new("Name", 10.as(dollars)), today)
      purchase_orders.push(checked_in_order)
      invoices.push(checked_in_order.check_in(today))

      order = PurchaseOrder.new
      order.with_item(1, Product.new("Name", 10.as(dollars)), today + 1)
      purchase_orders.push(order)

      expect(inventory.total_value(today)).to eq 10.as(dollars)
    end
  end
end
