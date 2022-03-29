class ConsumeHistoriesController < ApplicationController
  before_action :set_consume_history, only: %i[ show edit update destroy ]

  # GET /consume_histories/new
  def new
    @consume_history = ConsumeHistory.new
  end

  # GET /consume_histories/1/edit
  def edit
  end

  # POST /consume_histories or /consume_histories.json
  def create
    @consume_history = ConsumeHistory.new(consume_history_params)

    respond_to do |format|
      if @consume_history.save
        format.html { redirect_to consume_history_url(@consume_history), notice: "Consume history was successfully created." }
        format.json { render :show, status: :created, location: @consume_history }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @consume_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /consume_histories/1 or /consume_histories/1.json
  def update
    respond_to do |format|
      if @consume_history.update(consume_history_params)
        format.html { redirect_to consume_history_url(@consume_history), notice: "Consume history was successfully updated." }
        format.json { render :show, status: :ok, location: @consume_history }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @consume_history.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /consume_histories/1 or /consume_histories/1.json
  def destroy
    @consume_history.destroy

    respond_to do |format|
      format.html { redirect_to consume_histories_url, notice: "Consume history was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_consume_history
      @consume_history = ConsumeHistory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def consume_history_params
      params.require(:consume_history).permit(:inventory_id, :consume_on, :quantity)
    end
end
