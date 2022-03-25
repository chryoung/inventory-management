class DropTablePrices < ActiveRecord::Migration[7.0]
  def up
    drop_table :prices
  end

  def down
    create_table :prices do |t|
      t.decimal :price, null: false, default: 0, precision: 10, scale: 2
      t.datetime :record_on
      t.references :inventory, null: false, foreign_key: true

      t.timestamps
    end
  end
end
