class RemoveExpireOnFromInventory < ActiveRecord::Migration[7.0]
  def change
    remove_column :inventories, :expire_on, :datetime
  end
end
