class CreateProductForItem < ActiveRecord::Migration[7.0]
  def up
    Item.all.each do |item|
      product = item.products.build
      product.save!
    end
  end

  def down
    Product.all.each do |product|
      if product.variant.nil?
        product.destroy!
      end
    end
  end
end
