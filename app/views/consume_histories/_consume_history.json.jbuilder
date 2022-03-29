json.extract! consume_history, :id, :inventory_id, :consume_on, :quantity, :created_at, :updated_at
json.url consume_history_url(consume_history, format: :json)
