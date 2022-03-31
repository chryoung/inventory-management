class OverConsumeValidator < ActiveModel::Validator
  def validate(record)
    if record.quantity + record.inventory.total_consumption > record.inventory.quantity
      record.errors.add :base, I18n.t(:over_consume_error, scope: [:models, :consume_history, :validator])
    end

    if record.inventory.produced_on.present? and record.consume_on < record.inventory.produced_on
      record.errors.add :base, I18n.t(:consume_before_production_error, scope: [:models, :consume_history, :validator])
    end
  end
end

class ConsumeHistory < ApplicationRecord
  belongs_to :inventory, touch: true

  validates :quantity, numericality: { greater_than: 0 }
  validates_with OverConsumeValidator
end

