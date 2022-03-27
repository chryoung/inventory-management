class CopyQuantityToCurrent < ActiveRecord::Migration[7.0]
  def up
    Inventory.all.each do |i|
      if i.current_quantity.nil?
        i.current_quantity = i.quantity
        i.save!
      end
    end
  end

  def down
    Inventory.all.each do |i|
      if i.current_quantity == i.quantity
        i.current_quantity = nil
        i.save!
      end
    end
  end
end
