FactoryGirl.define do
  factory :product_with_variants, class: Spree::Product, parent: :product do
    transient do
      variant_count 3
    end

    after(:create) do |product, evaluator|
      product.variants = create_list :variant, evaluator.variant_count
    end
  end
end
