class ChangeColumnProductIdToInventories < ActiveRecord::Migration[7.0]
  def up
    change_column :inventories, :product_id, :bigint, null: false
  end

  def down
    change_column :inventories, :product_id, :bigint, null: true
  end
end
