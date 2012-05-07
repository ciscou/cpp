class AddDecorationCodeToProduct < ActiveRecord::Migration
  def change
    add_column :products, :decoration_code, :string
  end
end
