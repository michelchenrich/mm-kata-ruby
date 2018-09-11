describe 'Inventory value' do
  context 'when there are no units' do
    it 'is zero' do
      dollars = Currency.new(:USD)
      inventory = Inventory.new dollars
      today = Date.today
      expect(inventory.total_value(today)).to eq 0.as(dollars)
    end
  end
end
