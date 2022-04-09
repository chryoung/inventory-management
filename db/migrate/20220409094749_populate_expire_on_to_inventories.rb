class PopulateExpireOnToInventories < ActiveRecord::Migration[7.0]
  def up
    Inventory.all.each do |inv|
      inv.expire_on = if inv.produced_on.blank? or inv.shelf_life.blank?
                        nil
                      elsif inv.Year?
                        inv.produced_on + inv.shelf_life.years
                      elsif inv.Month?
                        inv.produced_on + inv.shelf_life.months
                      else
                        inv.produced_on + inv.shelf_life.days
                      end
      inv.save!
    end
  end

  def down
    Inventory.all.each do |inv|
      inv.expire_on = nil
      inv.save!
    end
  end
end
