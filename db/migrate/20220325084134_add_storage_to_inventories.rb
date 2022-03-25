class AddStorageToInventories < ActiveRecord::Migration[7.0]
  def change
    add_reference :inventories, :storage, null: false, foreign_key: true, default: 1
  end
end
