class DashboardController < ApplicationController
  def index
    @lock_down_date = Date.new(2022, 4, 1)
    @unlock_down_date = Date.new(2022, 4, 5)
  end
end
