class DashboardController < ApplicationController

  before_action :authenticate_user!

  expose_decorated(:entries) { current_user.entries }

  def index
    gon.chart_data = ChartDataGenerator.new(entries).generate
  end

end
