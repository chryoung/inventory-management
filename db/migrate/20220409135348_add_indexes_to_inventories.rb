class AddIndexesToInventories < ActiveRecord::Migration[7.0]
  def change
    add_index :inventories, :expire_on
    add_index :inventories, :is_in_stock
  end
end
