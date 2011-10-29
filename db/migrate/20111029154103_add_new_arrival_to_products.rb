class AddNewArrivalToProducts < ActiveRecord::Migration
  def change
    add_column :products, :new_arrival, :boolean, :default => false
  end
end
