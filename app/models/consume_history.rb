class OverConsumeValidator < ActiveModel::Validator
  def validate(record)
    if record.quantity + record.inventory.total_consumption > record.inventory.quantity
      error_message = "The consuming quantity exceeds the current quantity."
      record.errors.add :base, I18n.t(error_message, default: error_message)
    end

    if record.inventory.produced_on.present? and record.consume_on < record.inventory.produced_on
      error_message = "The product cannot be consumed before it was produced."
      record.errors.add :base, I18n.t(error_message, default: error_message)
    end
  end
end

class ConsumeHistory < ApplicationRecord
  belongs_to :inventory, touch: true

  validates :quantity, numericality: { greater_than: 0 }
  validates_with OverConsumeValidator
end

