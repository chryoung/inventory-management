class UpdateIsInStockForInventories < ActiveRecord::Migration[7.0]
  def up
    Inventory.all.each do |inv|
      inv.is_in_stock = inv.consume_histories.sum(:quantity) < inv.quantity
      inv.save!
    end
  end

  def down
    Inventory.all.each do |inv|
      inv.is_in_stock = false
      inv.save!
    end
  end
end
