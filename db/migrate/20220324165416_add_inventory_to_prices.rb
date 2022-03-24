class AddInventoryToPrices < ActiveRecord::Migration[7.0]
  def change
    add_reference :prices, :inventory, null: false, foreign_key: true
  end
end
