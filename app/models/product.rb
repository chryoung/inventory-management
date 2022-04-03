class Product < ApplicationRecord
  belongs_to :item, touch: true
  has_many :inventories
  validates :variant, uniqueness: { scope: :item_id, message: I18n.t("A same variant has been defined for this item.") }

  def name
    if variant.present?
      "#{variant}#{item.name}"
    else
      item.name
    end
  end

  def self.group_for_select
    group = {}
    Item.all.each do |item|
      unless item.products.empty?
        group[item.name] = item.products.map do |prod|
          [prod.name, prod.id]
        end
      end
    end

    group
  end

  def in_stock_inventories
    Inventory.all_in_stock.where(product_id: id)
  end
end
