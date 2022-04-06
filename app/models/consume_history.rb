class ConsumeHistory < ApplicationRecord
  belongs_to :inventory, touch: true

  validates :quantity, numericality: { greater_than: 0 }
  validate :ensure_not_consume_before_production
  validate :ensure_not_overconsume

  private
    def ensure_not_consume_before_production
      if inventory.produced_on.present? and consume_on < inventory.produced_on
        errors.add :quantity, I18n.t("consume_histories.validates_error.consume_before_production_error")
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

