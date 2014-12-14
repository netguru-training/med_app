class DashboardController < ApplicationController

  before_action :authenticate_user!

  expose(:health_warning) { HealthWarning.new(current_user).check_sugar }

  expose_decorated(:entries) { current_user.entries.where("date > ?", days_ago) }
  expose(:chartform) { ChartForm.new(chart_params[:type], chart_params[:days]) }
  expose_decorated(:entry)
  expose(:user) do
    if params[:user_id].present?
      User.find(params[:user_id])
    else
      current_user
    end
  end

  def index
    chart_data = ChartDataGenerator.new(entries).generate

    respond_to do |format|
      format.html
      format.json { render json: chart_data }
    end
  end

  def chart_params
    params.fetch(:chart_form, {} )
  end

  private

  def days_ago
    (chart_params[:days] || 30).to_i.days.ago
  end
end
