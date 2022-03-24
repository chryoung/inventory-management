json.extract! inventory, :id, :Item_id, :Quantity, :Unit_id, :InStockOn, :ProducedOn, :ShelfLife, :ExpireOn, :created_at, :updated_at
json.url inventory_url(inventory, format: :json)
