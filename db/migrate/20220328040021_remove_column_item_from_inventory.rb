class RemoveColumnItemFromInventory < ActiveRecord::Migration[7.0]
  def up
    remove_column :inventories, :item_id
  end

  def down
    add_reference :inventories, :item, index: true
  end
end
