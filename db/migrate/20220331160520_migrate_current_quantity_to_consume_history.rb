class MigrateCurrentQuantityToConsumeHistory < ActiveRecord::Migration[7.0]
  def up
    Inventory.all.each do |i|
      consumed_based_on_current_quantity = i.quantity - i.current_quantity
      if consumed_based_on_current_quantity > i.total_consumption
        ch = i.consume_histories.build consume_on: Date.today, quantity: consumed_based_on_current_quantity
        ch.save!
      end

      i.current_quantity = 0
      i.save!
    end
  end

  def down
    Inventory.all.each do |i|
      i.current_quantity = i.quantity - i.total_consumption
      i.consume_histories.destroy_all
      i.save!
    end
  end
end
