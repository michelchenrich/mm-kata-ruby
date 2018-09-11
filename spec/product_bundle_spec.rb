describe ProductBundle do
  let(:dollars) { Currency.new(:USD) } 
  let(:product) { Product.new("Name", 10.as(dollars)) }
  let(:bundle) { ProductBundle.new(product, 10) }
  
  context 'of 10 units of a product named Name, costing USD 10.00 each' do
    it 'has same name as the product' do
      expect(bundle.name).to eq(product.name)
    end

    it 'has same unitary price as the product' do
      expect(bundle.unitary_price).to eq(product.unitary_price)
    end

    it 'has the total of unitary price multiplied by quantity' do
      expect(bundle.total_price).to eq(100.as(dollars))
    end
  end
end
