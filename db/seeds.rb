units = Unit.create([{name: "kg"}, {name: "g"}, {name: "mL"}, {name: "L"}])
items = Item.create([{name: "Apple"}, {name: "Banana"}, {name: "Avocado"}, {name: "Orange"}])
items.each do |item|
  item.products.build.save!
end
storages = Storage.create([{name: "Refrigerator"}, {name: "Cupboard"}])
Inventory.create([
  {
    product: items.first.products.first,
    quantity: 1,
    unit: units.first,
    total_price: 99,
    storage: storages.first,

])

