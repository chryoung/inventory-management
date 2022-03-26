require 'bigdecimal'
require 'bigdecimal/util'

class Inventory < ApplicationRecord
  belongs_to :item
  belongs_to :unit
  belongs_to :storage

  enum shelf_life_unit: {
    "Year" => 1,
    "Month" => 2,
    "Day" => 3
  }

  validates :shelf_life_unit, inclusion: shelf_life_units.keys

  def total_price
    unless price.nil? or quantity.nil?
      price * quantity
    else
      0
    end
  end

  def total_price=(value)
    unless quantity.nil? or quantity == 0
      price = value.to_d / quantity
    else
      price = value.to_d
      quantity = 1
    end
  end

  def expire_on
    if Year?
      produced_on + shelf_life.years
    elsif Month?
      produced_on + shelf_life.months
    else
      produced_on + shelf_life.days
    end
  end

end
