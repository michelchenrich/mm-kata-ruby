describe 'Inventory value' do
  let(:dollars) { Currency.new(:USD) }
  let(:today) { Date.today }
  let(:purchase_orders) { PurchaseOrders.new }
  let(:inventory) { Inventory.new(purchase_orders, dollars) }

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

      expect(inventory.total_value(today)).to eq 10.as(dollars)
    end
  end
  
  context 'when there are units with expected arrival for tomorrow' do
    it 'does not sum their value to the total value' do 
      order = PurchaseOrder.new
      order.with_item(1, Product.new("Name", 10.as(dollars)), today)
      order.with_item(1, Product.new("Name", 10.as(dollars)), today + 1)
      purchase_orders.push(order)

      expect(inventory.total_value(today)).to eq 10.as(dollars)
    end
  end
end
