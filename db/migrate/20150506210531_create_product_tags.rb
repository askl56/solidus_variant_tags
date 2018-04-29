class CreateProductTags < ActiveRecord::Migration
  def change
    create_table :spree_variant_tags do |t|
      t.string :name
      t.string :presentation
    end

    create_table :spree_variant_tags_variants do |t|
      t.references :variant
      t.references :variant_tag
      t.index [ :variant_id, :variant_tag_id ], name: 'variant_id_tag_id_index'
    end
  end
end
