Spree::ProductsHelper.class_eval do
  def tags_for(product)
    h = []

    product.all_tags.map do |tag|
      h << content_tag(:div, tag[:presentation].mb_chars, class: "variant-tag variant-tag--#{tag[:name]}")
    end

    h.join("\n").html_safe
  end
end
