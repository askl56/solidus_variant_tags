Spree::Variant.class_eval do
  has_and_belongs_to_many :variant_tags, class_name: 'Spree::VariantTag', join_table: :spree_variant_tags_variants, autosave: true

  mattr_accessor :auto_tag_calculators
  self.auto_tag_calculators = [ Spree::SoldOutVariantTagCalculator ]

  def auto_tags
    self.auto_tag_calculators.select{ |t| t.applicable?(self) }.map do |t|
      { name: t.name, presentation: t.presentation }
    end
  end

  def all_tags
    auto_tags.concat variant_tags.map{ |v| { name: v.name, presentation: v.presentation } }
  end
end
