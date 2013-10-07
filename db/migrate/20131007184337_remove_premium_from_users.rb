class RemovePremiumFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :premium
  end

  def down
    add_column :users, :premium, :boolean, default: false
  end
end
