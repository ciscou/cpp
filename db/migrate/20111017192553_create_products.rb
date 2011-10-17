class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.references :category
      t.string :name
      t.text :description
      t.string :picture

      t.timestamps
    end
    add_index :products, :category_id
  end
end
