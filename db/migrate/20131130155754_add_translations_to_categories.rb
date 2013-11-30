class AddTranslationsToCategories < ActiveRecord::Migration
  def change
    rename_column :categories, :name, :es_name
    rename_column :categories, :description, :es_description
    add_column :categories, :en_name, :string
    add_column :categories, :en_description, :text
    add_column :categories, :fr_name, :string
    add_column :categories, :fr_description, :text
  end
end
