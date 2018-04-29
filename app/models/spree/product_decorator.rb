Spree::Product.class_eval do
  Spree::PermittedAttributes.product_attributes.concat [:variant_tag_ids]

  delegate :variant_tags, :variant_tag_ids, :all_tags, to: :master
end
