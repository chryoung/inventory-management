class ChangeColumnProducedOnFromInventory < ActiveRecord::Migration[7.0]
  def change
    change_column :inventories, :produced_on, :date, null: true
  end
end
