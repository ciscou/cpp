class AddDecorationsMaskToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :decorations_mask, :string
  end
end
