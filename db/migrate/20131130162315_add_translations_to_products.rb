class AddTranslationsToProducts < ActiveRecord::Migration
  def change
    rename_column :products, :name, :es_name
    rename_column :products, :description, :es_description
    add_column :products, :en_name, :string
    add_column :products, :en_description, :text
    add_column :products, :fr_name, :string
    add_column :products, :fr_description, :text
  end
end
