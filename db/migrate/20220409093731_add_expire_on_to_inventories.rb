class AddExpireOnToInventories < ActiveRecord::Migration[7.0]
  def change
    add_column :inventories, :expire_on, :date
  end
end
