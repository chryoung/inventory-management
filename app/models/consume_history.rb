class ConsumeHistory < ApplicationRecord
  belongs_to :inventory, touch: true

  validates :quantity, numericality: { greater_than: 0 }
  validate :ensure_not_consume_before_production
  validate :ensure_not_overconsume

  after_save :set_inventory_is_in_stock_after_save
  after_destroy :set_inventory_is_in_stock_after_destory

  private

    def set_inventory_is_in_stock_after_save
      inventory.update!(is_in_stock: inventory.total_consumption < inventory.quantity)
    end

    def set_inventory_is_in_stock_after_destory
      inventory.update!(is_in_stock: inventory.total_consumption < inventory.quantity)
    end

    def ensure_not_consume_before_production
      if inventory.produced_on.present? and consume_on < inventory.produced_on
        errors.add :quantity, I18n.t("consume_histories.validates_error.consume_after_production_error")
      end
    end

    def ensure_not_overconsume
      was = quantity_was || 0
      now = quantity || 0
      diff = now - was
      if diff > 0 and inventory.total_consumption + diff > inventory.quantity
        errors.add :quantity, I18n.t("consume_histories.validates_error.over_consume_error")
      end
    end
end

