class CreateInventories < ActiveRecord::Migration[7.0]
  def change
    create_table :inventories do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.decimal :quantity, precision: 32, scale: 6
      t.references :unit, null: false, foreign_key: true
      t.datetime :in_stock_on
      t.datetime :produced_on
      t.integer :shelf_life
      t.datetime :expire_on

      t.timestamps
    end
  end
end
