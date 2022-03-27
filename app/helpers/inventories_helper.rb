module InventoriesHelper
  def quantity_style(inventory)
    if inventory.current_quantity == 0
      "line-through"
    else
      ""
    end
  end
end
