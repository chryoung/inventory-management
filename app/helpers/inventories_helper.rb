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
      t("Out of Stock")
    elsif params[:all] == "1"
      t("All")
    else
      t("In Stock")
    end
  end
end
