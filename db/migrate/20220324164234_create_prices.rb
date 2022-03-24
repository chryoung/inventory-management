class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.decimal :price, null: false, default: 0, precision: 10, scale: 2
      t.datetime :record_on

      t.timestamps
    end
  end
end
