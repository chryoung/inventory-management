json.extract! inventory, :id, :quantity, :unit_id, :in_stock_on, :produced_on, :shelf_life, :shelf_life_unit, :expire_on, :created_at, :updated_at

json.product do
  json.id inventory.product_id
  json.url product_url(inventory.product, format: :json)
end

json.url inventory_url(inventory, format: :json)

