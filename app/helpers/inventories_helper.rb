module InventoriesHelper
  def quantity_style(inventory)
    if inventory.total_consumption >= inventory.quantity
      "line-through"
    else
      ""
    end
  end

  def index_type
    if params[:exhausted] == "1"
      t("inventories.index_type.out_of_stock")
    elsif params[:all] == "1"
      t("inventories.index_type.all")
    else
      t("inventories.index_type.in_stock")
    end
  end
end
