class Storage < ApplicationRecord
  validates :location, uniqueness: true
end
