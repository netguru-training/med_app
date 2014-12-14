class DashboardController < ApplicationController

  before_action :authenticate_user!


  expose(:user) do
    if params[:user_id].present?
      User.find(params[:user_id])
    else
      current_user
    end
  end
  expose_decorated(:entries) { user.entries.where("date > ?", days_ago) }

  def index
    chart_data = ChartDataGenerator.new(entries).generate

    respond_to do |format|
      format.html
      format.json { render json: chart_data }
    end
  end

  private

  def days_ago
    (params[:days] || 100).to_i.days.ago
  end
end
