RSpec.describe Spree::ProductsHelper, type: :helper do
  let(:product) do
    create(:product, master: create(:variant))
  end

  describe "tags_for" do
    context "with stock" do
      it do
        product.master.stock_items.first.set_count_on_hand(5)
        expect(helper.tags_for(product)).to be_blank
      end
    end

    context "with no stock" do
      it do
        product.variants_including_master.each do |variant|
          variant.stock_items.each do |stock_item|
            stock_item.backorderable = false
            stock_item.set_count_on_hand(0)
          end
        end

        expect(helper.tags_for(product)).to_not be_blank
      end
    end

    context "with 3 VariantTags" do
      it do
        variant = create(:variant_with_3_tags)
        product.master = variant
        expect(helper.tags_for(product)).to_not be_blank
      end
    end

    context "with variants" do
      let(:product) do
        create(:product_with_variants)
      end

      context "master and variants all have  0 stock" do
        it do
          product.variants_including_master.each do |variant|
            variant.stock_items.each do |stock_item|
              stock_item.backorderable = false
              stock_item.set_count_on_hand(0)
            end
          end

          expect(helper.tags_for(product)).to_not be_blank
        end
      end

      context "master has 0 stock but variants have stock" do
        it do
          product.master.stock_items.each do |stock_item|
            stock_item.set_count_on_hand(0)
          end

          product.variants.each do |variant|
            variant.stock_items.each do |stock_item|
              stock_item.set_count_on_hand(1)
            end
          end

          expect(helper.tags_for(product)).to be_blank
        end
      end
    end

  end

end
