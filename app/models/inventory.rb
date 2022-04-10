class Inventory < ApplicationRecord
  belongs_to :product, touch: true
  belongs_to :unit
  belongs_to :storage
  has_many :consume_histories, dependent: :destroy

  before_save :set_expire_on

  validates :in_stock_on, comparison: { greater_than_or_equal_to: :produced_on }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :price, numericality: { greater_than_or_equal_to: 0 }

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
      .where(is_in_stock: true)
  end

  def self.all_exhausted
    Inventory
      .index_all
      .where(is_in_stock: false)
  end

  def total_price
    if price.present? and quantity.present?
      (price * quantity).round(2, BigDecimal::ROUND_UP)
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

  def expired?
    expire_on.present? and expire_on < Date.today
  end

  def total_consumption
    self.attributes["total_consumption"] || consume_histories.sum(:quantity)
  end

  def left_quantity
    quantity - total_consumption
  end

  def left_percentage
    (left_quantity / quantity * 100).round(2, BigDecimal::ROUND_UP)
  end

  private
    def set_expire_on
      if produced_on.present? and shelf_life.present?
        self.expire_on = if self.Year?
                           produced_on + shelf_life.years
                         elsif self.Month?
                           produced_on + shelf_life.months
                         else
                           produced_on + shelf_life.days
                         end
      end
    end
end
