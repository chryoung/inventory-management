class Inventory < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :unit
  belongs_to :storage
  has_many :consume_histories, dependent: :destroy

  validates :in_stock_on, comparison: { greater_than_or_equal_to: :produced_on }
  validates :quantity, presence: true

  enum shelf_life_unit: {
    "Year" => 1,
    "Month" => 2,
    "Day" => 3
  }

  validates :shelf_life_unit, inclusion: shelf_life_units.keys

  def self.all_in_stock
    Inventory
      .left_joins(:consume_histories)
      .group("inventories.id")
      .having("COALESCE(SUM(consume_histories.quantity), 0) < inventories.quantity")
  end

  def self.all_exhausted
    Inventory
      .left_joins(:consume_histories)
      .group("inventories.id")
      .having("COALESCE(SUM(consume_histories.quantity), 0) >= inventories.quantity")
  end

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

  def total_consumption
    consume_histories.sum(:quantity)
  end

  def left_quantity
    quantity - total_consumption
  end
end
