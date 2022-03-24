class Inventory < ApplicationRecord
  belongs_to :item
  belongs_to :unit
  belongs_to :storage
  has_one :price
end
