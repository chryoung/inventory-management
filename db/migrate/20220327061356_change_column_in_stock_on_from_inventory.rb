class ChangeColumnInStockOnFromInventory < ActiveRecord::Migration[7.0]
  def change
    change_column :inventories, :in_stock_on, :date, null: true
  end
end
