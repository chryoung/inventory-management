class AddIndexToInventory < ActiveRecord::Migration[7.0]
  def change
    add_index :inventories, [:in_stock_on, :produced_on]
  end
end
