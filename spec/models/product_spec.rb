RSpec.describe Spree::Product, type: :model do
  context "Product with no tags" do
    it do
      product = build(:product)

      expect(product).to respond_to(:variant_tags)
    end
  end
end
