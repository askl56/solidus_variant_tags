module Spree
  class SoldOutVariantTagCalculator < Spree::VariantTagCalculator
    def self.name
      'sold-out'
    end

    def self.presentation
      'Sold Out'
    end

    def self.applicable?(variant)
      if variant.is_master?
        variant.product.variants_including_master.reduce(true) { |all_cannot_supply, variant| all_cannot_supply && !variant.can_supply? }
      else
        !variant.can_supply?
      end
    end
  end
end
