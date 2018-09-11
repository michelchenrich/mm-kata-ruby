describe 'Inventory value' do
  context 'when there are no units' do
    it 'is zero' do
      inventory = Inventory.new
      today = Date.today
      dollars = Currency.new(:USD)
      expect(inventory.total_value(today)).to eq 0.as(dollars)
    end
  end
end
