describe 'Money' do
  let(:dollars) { Currency.new(:USD) }
  it 'prints out the currency code followed by the amount with two decimals' do
    expect(Money.new(10, dollars).inspect).to eq("USD 10.00")
    expect(Money.new(10, dollars).to_s).to eq("USD 10.00")
  end
  it 'is equal another with same amount and currency' do
    expect(Money.new(10, dollars)).to eq(Money.new(10, dollars))
  end
  it 'is instantiated by numeric as currency' do
    expect(1.as(dollars)).to eq(Money.new(1, dollars))
  end
end
