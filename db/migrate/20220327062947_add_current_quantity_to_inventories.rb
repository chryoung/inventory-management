class AddCurrentQuantityToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :current_quantity, :decimal, precision: 32, scale: 6
  end
end
