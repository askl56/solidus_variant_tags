module Spree
  class SoldOutVariantTagCalculator < Spree::VariantTagCalculator
    def self.name
      'sold-out'
    end

    def self.presentation
      'Notify Me'
    end

    def self.applicable?(variant)
      unless variant.product.grid_items.any? { |grid_item| grid_item.display_separately? }
        !variant.product.variants_including_master.any? { |variant| variant.can_supply? }
      else
        !variant.can_supply?
      end
    end
  end
end
