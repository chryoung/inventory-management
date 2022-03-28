class MoveItemReferenceToProduct < ActiveRecord::Migration[7.0]
  def up
    ActiveRecord::Base.connection.execute(
      'UPDATE inventories
       SET product_id = (SELECT id from products WHERE products.item_id = inventories.item_id)')
       
  end

  def down
    ActiveRecord::Base.connection.execute(
      'UPDATE inventories
       SET item_id = (SELECT item_id FROM products WHERE products.id = inventories.product_id)')
  end
end
