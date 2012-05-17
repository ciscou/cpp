class RemoveDecorationsMaskFromCategories < ActiveRecord::Migration
  def up
    remove_column :categories, :decorations_mask
  end

  def down
    add_column :categories, :decorations_mask, :string
  end
end
