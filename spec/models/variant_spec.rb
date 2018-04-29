RSpec.describe Spree::Variant, type: :model do
  context "with no VariantTags" do
    let(:variant) do
      build(:variant)
    end

    it do
      expect(variant.variant_tags.length).to eq(0)
    end

    it 'sets the sold out tag' do
      expect(variant.in_stock?).to eq(false)
      expect(variant.auto_tags.find{ |v| v[:name] == 'sold-out' }).to be
    end

  end

  context "with 3 VariantTags" do
    let :variant do
      create :variant_with_3_tags
    end

    it do
      expect(variant.variant_tags.length).to eq(3)
    end

    it 'has all tags' do
      expect(variant.all_tags.length).to eq(4)
    end
  end

  context "with inventory" do
    let :variant do
      create :base_variant
    end

    before do
      variant.stock_items.first.set_count_on_hand(5)
    end

    it do
      expect(variant.auto_tags.find{ |v| v[:name] == 'sold-out' }).to eq(nil)
      expect(variant.all_tags.find{ |v| v[:name] == 'sold-out' }).to eq(nil)
    end
  end
end
