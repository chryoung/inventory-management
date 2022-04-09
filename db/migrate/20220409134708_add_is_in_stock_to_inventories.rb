class AddIsInStockToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :is_in_stock, :boolean, null: false, default: true
  end
end
