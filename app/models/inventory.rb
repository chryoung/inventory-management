require 'bigdecimal'
require 'bigdecimal/util'

class Inventory < ApplicationRecord
  belongs_to :product
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
      (price * quantity).round(2)
    else
      0
    end
  end

  def total_price=(value)
    unless quantity.nil? or quantity == 0
      self.price = value.to_d / quantity
    else
      self.price = value.to_d
      self.quantity = 1
    end
  end

  def quantity_number
    if quantity.to_i.to_d == quantity
      return quantity.to_i
    end

    return quantity
  end

  def current_quantity_number
    if current_quantity.to_i.to_d == current_quantity
      return current_quantity.to_i
    end

    return current_quantity
  end

  def expire_on
    unless produced_on.nil? or shelf_life.nil?
      if Year?
        return produced_on + shelf_life.years
      elsif Month?
        return produced_on + shelf_life.months
      else
        return produced_on + shelf_life.days
      end
    end

    return nil
  end

end
