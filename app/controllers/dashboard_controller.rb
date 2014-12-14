class DashboardController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:entries) { current_user.entries.where("date > ?", days_ago) }

  def index
    gon.chart_data = ChartDataGenerator.new(entries).generate
  end

  private

  def days_ago
    (params[:days] || 100).to_i.days.ago
  end
end
