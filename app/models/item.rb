class Item < ApplicationRecord
  has_many :products
  validates :name, uniqueness: true
end
