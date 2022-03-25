class InventoriesController < ApplicationController
  before_action :set_inventory, only: %i[ show edit update destroy ]

  # GET /inventories or /inventories.json
  def index
    @inventories = Inventory.all
  end

  # GET /inventories/1 or /inventories/1.json
  def show
  end

  # GET /inventories/new
  def new
    @inventory = Inventory.new
  end

  # GET /inventories/1/edit
  def edit
  end

  # POST /inventories or /inventories.json
  def create
    @inventory = Inventory.new(inventory_params)

    respond_to do |format|
      if @inventory.save
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully created." }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inventories/1 or /inventories/1.json
  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to inventory_url(@inventory), notice: "Inventory was successfully updated." }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inventories/1 or /inventories/1.json
  def destroy
    @inventory.destroy

    respond_to do |format|
      format.html { redirect_to inventories_url, notice: "Inventory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inventory_params
      permitted_params = params.require(:inventory).permit(:item_id, :quantity, :unit_id, :total_price, :storage_id, :in_stock_on, :produced_on, :expire_on, shelf_life: [:number, :date_unit])

      shelf_life = permitted_params[:shelf_life][:number].to_i
      if permitted_params[:shelf_life][:date_unit] == "month"
        shelf_life *= 30
      elsif permitted_params[:shelf_life][:date_unit] == "year"
        shelf_life *= 365
      end

      expire_on = permitted_params[:expire_on]
      if expire_on.nil? and not permitted_params[:produced_on].nil?
        expire_on = permitted_params[:produced_on] + shelf_life
      end

      new_params = permitted_params.to_hash
      new_params["shelf_life"] = shelf_life
      new_params["expire_on"] = expire_on
      new_params["price"] = new_params.fetch(:total_price, 0) / new_params.fetch(:quantity, 1)
      new_params.delete "total_price"

      return new_params
    end
end
