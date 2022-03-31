class ConsumeHistoriesController < ApplicationController
  before_action :set_inventory, only: %i[ index new show create ]
  before_action :set_consume_history, only: %i[ edit update destroy update ]

  def index
    @consume_histories = @inventory.consume_histories
  end

  def new
    @consume_history = @inventory.consume_histories.build consume_on: Date.today
  end

  def edit
    @inventory = @consume_history.inventory
  end

  def show
    @consume_history = ConsumeHistory.find(params[:id])
  end

  def create
    @consume_history = @inventory.consume_histories.build(consume_history_params)

    respond_to do |format|
      if @consume_history.save
        format.html { redirect_to inventory_url(@inventory), notice: "Consume history was successfully created." }
        format.json { render :show, status: :created, location: @consume_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consume_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @consume_history.update(consume_history_params)
        format.html { redirect_to inventory_url(@consume_history.inventory), notice: "Consume history was successfully updated." }
        format.json { render :show, status: :ok, location: @consume_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consume_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    inventory = @consume_history.inventory
    @consume_history.destroy

    respond_to do |format|
      format.html { redirect_to inventory_url(inventory), status: :see_other, notice: "Consume history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consume_history
      @consume_history = ConsumeHistory.find(params[:id])
    end

    def set_inventory
      @inventory = Inventory.find(params[:inventory_id])
    end

    # Only allow a list of trusted parameters through.
    def consume_history_params
      params.require(:consume_history).permit(:consume_on, :quantity)
    end
end
