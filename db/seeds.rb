units = Unit.create!([{name: "kg"}, {name: "g"}, {name: "mL"}, {name: "L"}])
items = Item.create!([{name: "Apple"}, {name: "Banana"}, {name: "Avocado"}, {name: "Orange"}])
items.each do |item|
  item.products.build.save!
end
storages = Storage.create!([{location: "Refrigerator"}, {location: "Cupboard"}])
produced_on = Date.today
Inventory.create!([
  {
    product: items.first.products.first,
    quantity: 1,
    unit: units.first,
    total_price: 99,
    storage: storages.first,
    shelf_life: 7,
    shelf_life_unit: 3,
    produced_on: produced_on,
    expire_on: produced_on + 1.year,
    in_stock_on: produced_on,
    is_in_stock: true
  }
])

