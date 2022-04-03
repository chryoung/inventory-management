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

  def self.index_all
    Inventory
      .select("inventories.*, COALESCE(SUM(consume_histories.quantity), 0) AS total_consumption")
      .includes(:unit, :storage, product: [:item])
      .left_joins(:consume_histories)
      .group("inventories.id, products.id, items.id, units.id, storages.id")
      .references(:unit, :storage, :product, :item)
  end

  def self.all_in_stock
    Inventory
      .index_all
      .having("COALESCE(SUM(consume_histories.quantity), ?) < inventories.quantity", 0)
  end

  def self.all_in_stock_order_by_item_id
    Inventory
      .index_all
      .having("COALESCE(SUM(consume_histories.quantity), ?) < inventories.quantity", 0)
      .order("products.item_id")
  end

  def self.all_exhausted
    Inventory
      .index_all
      .having("COALESCE(SUM(consume_histories.quantity), 0) >= inventories.quantity")
  end

  def total_price
    if price.present? and quantity.present?
      (price * quantity).round(2, ROUND_UP)
    else
      0
    end
  end

  def total_price=(value)
    if quantity.present?
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

    quantity
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

    nil
  end

  def total_consumption
    self.attributes["total_consumption"] || consume_histories.sum(:quantity)
  end

  def left_quantity
    quantity - total_consumption
  end

  def exhausted?
    left_quantity <= 0
  end
end
