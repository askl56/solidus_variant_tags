FactoryBot.define do
  factory :variant_with_3_tags, class: Spree::Variant, parent: :variant do
    transient do
      variant_tags_count 3
    end

    after(:create) do |variant, evaluator|
      variant.variant_tags = create_list :variant_tag, evaluator.variant_tags_count
      variant.stock_items.each do |stock_item|
        stock_item.backorderable = false
        stock_item.save
      end
    end
  end
end
