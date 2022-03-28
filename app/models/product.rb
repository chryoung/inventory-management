class Product < ApplicationRecord
  belongs_to :item
  has_many :inventories

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
end
