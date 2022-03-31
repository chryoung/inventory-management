class ConsumeHistory < ApplicationRecord
  belongs_to :inventory, touch: true
end
