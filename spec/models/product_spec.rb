RSpec.describe Spree::Product, type: :model do
  context "Product with no tags" do
    it do
      product = build(:product)

      expect(product).to respond_to(:variant_tags)
    end
    it 'can be assigned to' do
      product = create(:product)
      tag = create(:variant_tag)
      product.variant_tags = [tag]
      product.save
      product.reload
      expect(product.variant_tags.first).to eq(tag)
    end
  end
end
