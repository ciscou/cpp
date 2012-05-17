class AddDecorationTagToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :decoration_tag, :string
  end
end
