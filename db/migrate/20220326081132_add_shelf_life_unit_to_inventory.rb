class AddShelfLifeUnitToInventory < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :shelf_life_unit, :integer
  end
end
