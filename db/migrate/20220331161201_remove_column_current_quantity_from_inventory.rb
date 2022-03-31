class RemoveColumnCurrentQuantityFromInventory < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventories, :current_quantity
  end
end
