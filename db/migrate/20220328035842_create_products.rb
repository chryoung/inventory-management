class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.string :variant

      t.timestamps
    end
  end
end
