class DashboardController < ApplicationController
  def index
    @in_stock_expired = Inventory.index_all.where(is_in_stock: true).where('expire_on < ?', Date.today)
    @recently_consumed = ConsumeHistory.all.order(consume_on: :desc).limit(10).map { |ch| ch.inventory }
  end
end
