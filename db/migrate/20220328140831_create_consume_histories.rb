class CreateConsumeHistories < ActiveRecord::Migration[7.0]
  def change
    create_table :consume_histories do |t|
      t.belongs_to :inventory, null: false, foreign_key: true
      t.date :consume_on
      t.decimal :quantity, precision: 32, scale: 6

      t.timestamps
    end
  end
end
