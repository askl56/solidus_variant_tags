module Spree
  class VariantTagCalculator

    def self.name
      'computed-tag'
    end

    def self.presentation
      'Computed Tag'
    end

    def self.applicable?(variant)
      raise NotImplementedError
    end

  end
end
