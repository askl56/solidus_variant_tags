Deface::Override.new(
  virtual_path: "spree/admin/products/_form",
  insert_bottom: "[data-hook='admin_product_form_right']",
  partial: "spree/shared/variant_tag_form_field",
  name: "add_variant_tag_to_admin_product_form",
  original: "ecd2eac435e5855155fee3689ec6f872d381e899"
)
Deface::Override.new(
  virtual_path: "spree/admin/variants/_form",
  insert_after: "[data-hook='tax_category']",
  partial: "spree/shared/variant_tag_form_field",
  name: "add_variant_tag_to_admin_variant_form",
  original: "ecd2eac435e5855155fee3689ec6f872d381e899"
)
